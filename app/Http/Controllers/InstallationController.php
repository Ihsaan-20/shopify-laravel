<?php

namespace App\Http\Controllers;

use App\Jobs\Shopify\ConfigureWebhooks;
use App\Mail\InstallComplete;
use App\Models\Store;
use App\Models\User;
use App\Traits\FunctionTrait;
use App\Traits\RequestTrait;
use Exception;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Throwable;

class InstallationController extends Controller {
    private $api_scopes, $api_key, $api_secret;

    public function __construct() {
        $this->api_scopes = implode(',', config('custom.api_scopes'));
        $this->api_key = config('custom.shopify_api_key');
        $this->api_secret = config('custom.shopify_api_secret');
    }

    use FunctionTrait, RequestTrait;

    /**
     * Three scenarios can happen
     * New installation
     * Re-installation
     * Opening the app
     */
    
     public function startInstallation(Request $request) {
        try {
            $validRequest = $this->validateRequestFromShopify($request->all());
            if($validRequest) { 
                $shop = $request->has('shop'); // Check if shop parameter exists on the request.
                if($shop) {
                    // Assuming getStoreByDomain retrieves store details from your database
                    $storeDetails = $this->getStoreByDomain($request->shop);
                    if($storeDetails !== null && $storeDetails !== false) {
                        // Store record exists, now determine whether the access token is valid or not
                        $validAccessToken = $this->checkIfAccessTokenIsValid($storeDetails);
                        if($validAccessToken) {
                            // Token is valid for Shopify API calls, so redirect them to the login page.
                            print_r("Token is valid for Shopify API calls so redirect them to the login page.");
                            // Assuming this is where you would redirect the user to the login page
                        } else {
                            // Access token is not valid, initiate the installation flow
                            $endpoint = 'https://' . $request->shop .
                                '/admin/oauth/authorize?client_id=' . $this->api_key .
                                '&scope=' . $this->api_scopes .
                                '&redirect_uri=' . route('app_install_redirect');
                            return Redirect::to($endpoint);
                        }
                    } else {
                        // Store details not found, initiate the installation flow
                        $endpoint = 'https://' . $request->shop .
                            '/admin/oauth/authorize?client_id=' . $this->api_key .
                            '&scope=' . $this->api_scopes .
                            '&redirect_uri=' . route('app_install_redirect');
                        return Redirect::to($endpoint);
                    }
                } else {
                    throw new Exception('Shop parameter not present in the request');
                }
            } else {
                throw new Exception('Request is not valid!');
            }
        } catch(Exception $e) {
            Log::info($e->getMessage() . ' ' . $e->getLine());
            dd($e->getMessage() . ' ' . $e->getLine());
        }
    }
    

    public function handleRedirect(Request $request) {
        try {
            $validRequest = $this->validateRequestFromShopify($request->all());
            if($validRequest) {
                if($request->has('shop') && $request->has('code')) {
                    $shop = $request->shop;
                    $code = $request->code;
                    $accessToken = $this->requestAccessTokenFromShopifyForThisStore($shop, $code);
                    if($accessToken !== false && $accessToken !== null) {
                        $shopDetails = $this->getShopDetailsFromShopify($shop, $accessToken);
                        $storeDetails = $this->saveStoreDetailsToDatabase($shopDetails, $accessToken);
                        if($storeDetails) {  
                            // Installation process is complete
                            print_r("Installation process is complete.");
                            // Assuming you want to redirect or perform further actions here
                        } else {
                            // Error occurred during saving shop details to the database
                            Log::info('Problem during saving shop details into the database');
                            Log::info($storeDetails);
                            dd('Problem during installation. Please check logs.');
                        }
                    } else {
                        throw new Exception('Invalid Access Token ' . $accessToken);
                    }
                } else {
                    throw new Exception('Code / Shop param not present in the URL');
                }
            } else {
                throw new Exception('Request is not valid!');
            }
        } catch(Exception $e) {
            Log::info($e->getMessage() . ' ' . $e->getLine());
            dd($e->getMessage() . ' ' . $e->getLine());
        }
    }
    

    public function saveStoreDetailsToDatabase($shopDetails, $accessToken) {
        try {
            // Prepare payload for storing in the database
            $payload = [
                'access_token' => $accessToken,
                'myshopify_domain' => $shopDetails['myshopify_domain'],
                'id' => $shopDetails['id'],
                'email' => $shopDetails['email'],
                'name' => $shopDetails['name'],
                'phone' => $shopDetails['phone'],
                'address1' => $shopDetails['address1'],
                'address2' => $shopDetails['address2'],
                'zip' => $shopDetails['zip']
            ];
    
            // Update or create a record in the 'stores' table
            $store_db = Store::updateOrCreate(['myshopify_domain' => $shopDetails['myshopify_domain']], $payload);
    
            // Generate a random password
            $random_password = '123456';
            Log::info('Password generated ' . $random_password); 
    
            // Prepare payload for creating or updating a user
            $user_payload = [
                'email' => $shopDetails['email'],
                'password' => bcrypt($random_password),
                'store_id' => $store_db->table_id, // Assuming 'table_id' is the primary key of the 'stores' table
                'name' => $shopDetails['name']
            ];
    
            // Update or create a user with the provided email address
            $user = User::updateOrCreate(['email' => $shopDetails['email']], $user_payload);
    
            // Mark the user's email as verified
            $user->markEmailAsVerified();
    
            // Assign 'Admin' role to the user
            $user->assignRole('Admin');
    
            // Give default permissions to the user
            foreach(config('custom.default_permissions') as $permission) {
                $user->givePermissionTo($permission);
            }
    
            // Dispatch event to configure webhooks (if needed)
            // ConfigureWebhooks::dispatch($store_db->table_id);
    
            // Register for fulfillment service (assuming this is a custom method)
            $this->registerForFulfillmentService($store_db);
    
            // Flash success message
            Session::flash('success', 'Installation for your store '.$shopDetails['name'].' has completed and the credentials have been sent to '.$shopDetails['email'].'. Please login.');
    
            // Send installation completion email (commented out)
            // Mail::to($shopDetails['email'])->send(new InstallComplete($user_payload, $random_password));
    
            // Return the stored store details
            return $store_db;
        } catch(Exception $e) {
            // Log and return false in case of an exception
            Log::info($e->getMessage() . ' ' . $e->getLine());
            return false;
        }
    }
    

    public function registerForFulfillmentService($store) {
        try {
            $endpoint = getShopifyURLForStore('fulfillment_services.json', $store->toArray());
            $headers = getShopifyHeadersForStore($store->toArray());
            $body = [
                "fulfillment_service" => [
                    "name" => config('custom.fulfillment_service_name'),
                    "callback_url" => route('service_callback'),
                    "inventory_management" => true,
                    "tracking_support" => true,
                    "fulfillment_orders_opt_in" => true,
                    "requires_shipping_method" => true,
                    "format" => "json"
                ]
            ];
            $response = $this->makeAnAPICallToShopify('POST', $endpoint, null, $headers, $body);
            $store->update(['fulfillment_service_response' => json_encode($response)]);
            if(isset($response['statusCode']) && $response['statusCode'] == 201)
                $store->update(['fulfillment_service' => true, 'fulfillment_orders_opt_in' => true]);
            Log::info('Response received from shopify for fulfillment service creation ');
            Log::info($response);

        } catch(Exception $e) {
            Log::info('FS '.$e->getMessage().' '.$e->getLine());
        
        } catch(Throwable $e) {
            Log::info('FS '.$e->getMessage().' '.$e->getLine());
        }
    }

    private function getShopDetailsFromShopify($shop, $accessToken) {
        try {
            // Construct the endpoint URL for fetching shop details
            $endpoint = getShopifyURLForStore('shop.json', ['myshopify_domain' => $shop]);
    
            // Prepare headers for the API request
            $headers = getShopifyHeadersForStore(['access_token' => $accessToken]);
    
            // Make a GET request to Shopify API
            $response = $this->makeAnAPICallToShopify('GET', $endpoint, null, $headers);
    
            // Check if the response status code is 200 (OK)
            if($response['statusCode'] == 200) {
                // Parse the response body
                $body = $response['body'];
                Log::info($body);
                
                // Decode the JSON response body
                if(!is_array($body)) {
                    $body = json_decode($body, true);
                }
    
                // Return the 'shop' details from the response body
                return $body['shop'] ?? null;
            } else {
                // Log the response if status code is not 200
                Log::info('Response received for shop details');
                Log::info($response);
                return null;
            }
        } catch(Exception $e) {
            // Log and return null in case of an exception
            Log::info('Problem getting the shop details from Shopify');
            Log::info($e->getMessage() . ' ' . $e->getLine());
            return null;
        }
    }
    

    private function requestAccessTokenFromShopifyForThisStore($shop, $code) {
        try {
            // Construct the endpoint URL for requesting access token
            $endpoint = 'https://' . $shop . '/admin/oauth/access_token';
    
            // Prepare headers for the API request
            $headers = ['Content-Type: application/json'];
    
            // Prepare the request body
            $requestBody = json_encode([
                'client_id' => $this->api_key,
                'client_secret' => $this->api_secret,
                'code' => $code
            ]);
    
            // Make a POST request to Shopify API to get access token
            $response = $this->makeAPOSTCallToShopify($requestBody, $endpoint, $headers);
    
            // Check if the response status code is 200 (OK)
            if($response['statusCode'] == 200) {
                // Parse the response body
                $body = $response['body'];
                
                // Decode the JSON response body
                if(!is_array($body)) {
                    $body = json_decode($body, true);
                }
                
                // Check if the access token exists in the response body
                if(is_array($body) && isset($body['access_token']) && $body['access_token'] !== null) {
                    return $body['access_token']; // Return the access token
                }
            }
    
            // If access token is not found or response status code is not 200, return null
            return null;
        } catch(Exception $e) {
            // Log and return false in case of an exception
            return false;
        }
    }
    

    /**
       * Write some code here that will use the Guzzle library to fetch the shop object from Shopify API
       * If it succeeds with 200 status then that means its valid and we can return true;        
     */

     private function checkIfAccessTokenIsValid($storeDetails) {
        try {
            // Check if $storeDetails is not null and access_token exists and is not empty
            if($storeDetails !== null && isset($storeDetails->access_token) && strlen($storeDetails->access_token) > 0) {
                // Get the access token
                $token = $storeDetails->access_token;
                
                // Construct the endpoint URL for checking token validity
                $endpoint = getShopifyURLForStore('shop.json', $storeDetails);
                
                // Prepare headers for the API request
                $headers = getShopifyHeadersForStore($storeDetails);
                
                // Make a GET request to Shopify API to check token validity
                $response = $this->makeAnAPICallToShopify('GET', $endpoint, null, $headers, null);
                
                // Return true if response status code is 200 (OK), indicating token is valid
                return $response['statusCode'] === 200;
            }
            
            // If storeDetails is null or access_token is empty, return true
            // Alternatively, you might want to return false in this case if you want to strictly check token validity
            return true;
        } catch(Exception $e) {
            // Log and return false in case of an exception
            return false;
        }
    }
    

}
