<?php

namespace App\Traits;

use App\Models\Store;
use Exception;
use Illuminate\Support\Facades\Log;

trait FunctionTrait {

    public function getStoreByDomain($shop) {
        return Store::where('myshopify_domain', $shop)->first();
    }   

    public function validateRequestFromShopify($request) {
        try {
            // Log the request data received from Shopify
            Log::info('Received request data from Shopify:');
            Log::info($request);
    
            // Ensure all required parameters are present
            if (!isset($request['hmac']) || !isset($request['shop']) || !isset($request['timestamp'])) {
                Log::error('Missing required parameters in the request.');
                return false;
            }
    
            // Extract parameters from the request
            $hmac = $request['hmac'];
            $shop = $request['shop'];
            $timestamp = $request['timestamp'];
    
            // Validate timestamp - Check if the timestamp is within an acceptable range
            $currentTimestamp = time();
            $maxTimestampDifference = 300; // 5 minutes (adjust as needed)
            if (abs($currentTimestamp - $timestamp) > $maxTimestampDifference) {
                Log::error('Timestamp is too old or too far in the future.');
                return false;
            }
    
            // Prepare data for HMAC validation
            $dataForHmac = "shop=$shop&timestamp=$timestamp";
    
            // Calculate HMAC
            $calculatedHmac = hash_hmac('sha256', $dataForHmac, config('custom.shopify_api_secret'));
    
            // Compare calculated HMAC with received HMAC
            if ($calculatedHmac === $hmac) {
                Log::info('Request HMAC validation successful.');
                return true;
            } else {
                Log::error('HMAC validation failed. Calculated HMAC: ' . $calculatedHmac . ', Received HMAC: ' . $hmac);
                return false;
            }
        } catch (Exception $e) {
            Log::error('Error validating request from Shopify: ' . $e->getMessage());
            return false;
        }
    }
    
    
    
    // public function validateRequestFromShopify($request) {
    //     try {
    //         // Extract the hmac parameter from the request
    //         $hmac = $request['hmac'];
    //         unset($request['hmac']); // Remove hmac from the request array
            
    //         // Prepare the request parameters for hmac validation
    //         $arr = [];
    //         foreach ($request as $key => $value) {
    //             $key = str_replace("%", "%25", $key);
    //             $key = str_replace("&", "%26", $key);
    //             $key = str_replace("=", "%3D", $key);
    //             $value = str_replace("%", "%25", $value);
    //             $value = str_replace("&", "%26", $value);
    //             $arr[] = $key . "=" . $value;
    //         }
    //         $str = implode('&', $arr);
            
    //         // Calculate hmac using Shopify API secret
    //         $ver_hmac = hash_hmac('sha256', $str, config('custom.shopify_api_secret'), false);
            
    //         // Compare calculated hmac with the received hmac
    //         return $ver_hmac === $hmac;
    //     } catch (Exception $e) {
    //         Log::info('Problem with verify hmac from request');
    //         Log::info($e->getMessage() . ' ' . $e->getLine());
    //         return false;
    //     }
    // }
    
}
