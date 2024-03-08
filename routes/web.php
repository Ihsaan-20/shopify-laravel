<?php

use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ShopifyAppController;
use App\Http\Controllers\Shopify\Order\OrderController;
use App\Http\Controllers\Shopify\Product\ProductController;
use App\Http\Controllers\Shopify\Webhook\WebhookController;
use App\Http\Controllers\Shopify\Customer\CustomerController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/wellcome', function () {

    return view('welcome');
});

Route::get('/', function () {
    return view('welcome');
})->middleware(['auth.shopify'])->name('home');


Route::webhooks('products-create');


Route::controller(WebhookController::class)->group(function () {

    Route::get('get-all-webhooks', 'getAllWebHook');
    Route::get('create-webhooks', 'createWebHook');
    Route::post('webhook/products', function (){
        Log::info('Hey!');
       
    });
});


Route::controller(ProductController::class)->group(function () {

    Route::get('get-all-products', 'getAllProductsFromShopify');
   
});

Route::controller(OrderController::class)->group(function () {

    Route::get('get-all-orders', 'getAllOrdersFromShopify')->name('get.all.orders.from.shopify');
    Route::get('store-order', 'storeOrder')->name('store.order');
    Route::get('testing', 'testing')->name('testing');
    Route::get('get-laravel-order', 'getAllOrdersFromShopifyTwo')->name('testing');
    Route::post('/order-creation/web-hook', 'handle');
    
});

Route::controller(CustomerController::class)->group(function () {

    Route::get('get-all-customer', 'getAllcustomerFromShopify')->name('get.all.customer.from.shopify');
    Route::get('store-all-customer', 'storeAllcustomerFromShopify')->name('store.all.customer.from.shopify');
   
});


Route::get('/shopify', [ProductController::class, 'index']);
Route::get('/shopify-two', [ProductController::class, 'getProductWithMetafields']);
Route::get('/single-product', [ProductController::class, 'getSingleProduct']);
Route::post('/shopify-two-w', [ProductController::class, 'addProductToShopifyApp']);
Route::get('/sync-products', [ProductController::class, 'syncProducts'])->name('sync.products');
Route::get('/shopify-laravel', [ProductController::class, 'addProductbyLaravel']);
Route::get('/shopify-crul', [ProductController::class, 'getApiDataWithCrul']);
Route::get('/shopify-laravel-api', [ProductController::class, 'laravelApiProduct']);
Route::get('/shopify-with-laravel-api', [ProductController::class, 'getProductsWithShopifyApi']);


Route::get('testing', [ShopifyAppController::class, 'testing']);