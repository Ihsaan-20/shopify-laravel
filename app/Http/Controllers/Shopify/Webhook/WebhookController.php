<?php

namespace App\Http\Controllers\Shopify\Webhook;


use App\Models\Order;
use App\Models\Testing;
use Illuminate\Http\Request;
use Gnikyt\BasicShopifyAPI\Options;
use Gnikyt\BasicShopifyAPI\Session;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Gnikyt\BasicShopifyAPI\BasicShopifyAPI;

class WebhookController extends Controller
{

    // public function handleCustomersUpdate(Request $request)
    // {
    //     // Verify the webhook (see the next step)
        
    //     // Process the webhook data
    //     $data = $request->all();
    //     \Log::info('Webhook received:', $data);

    //     // Respond to Shopify to acknowledge receipt
    //     return response()->json(['status' => 'success'], 200);
    // }

    public function handleCustomersUpdate(Request $request)
    {
        if (!$this->verifyShopifyWebhook($request)) {
            return response()->json(['error' => 'Invalid webhook signature'], 401);
        }

        $data = $request->all();
        Log::info('Webhook received:', $data);
        return response()->json(['status' => 'success'], 200);
    }

    
    public function handleProductUpdate(Request $request)
    {
        Log::info("before");
        $payload = "ihsaan";
        $test = new Testing();
        $test->response = $payload;
        $test->save();
        Log::info("after");

        return response()->json(['status' => 'success'], 200);
    }

    public function handleProductCreate(Request $request)
    {

        $payload = "ihsaan";
        $test = new Testing();
        $test->response = $payload;
        $test->save();

        return response()->json(['status' => 'success'], 200);
    }


    public function createWebHook()
    {
        $options = new Options();
        $options->setVersion('2024-01');
        $api = new BasicShopifyAPI($options);
        $shopifyStore = 'quickstart-eaa7987a.myshopify.com';
        $apiPassword = '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';

        $api->setSession(new Session($shopifyStore, $apiPassword));
        // $response = $api->rest('POST', '/admin/webhooks.json');
        
        
        $webhook = [
            "webhook" => [
                "address"=> "https://elementary-solutions.com/shopify_store/public/webhook/customers-update",
                "topic"=> "customers/update",
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
        $apiPassword = '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';

        $api->setSession(new Session($shopifyStore, $apiPassword));
        $response = $api->rest('GET', '/admin/webhooks.json');
        dd($response??null);
    }

    protected function verifyShopifyWebhook(Request $request)
    {
        $hmacHeader = $request->header('X-Shopify-Hmac-Sha256');
        $data = $request->getContent();
        $calculatedHmac = base64_encode(hash_hmac('sha256', $data, env('SHOPIFY_SECRET'), true));

        return hash_equals($hmacHeader, $calculatedHmac);
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
