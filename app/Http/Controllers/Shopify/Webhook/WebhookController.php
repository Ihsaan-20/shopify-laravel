<?php

namespace App\Http\Controllers\Shopify\Webhook;

use App\Models\Order;
use Illuminate\Http\Request;
use Gnikyt\BasicShopifyAPI\Options;
use Gnikyt\BasicShopifyAPI\Session;
use App\Http\Controllers\Controller;
use Gnikyt\BasicShopifyAPI\BasicShopifyAPI;

class WebhookController extends Controller
{
    public function createWebHook()
    {
        // return 'ok';
        $options = new Options();
        $options->setVersion('unstable');

        $api = new BasicShopifyAPI($options);
        $shopifyStore = 'quickstart-eaa7987a.myshopify.com';
        $apiPassword = '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';

        $api->setSession(new Session($shopifyStore, $apiPassword));
        $response = $api->rest('GET', '/admin/webhooks.json');
        
        
        $webhook = [
            "webhook" => [
                "address"=> "https://elementary-solutions.com/gym_app_new/public/shopify/order.php",
                "topic"=> "products/create",
                "format"=> "json"
                ]
            ];
        $send = ['webhook' => $webhook];
        // $response = $api->rest('POST', '/admin/webhooks.json', $webhook);
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
