<?php

namespace App\Http\Controllers\Shopify\Customer;

use Shopify\Utils;
use Shopify\Context;

// Gnikyt
use App\Models\Customer;
use Shopify\Clients\Rest;
use Illuminate\Http\Request;



// use Shopify\Auth\FileSessionStorage;
// use Shopify\Auth\Session;

//Shopify PHP library installation
use Signifly\Shopify\Shopify;
use Gnikyt\BasicShopifyAPI\Options;
use Gnikyt\BasicShopifyAPI\Session;
use App\Http\Controllers\Controller;

use Shopify\Rest\Admin2024_01\Product;
use Gnikyt\BasicShopifyAPI\BasicShopifyAPI;


class CustomerController extends Controller
{
    public function getAllcustomerFromShopify()
    {
        $options = new Options();
        $options->setVersion('2024-01');
        $api = new BasicShopifyAPI($options);
        $shopifyStore = 'quickstart-eaa7987a.myshopify.com';
        $apiPassword = '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';
        $api->setSession(new Session($shopifyStore, $apiPassword));

        $response = $api->rest('GET', '/admin/api/2024-01/customers.json');
        if(!isset($response['body']['customers']))
        {
            return null;
        }

        $customers = $response['body']['customers'];

        
        foreach($customers as $o)
        {
            $result = Customer::create([
                'response' => json_encode($o)
            ]);  
        }
        // $result = Customer::create([
        //     'response' => json_encode($customers)
        // ]);        
        dd([$result??null, $customers??null]);

    }

}
