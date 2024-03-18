<?php

namespace App\Http\Controllers;

use GuzzleHttp\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;

class TestingController extends Controller
{
    protected $apiKey = 'c2be734f4ce6e80f56e42ac02aaead3c'; // custom app key
    protected $apiSecret = '239d30e79b32f28a81efc11a50d33820';
    protected $shopUrl = 'https://quickstart-eaa7987a.myshopify.com';

    public function index()
{
    // Authenticate with Shopify and get access token
    // $accessToken = $this->getAccessToken();
    $accessToken = "16|Q8LNr3dZrC0XS5ua2yQzxgBsuqbNqMd9SMz3uLTB";

    if (!$accessToken) {
        return $this->redirectToShopify();
    }

    // Make API request to fetch shop data
    $client = new Client();
    $response = $client->request('GET', "{$this->shopUrl}/admin/api/2024-01/shop.json", [
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
        if (Session::has('access_token')) {
            return Session::get('access_token');
        }

        return null;
    }

    protected function redirectToShopify()
    {
        $scopes = 'read_products,write_products'; // Specify the required scopes
        $redirectUri = 'https://elementary-solutions.com/shopify_store/public/shopify/auth'; // Your app's redirect URI

        $authorizationUrl = "{$this->shopUrl}/admin/oauth/authorize?client_id={$this->apiKey}&scope={$scopes}&redirect_uri={$redirectUri}";

        return Redirect::away($authorizationUrl);
    }
}
