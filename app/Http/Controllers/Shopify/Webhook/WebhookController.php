<?php

namespace App\Http\Controllers\Shopify\Webhook;

use App\Models\Order;
use Illuminate\Http\Request;
use Gnikyt\BasicShopifyAPI\Options;
use Gnikyt\BasicShopifyAPI\Session;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Gnikyt\BasicShopifyAPI\BasicShopifyAPI;
use App\Models\Testing;

class WebhookController extends Controller
{

    public function handleProductUpdate(Request $request)
    {
        // dd('checking');
        $payload = $request->all();
        Log::info($payload);
        Testing::create([
            'response' => $payload
        ]);
        return response()->json(['status' => 'success'], 200);
    }

    public function handleProductCreate(Request $request)
    {

        $payload = $request->all();
        Log::info($payload);
        Testing::create([
            'response' => $payload
        ]);
        
        return response()->json(['status' => 'success'], 200);
    }


    public function createWebHook()
    {
        $options = new Options();
        $options->setVersion('2024-01');
        $api = new BasicShopifyAPI($options);
        $shopifyStore = 'quickstart-eaa7987a.myshopify.com';
        $apiPassword = env('SHOPIFY_ACCESS_TOKEN');

        $api->setSession(new Session($shopifyStore, $apiPassword));
        // $response = $api->rest('POST', '/admin/webhooks.json');
        
        
        $webhook = [
            "webhook" => [
                "address"=> "https://elementary-solutions.com/shopify_store/public/webhook/orders-update",
                "topic"=> "orders/update",
                "format"=> "json"
                ]
            ];
        $send = ['webhook' => $webhook];
        $response = $api->rest('POST', '/admin/webhooks.json', $webhook);
        // if(!isset($response['body']['webhooks']))
        // {
        //     return null;
        // }

        // $webhooks = $response['body']['webhooks'];


        // foreach($orders as $o)
        // {
        //     $result = Order::create([
        //         'response' => json_encode($o)
        //     ]);  
        // }

              
        dd([$result??null, $response??null]);
    }

    public function getAllWebHook()
    {
        $options = new Options();
        $options->setVersion('unstable');

        $api = new BasicShopifyAPI($options);
        $shopifyStore = 'quickstart-eaa7987a.myshopify.com';
        $apiPassword = env('SHOPIFY_ACCESS_TOKEN');

        $api->setSession(new Session($shopifyStore, $apiPassword));
        $response = $api->rest('GET', '/admin/webhooks.json');
        dd($response??null);
    }


    public function handle(Request $request)
    {
        define('CLIENT_SECRET', '312be2ef4318c0d9c05e6e7d5975cf6a');
        function verify_webhook($data, $hmac_header)
        {
        $calculated_hmac = base64_encode(hash_hmac('sha256', $data, CLIENT_SECRET, true));
        return hash_equals($calculated_hmac, $hmac_header);
        }

        $hmac_header = $_SERVER['HTTP_X_SHOPIFY_HMAC_SHA256'];
        $data = file_get_contents('php://input');
        $verified = verify_webhook($data, $hmac_header);
        error_log('Webhook verified: '.var_export($verified, true)); // Check error.log to see the result
        if ($verified) {
            $response = $data;
            if(isset($response))
            {
                Log::info('data received');
            }
        # Process webhook payload
        # ...
        } else {
        http_response_code(401);
        }
    }

}
