<?php

namespace App\Http\Controllers\Shopify\Order;
use Shopify\Utils;


// Gnikyt
use Shopify\Context;
use App\Models\Order;
use Shopify\Clients\Rest;



// use Shopify\Auth\FileSessionStorage;
// use Shopify\Auth\Session;

//Shopify PHP library installation
use Illuminate\Http\Request;
use App\Jobs\OrdersCreateJob;
use Signifly\Shopify\Shopify;
use Gnikyt\BasicShopifyAPI\Options;

use Gnikyt\BasicShopifyAPI\Session;
use Illuminate\Support\Facades\Log;

use App\Http\Controllers\Controller;
use Gnikyt\BasicShopifyAPI\BasicShopifyAPI;



class OrderController extends Controller
{
    public function hook(Request $request)
    {
        Log::info("before worked");
        // Handle webhook data here
        session()->put($request->all());
        Log::info("after worked");
    }


    public function getAllOrdersFromShopify()
    {

        $options = new Options();
        $options->setVersion('unstable');

        $api = new BasicShopifyAPI($options);
        $shopifyStore = 'quickstart-eaa7987a.myshopify.com';
        $apiPassword = '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';

        $api->setSession(new Session($shopifyStore, $apiPassword));
        $response = $api->rest('GET', '/admin/orders.json');

        if(!isset($response['body']['orders']))
        {
            return null;
        }

        $orders = $response['body']['orders'];


        foreach($orders as $o)
        {
            $result = Order::create([
                'response' => json_encode($o)
            ]);  
        }

              
        dd([$result??null, $orders??null]);


    }


    public function getAllOrdersFromShopifyTwo()
    {
        $options = new Options();
        $options->setVersion('unstable');

        $api = new BasicShopifyAPI($options);
        $shopifyStore = 'quickstart-eaa7987a.myshopify.com';
        $apiPassword = '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';

        $api->setSession(new Session($shopifyStore, $apiPassword));

        // $order = [
        //     "line_items" => [
        //         [
        //             "title" => "Big Brown Bear Boots 3", 
        //             "price" => 74.99, 
        //             "grams" => "1300", 
        //             "quantity" => 3, 
        //             "tax_lines" => [
        //                 [
        //                     "price" => 13.5, 
        //                     "rate" => 0.06, 
        //                     "title" => "State tax"
        //                 ]
        //             ]
        //         ]
        //     ],
        //     "transactions" => [
        //         [
        //             "kind" => "sale",
        //             "status" => "success",
        //             "amount" => 238.47
        //         ]
        //     ],
        //     "total_tax" => 13.5,
        //     "currency" => "EUR",
        //     "customer" => [
        //         "id" => 7211245764758,
        //         "email" => "muhammad@gmail.com",//dynamic
        //         "created_at" => "2024-02-28T13:00:20-05:00",
        //         "updated_at" => "2024-03-05T00:16:17-05:00",
        //         "first_name" => "Ihsaan",//dynamic
        //         "last_name" => "Khan",//dynamic
        //         "state" => "disabled",
        //         "note" => null,
        //         "verified_email" => true,
        //         "multipass_identifier" => null,
        //         "tax_exempt" => false,
        //         "phone" => "+16135550127",
        //         "email_marketing_consent" => [
        //             "state" => "not_subscribed",
        //             "opt_in_level" => "single_opt_in",
        //             "consent_updated_at" => null,
        //         ],
        //         "sms_marketing_consent" => [
        //             "state" => "not_subscribed",
        //             "opt_in_level" => "single_opt_in",
        //             "consent_updated_at" => null,
        //             "consent_collected_from" => "OTHER",
        //         ],
        //     ],
        //     "tags" => "okay",
        //     "tax_exemptions" => [],
        //     "admin_graphql_api_id" => "gid://shopify/Customer/7211245764758",
        // ];
        


        // $transaction = [
        //     "id" => 1068278465,
        //     "order_id" => 450789469,
        //     "kind" => "capture",
        //     "gateway" => "bogus",
        //     "status" => "success",
        //     "message" => "Bogus Gateway: Forced success",
        //     "created_at" => "2024-01-02T08:57:35-05:00",
        //     "test" => true,
        //     "authorization" => null,
        //     "location_id" => null,
        //     "user_id" => null,
        //     "parent_id" => 389404469,
        //     "processed_at" => "2024-01-02T08:57:35-05:00",
        //     "device_id" => null,
        //     "error_code" => null,
        //     "source_name" => "755357713",
        //     "payment_details" => [
        //         "credit_card_bin" => null,
        //         "avs_result_code" => null,
        //         "cvv_result_code" => null,
        //         "credit_card_number" => "•••• •••• •••• 4242",
        //         "credit_card_company" => "Visa",
        //         "buyer_action_info" => null,
        //         "credit_card_name" => null,
        //         "credit_card_wallet" => null,
        //         "credit_card_expiration_month" => null,
        //         "credit_card_expiration_year" => null,
        //         "payment_method_name" => "visa"
        //     ],
        //     // "receipt" => [[]],
        //     "currency_exchange_adjustment" => null,
        //     "amount" => "10.00",
        //     "currency" => "USD",
        //     "payment_id" => "c901414060.1",
        //     "total_unsettled_set" => [
        //         "presentment_money" => [
        //             "amount" => "588.94",
        //             "currency" => "USD"
        //         ],
        //         "shop_money" => [
        //             "amount" => "588.94",
        //             "currency" => "USD"
        //         ]
        //     ],
        //     "manual_payment_gateway" => false,
        //     "admin_graphql_api_id" => "gid://shopify/OrderTransaction/1068278465"
        // ];

        
        // $json_order = json_encode($order, true);
        // $send = ['order' => $order]; 

        // dd($send);

        // $response = $api->rest('POST', '/admin/api/unstable/orders.json', $send);
        // if(isset($response['body']['order']['id']))
        // {
        //     $order_id = $response['body']['order']['id'];
            
        // }else{
        //     $order_id = null;
        // }
        // $order_id = 5575151255702;
        // $sendTrans = ['transaction' => $transaction]; 
        // $response = $api->rest('POST', '/admin/api/2024-01/orders/'. $order_id .'/transactions.json', $sendTrans);
        // $response = $api->rest('GET', '/admin/api/2024-01/orders/'. $order_id .'/transactions.json');
        // $response = $api->rest('GET', 'https://shopifymultivendor.com/api/v2/order/details');
        // dd($response);
        
        $curl = curl_init();

        curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://shopifymultivendor.com/api/v2/order/details',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            'system_key: $2y$10$I4LFgh0T8jK7sTDrFtnwwuBm5xfX66i7XLQWgSfeQdyTTihOCiSHW',
            'Authorization: Bearer 13|QLF5coFS1lkDJVvbM4nMIeyUBrHz6v0NVEm8wAwc',
            'Cookie: _session=rjkJ9qaVjCsiMesojn482lkFPZniqoAqrITGP88B'
        ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        $order = json_decode($response);
        dd($order);
        $order->shipping_address = json_decode($order->shipping_address);
        $order->line_items = [
                        [
                        "title"=> "Big Brown Bear Boots",
                        "price"=> 74.99,
                        "grams"=> "1300",
                        "quantity"=> 3,
                        "tax_lines"=> [
                            [
                                "price"=> 13.5,
                                "rate"=> 0.06,
                                "title"=> "State tax"
                            ]
                        ]
                    ]
                ];
        // dd($order);

        // $order_ = $this->convertToGivenOrderArray($response);
        $send = ['order' => $order]; 
        $response = $api->rest('POST', '/admin/api/2024-01/orders.json', $send);
        
       dd($response);
    }




    
}
