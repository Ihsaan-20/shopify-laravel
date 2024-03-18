<?php

namespace App\Http\Controllers\Shopify\Webhook;

use Illuminate\Http\Request;
use App\Jobs\ProcessShopifyWebhook;
use App\Models\Testing;
use Gnikyt\BasicShopifyAPI\Options;
use Gnikyt\BasicShopifyAPI\Session;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;
use Gnikyt\BasicShopifyAPI\BasicShopifyAPI;

class WebhookController extends Controller
{
    public function handleShopifyWebhook(Request $request)
    {

        ProcessShopifyWebhook::dispatch($request->all());
        return response()->json(['success' => true], 200);
    }

    
    public function handleProductUpdate(Request $request)
    {
        if (!$this->verifyShopifyWebhook($request)) {
            return response()->json(['error' => 'Invalid webhook signature'], 401);
        }
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
        if (!$this->verifyShopifyWebhook($request)) {
            return response()->json(['error' => 'Invalid webhook signature'], 401);
        }
        $payload = "ihsaan";
        $test = new Testing();
        $test->response = $payload;
        $test->save();

        return response()->json(['status' => 'success'], 200);
    }

    protected function verifyShopifyWebhook(Request $request)
    {
        $hmacHeader = $request->header('X-Shopify-Hmac-Sha256');
        $data = $request->getContent();
        $calculatedHmac = base64_encode(hash_hmac('sha256', $data, '312be2ef4318c0d9c05e6e7d5975cf6a', true));

        return hash_equals($hmacHeader, $calculatedHmac);
    }

    public function ProductEvent()
{
    $client = new \GuzzleHttp\Client();
    $headers = [
        'X-Shopify-Access-Token' => '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',
        'Cookie' => '_master_udr=eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaEpJaWxtWTJJMk1UUTNOUzFrTlRobExUUmpNVEV0WVRSa05pMDVOR0V4WXpJNU9UWXdabVVHT2daRlJnPT0iLCJleHAiOiIyMDI2LTAzLTA3VDEwOjI4OjU1LjM2N1oiLCJwdXIiOiJjb29raWUuX21hc3Rlcl91ZHIifX0%3D--bc5f5d672ee6920955a662b35f054a6cf4eb43df; _secure_admin_session_id=96b719ebcd426e094e9c223d34e91425; _secure_admin_session_id_csrf=96b719ebcd426e094e9c223d34e91425; _landing_page=%2Fpassword; _orig_referrer=https%3A%2F%2F6caab75eb0bbcdb5d04f13c85b1d25e1%3A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%40quickstart-eaa7987a.myshopify.com%2Forder-creation%2Fweb-hook.json; _secure_session_id=2725a9d3f9fafc869c7e34e4c43f1e08; _shopify_y=d1135ea9-074e-45c9-8ec1-6236535ddf4e; _tracking_consent=%7B%22v%22%3A%222.1%22%2C%22reg%22%3A%22%22%2C%22region%22%3A%22PKSD%22%2C%22con%22%3A%7B%22CMP%22%3A%7B%22p%22%3A%22%22%2C%22m%22%3A%22%22%2C%22a%22%3A%22%22%2C%22s%22%3A%22%22%7D%7D%7D; cart_currency=PKR; localization=PK; secure_customer_sig='
    ];
    $request = new Request('GET', 'https://quickstart-eaa7987a.myshopify.com/admin/api/2023-10/events.json?filter=Product,Order', $headers);
    $response = $client->send($request);
    $data = json_decode($response->getBody(), true);
    $arr = [];

    // Loop through the events
    // foreach ($data['events'] as $d) {
    //     if (isset($d['id'])) {
    //         // Check if the event ID already exists in the database
    //         $check = ShopifyWebhookEvents::where('id', $d['id'])->first();
    //         if (!$check) {
    //             ShopifyWebhookEvents::create([
    //                 'id' => $d['id'],
    //                 'subject_id' => $d['subject_id'],
    //                 'subject_type' => $d['subject_type'],
    //                 'verb' => $d['verb'],
    //                 'arguments' => json_encode($d['arguments']),
    //                 'body' => $d['body'],
    //                 'message' => $d['message'],
    //                 'author' => $d['author'],
    //                 'description' => $d['description'],
    //                 'path' => $d['path'],
    //             ]);
    //             Log::info('Event stored successfully.');
    //         } else {
                
    //             $arr[] = $d;
    //             Log::info('Event stored successfully in array.');
    //             break;
    //         }
    //     }
    // }

    dd($data);
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

    

   

}
