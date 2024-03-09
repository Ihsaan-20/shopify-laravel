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
            // Extract the hmac parameter from the request
            $hmac = $request['hmac'];
            unset($request['hmac']); // Remove hmac from the request array
            
            // Prepare the request parameters for hmac validation
            $arr = [];
            foreach ($request as $key => $value) {
                $key = str_replace("%", "%25", $key);
                $key = str_replace("&", "%26", $key);
                $key = str_replace("=", "%3D", $key);
                $value = str_replace("%", "%25", $value);
                $value = str_replace("&", "%26", $value);
                $arr[] = $key . "=" . $value;
            }
            $str = implode('&', $arr);
            
            // Calculate hmac using Shopify API secret
            $ver_hmac = hash_hmac('sha256', $str, config('custom.shopify_api_secret'), false);
            
            // Compare calculated hmac with the received hmac
            return $ver_hmac === $hmac;
        } catch (Exception $e) {
            Log::info('Problem with verify hmac from request');
            Log::info($e->getMessage() . ' ' . $e->getLine());
            return false;
        }
    }
    
}
