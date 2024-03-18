<?php

namespace App\Http\Controllers;

use GuzzleHttp\Client;
use Illuminate\Http\Request;

class TestingController extends Controller
{
    protected $apiKey = '6caab75eb0bbcdb5d04f13c85b1d25e1';
    protected $apiSecret = '312be2ef4318c0d9c05e6e7d5975cf6a';
    protected $shopUrl = 'https://quickstart-eaa7987a.myshopify.com';

    // public function __construct()
    // {
    //     $this->middleware('auth');
    // }

    public function index()
    {
        // Authenticate with Shopify
        $accessToken = $this->getAccessToken();

        // Make API request to fetch shop data
        $client = new Client();
        $response = $client->request('GET', "https://{$this->shopUrl}/admin/api/2024-01/shop.json", [
            'headers' => [
                'X-Shopify-Access-Token' => $accessToken,
                'Accept' => 'application/json',
            ],
        ]);

        $shopData = json_decode($response->getBody()->getContents(), true);

        return view('shopify.index', compact('shopData'));
    }



    protected function getAccessToken()
{
    // Check if the access token is stored in session
    if (session()->has('access_token')) {
        return session()->get('access_token');
    }

    // Redirect the user to the authorization endpoint if the access token is not available
    $shopUrl = 'https://quickstart-eaa7987a.myshopify.com';
    $apiKey = '6caab75eb0bbcdb5d04f13c85b1d25e1';
    $scopes = 'read_products,write_products'; // Specify the required scopes
    $redirectUri = 'https://elementary-solutions.com/shopify_store/public/shopify/auth'; // Your app's redirect URI


    $authorizationUrl = "https://{$shopUrl}/admin/oauth/authorize?client_id={$apiKey}&scope={$scopes}&redirect_uri={$redirectUri}";

    return redirect()->away($authorizationUrl);
}

}
