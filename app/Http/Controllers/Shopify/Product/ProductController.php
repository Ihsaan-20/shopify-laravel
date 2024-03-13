<?php

namespace App\Http\Controllers\Shopify\Product;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


use Exception;

use GuzzleHttp\Client;
use App\Models\ProductShop;
use Illuminate\Support\Str;



//osiset -> gnikyt
use Illuminate\Support\Facades\DB;
use Gnikyt\BasicShopifyAPI\Options;
use Gnikyt\BasicShopifyAPI\Session;

//composer
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Http;
use App\Models\Product As LocalProducts;
use App\Models\Product_two;
use GuzzleHttp\Exception\GuzzleException;
use Gnikyt\BasicShopifyAPI\BasicShopifyAPI;

//Shopify PHP library installation
use Shopify\Rest\Admin2024_01\Product;
use Shopify\Utils;


class ProductController extends Controller
{

    public function getAllProductsFromShopify()
    {

        $options = new Options();
        $options->setVersion('unstable');

        $api = new BasicShopifyAPI($options);
        $shopifyStore = 'quickstart-eaa7987a.myshopify.com';
        $apiPassword = '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';

        $api->setSession(new Session($shopifyStore, $apiPassword));
        $response = $api->rest('GET', '/admin/products.json');

        if(!isset($response['body']['products']))
        {
            return null;
        }

        $products = $response['body']['products'];


        foreach($products as $o)
        {
            $result = Product_two::create([
                'response' => json_encode($o)
            ]);  
        }

              
        dd([$result??null, $products??null]);


    }



    public function getApiDataWithCrul()
    {
        $token = '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';
        $shopifyStore = 'quickstart-eaa7987a.myshopify.com';

        $ch = curl_init("https://" . $shopifyStore . "/admin/products.json");

        curl_setopt($ch, CURLOPT_HTTPGET, true);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); 
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            "Content-Type: application/json",
            "X-Shopify-Access-Token: $token"
        ]);

        $result = curl_exec($ch);

        if(curl_errno($ch)) {
            $error_message = curl_error($ch);
            curl_close($ch);
            return "cURL Error: $error_message";
        }

        curl_close($ch);

        $responseData = json_decode($result, true);

        dd($responseData);
    }





    public function index()
    {

        $shopifyStore = 'quickstart-eaa7987a.myshopify.com';
        $apiKey = '6caab75eb0bbcdb5d04f13c85b1d25e1';
        $apiPassword = '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';
        $client = new \GuzzleHttp\Client();
        $response = $client->get("https://$shopifyStore/admin/api/2024-01/products.json", [
            'auth' => [$apiKey, $apiPassword]
        ]);
        $products = json_decode($response->getBody(), true)['products'];

        return view('shopify.index', compact('products'));
    }


    public function syncProducts()
    {
        $shopifyStore = 'quickstart-eaa7987a.myshopify.com';
        $apiKey = '6caab75eb0bbcdb5d04f13c85b1d25e1';
        $apiPassword = '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';
        $client = new Client();
        $since_id = 0;
        $storeId = 999;
        LocalProducts::truncate();

        $response = $client->get("https://$shopifyStore/admin/api/2024-01/products.json?since_id=$since_id", [
            'auth' => [$apiKey, $apiPassword]
        ]);

        $products = json_decode($response->getBody(), true)['products'];
        
       

        foreach ($products as $product) {

            $product['store_id'] = $storeId;

            $update_arr = [
                'store_id' => $storeId,
                'id' => $product['id'],
            ];

            $productData = [
                'title' => $product['title'],
                'body_html' => $product['body_html'],
                'vendor' => $product['vendor'],
                'product_type' => $product['product_type'],
                'handle' => $product['handle'],
                'template_suffix' => $product['template_suffix'],
                'published_scope' => $product['published_scope'],
                'tags' => $product['tags'],
                'status' => $product['status'],
                'admin_graphql_api_id' => $product['admin_graphql_api_id'],
                'variants' => json_encode($product['variants']),
                'options' => json_encode($product['options']),
                'images' => json_encode($product['images']),
                'image' => json_encode($product['image'])
            ];

            // Update or create the product
            LocalProducts::updateOrCreate($update_arr, $productData);
        }
        return back()->with('success', 'Products synced successfully!');
    }

    
    public function laravelApiProduct()
    {
        $curl = curl_init();

        curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://shopifymultivendor.com/api/v2/products/4',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            'system-key: $2y$10$I4LFgh0T8jK7sTDrFtnwwuBm5xfX66i7XLQWgSfeQdyTTihOCiSHW',
            'Authorization: Bearer 7|bwIVOEqsxD7EeO8a800axX6gJYlL0hxfYK1TdoET',
            'Cookie: _session=ZodbzcxVSzrRRny1f0brrRAUOgf51C9qkDDIHjpy'
        ),
        ));

        $res = curl_exec($curl);

        curl_close($curl);
        $data = [];
        $decode_data = json_decode($res, true);


        if ($decode_data && isset($decode_data['data'][0])) {
            $apiArray = $decode_data['data'][0];
        } else {
            $apiArray = null;
        }

        dd(['laravel api' => $apiArray]);
    }

    public function addProductbyLaravel()
    {
        $options = new Options();
        $options->setVersion('2024-01');
        $api = new BasicShopifyAPI($options);
        $shopifyStore = 'quickstart-eaa7987a.myshopify.com';
        $apiPassword = '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';
        $api->setSession(new Session($shopifyStore, $apiPassword));

        $ex = ProductShop::where('id', 3)->first();
        $converted = $this->convertToShopifyArray($ex);

        $photosIds = [];
        $photosIds = explode(',', $ex->photos);

        // dd($photoLink, $ex);
        $length = 14;
        $update_id = '';
        
        for ($i = 0; $i < $length; $i++) {
            $update_id .= rand(0, 9);
        }
        
        
        $photoLink = DB::table('uploads')->select('*')->whereIn('id', $photosIds)->get();
        $image = [];
        foreach ($photoLink as $photo) {
            $image = [
                "created_at" => now()->toIso8601String(),
                "id" => $photo->id,
                "position" => null, 
                "product_id" => $update_id,
                "variant_ids" => [], 
                "src" => 'https://shopifymultivendor.com/public/'. $photo->file_name,
                "width" => null, 
                "height" => null, 
                "updated_at" => now()->toIso8601String(),
            ];
        }

       
        // $response = $api->rest('GET', '/admin/api/2024-01/products/'.$product_id.'.json');

        $curl = curl_init();

        curl_setopt_array($curl, array(
        CURLOPT_URL => 'https://shopifymultivendor.com/api/v2/products/4',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            'system-key: $2y$10$I4LFgh0T8jK7sTDrFtnwwuBm5xfX66i7XLQWgSfeQdyTTihOCiSHW',
            'Authorization: Bearer 7|bwIVOEqsxD7EeO8a800axX6gJYlL0hxfYK1TdoET',
            'Cookie: _session=ZodbzcxVSzrRRny1f0brrRAUOgf51C9qkDDIHjpy'
        ),
        ));

        $res = curl_exec($curl);

        curl_close($curl);
        $data = [];
        $decode_data = json_decode($res, true);
        dd($decode_data);

        if ($decode_data && isset($decode_data['data'][0])) {
            $apiArray = $decode_data['data'][0];
        } else {
            $apiArray = null;
        }

        $converted_array = $this->convertToShopifyArray($apiArray);
        $send = ['product' => $converted_array]; 
        $response = $api->rest('POST', '/admin/api/2024-01/products.json', $send);
        // dd($response['body']['product']['id']);

        if(isset($response['body']['product']['id'])){
            $product_id = $response['body']['product']['id'];
        }

        $tags = $apiArray['tags'];
        $colors = $apiArray['colors'];
        $thumbnail_image = $apiArray['thumbnail_image'];
        


        //send variants with product -> start from here;
        //******************************************************/
        // $photos = $apiArray['photos'];
        // // dd($photos);
        // $variants = [];

        // foreach ($photos as $index => $photo) {
        //     $variants['variants'][$index] = [
        //         'id' => Str::random(6),
        //         'product_id' => $product_id_2,
        //         'title' => $photo['variant'],
        //         'price' => (string) $price = rand(1,999), 
        //         'sku' => 'SKU'.Str::random(6),
        //         'position' => 1,
        //         'inventory_policy' => 'continue',
        //         'compare_at_price' => null,
        //         'fulfillment_service' => 'manual',
        //         'inventory_management' => 'shopify',
        //         'option1' => 'Default Title',
        //         'option2' => null,
        //         'option3' => null,
        //         'created_at' => now(),
        //         'updated_at' => now(),
        //         'taxable' => true,
        //         'barcode' => '1234_pink',
        //         'grams' => 567,
        //         'weight' => 1.25,
        //         'weight_unit' => 'kg',
        //         'inventory_item_id' => Str::random(6),
        //         'inventory_quantity' => $stock = rand(1,99),
        //         'old_inventory_quantity' => $stock = rand(1,99),
        //         'requires_shipping' => true,
        //         'admin_graphql_api_id' => 'gid://shopify/ProductVariant/' . Str::random(6),
        //         'image_id' => $index // Initialize with null
        //     ];

        //     // Assuming 'variant' and 'path' are the keys in the photo array
        //     $variants['variants'][$index]['image_id'] = $photo['variant']; // Assuming 'variant' is the key for image_id
        // }

        // $variantsToSend = ['variant' => $variants]; 
        // $variantsUpdated = $api->rest('POST', '/admin/api/2024-01/products/'.$product_id_2.'/variants.json', $variantsToSend);

        // dd($variantsUpdated);

        //send variants with product -> start end here;
        //******************************************************/
        

        //send thumbnail image with product -> start from here;
        //******************************************************/
        $image = [
            "created_at" => now()->toIso8601String(),
            "id" => $photo->id,
            "position" => null, 
            "product_id" => $product_id,
            "variant_ids" => [], 
            "src" => $thumbnail_image,
            "width" => null, 
            "height" => null, 
            "updated_at" => now()->toIso8601String(),
        ];
        $imageToSend = ['image' => $image]; 
        $imageUpdated = $api->rest('POST', '/admin/api/2024-01/products/'.$product_id.'/images.json', $imageToSend);
        //******************************************************/
        //send thumbnail image with product -> start end here;
        dd($imageUpdated);

    }

    public function generateRandomId() {
        return Str::random(14);
    }



    private function convertToShopifyArray($laravelArray) {
        $shopifyArray = [];
    
        // Mapping individual fields
        $shopifyArray['id'] = $laravelArray['id'];
        $shopifyArray['title'] = $laravelArray['name'];
        $shopifyArray['body_html'] = "<p>It's the small iPod with one very big idea: Video. Now the world's most popular music player, available in 4GB and 8GB models, lets you enjoy TV shows, movies, video podcasts, and more. The larger, brighter display means amazing picture quality. In six eye-catching colors, iPod nano is stunning all around. And with models starting at just $149, little speaks volumes.</p>";
        $shopifyArray['vendor'] = 'Unknown'; // should dynamic
        $shopifyArray['product_type'] =  $laravelArray['product_type'] ?? null; // should dynamic
        $shopifyArray['handle'] = Str::slug($laravelArray['name']); 
        $shopifyArray['created_at'] =  $laravelArray['created_at'];
        $shopifyArray['updated_at'] =   $laravelArray['updated_at'];
        $shopifyArray['published_at'] =  $laravelArray['created_at'];
        $shopifyArray['template_suffix'] = null;
        $shopifyArray['published_scope'] = 'web'; 
        $shopifyArray['tags'] = $laravelArray['tags'] ?? null;
        $shopifyArray['status'] = 'active';
        $shopifyArray['admin_graphql_api_id'] = 'gid://shopify/Product/' . $laravelArray['id'];
        
        // Variants array
        $shopifyArray['variants'] = [
            [
                'id' => $laravelArray['id'], //43169086931094
                'product_id' => $laravelArray['id'], //7937816232086
                'title' => $laravelArray['name'],
                'price' => (string) $laravelArray['calculable_price'], 
                'sku' => $laravelArray['sku'] ?? null,
                'position' => 1,
                'inventory_policy' => 'continue',// deny
                'compare_at_price' => null,
                'fulfillment_service' => 'manual',
                'inventory_management' => 'shopify',
                'option1' => null,
                'option2' => null,
                'option3' => null,
                'created_at' =>$laravelArray['created_at'],
                'updated_at' => $laravelArray['updated_at'],
                'taxable' => true,
                'barcode' => null,//dynamic
                'grams' => null,//dynamic
                'weight' => $laravelArray['weight'],//dynamic
                'weight_unit' => $laravelArray['unit'],
                'inventory_item_id' => $laravelArray['id'], // 45266683494550
                'inventory_quantity' => $laravelArray['current_stock'], // 10
                'old_inventory_quantity' => $laravelArray['current_stock'], // 10
                'requires_shipping' => true,
                'admin_graphql_api_id' => 'gid://shopify/ProductVariant/' . $laravelArray['id'], //7937816232086
                'image_id' => null //35660011405462
            ]
        ];
    
        // Options array
        $shopifyArray['options'] = [
            [
                'id' => $laravelArray['id'], //10081313620118
                'product_id' => $laravelArray['id'], //7937816232086
                'name' => 'Title',
                'position' => 1,
                'values' => [] // values  0 => "Selling Plans Ski Wax" 1 => "Special Selling Plans Ski Wax" 2 => "Sample Selling Plans Ski Wax"
            ]
        ];
    
        // Images array
        $shopifyArray['images'] = [
            [
                'id' => $laravelArray['id'], //35660011405462
                'alt' => 'Description of the image', 
                'position' => 1,
                'product_id' => $laravelArray['id'], //7937816232086
                'created_at' =>$laravelArray['created_at'],
                'updated_at' => $laravelArray['updated_at'],
                'admin_graphql_api_id' => 'gid://shopify/ProductImage/' . $laravelArray['id'],//35660011405462
                "width" => 2881, //dynamic
                "height" => 2881,// dyanmic
                // "src" => "https://cdn.shopify.com/s/files/1/0635/4386/9590/products/snowboard_wax.png?v=1709143224"
                "variant_ids" => [] //43169086931094
            ]
        ];
    
        // Image array
        $shopifyArray['image'] = [
            'id' => $laravelArray['id'], 
            'alt' => 'Description of the image',
            'position' => 1,
            'product_id' => $laravelArray['id'],
            'created_at' =>$laravelArray['created_at'],
            'updated_at' => $laravelArray['updated_at'],
            'admin_graphql_api_id' => 'gid://shopify/ProductImage/' . $laravelArray['id'],
            'width' => 1600,
            "height" => 1600,
            "src" => null,
            "variant_ids" => [] //43169086931094
        ];

        $meta = [
            'user_id' => 1, //auth id;
            'parent_id' => 1, // onwer id;
            'store_id' => 1, 
            'added_by' => 'admin', 
            'seller_id' => 9, 
            'shop_id' => 0, 
            'shop_name' => 'In House Product', 
            'shop_logo' => "https://shopifymultivendor.com/public/assets/img/placeholder.jpg"
        ];

        // Image array
        $shopifyArray['metafields'] = [
           [ 
            'user_id' => $meta['user_id'],
            'parent_id' => $meta['parent_id'],
            'store_id' => $meta['store_id'],
            'added_by' => $meta['added_by'],
            'seller_id' => $meta['seller_id'],
            'shop_id' => $meta['shop_id'],
            'shop_name' => $meta['shop_name'],
            'shop_logo' => $meta['shop_logo'],
            'namespace' =>  "instructions",
            'key' =>  "wash",
            'value' =>  "cold wash",
            'type' =>  "single_line_text_field",
            ]

        ];
    
        return $shopifyArray;
    }
    
}
