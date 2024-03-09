<?php 

namespace App\Traits;

use Exception;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Log;

trait RequestTrait {
    public function makeAnAPICallToShopify($method, $endpoint, $url_params = null, $headers, $requestBody = null) {
        //Headers
        /**
         * Content-Type: application/json
         * X-Shopify-Access-Token: value
         */
        //Log::info('Endpoint '.$endpoint);
        try {
            $client = new Client();
            $response = null;
            if($method == 'GET' || $method == 'DELETE') {
                $response = $client->request($method, $endpoint, ['headers' => $headers]);
            } else {

                $response = $client->request($method, $endpoint, ['headers' => $headers, 'json' => $requestBody]);
            } 

            return [
                'statusCode' => $response->getStatusCode(),
                'body' => json_decode($response->getBody(), true)
            ];
        } catch(Exception $e) {
            return [
                'statusCode' => $e->getCode(),
                'message' => $e->getMessage(),
                'body' => null
            ];
        }
    }
    
    public function makeAPOSTCallToShopify($payload, $endpoint, $headers = NULL) {
        // Initialize cURL session
        $ch = curl_init();
        
        // Set cURL options
        curl_setopt($ch, CURLOPT_URL, $endpoint);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers === NULL ? [] : $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, true); // Include headers in the response
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $payload);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); // Skip SSL certificate verification
    
        // Execute cURL request
        $result = curl_exec($ch);
    
        // Get HTTP status code
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    
        // Close cURL session
        curl_close($ch);
    
        // Extract response body
        $headerSize = curl_getinfo($ch, CURLINFO_HEADER_SIZE);
        $responseHeaders = substr($result, 0, $headerSize);
        $responseBody = substr($result, $headerSize);
    
        // Return response status code and body
        return ['statusCode' => $httpCode, 'body' => $responseBody];
    }
    

    //For emitting Socket IO Messages
    public function sendSocketIONotification($channel, $message) {
        try {
            $endpoint = 'http://localhost:3000/broadcast';
            $endpoint .= '?channel='.$channel.'&message='.$message;
            $headers = ['Content-Type' => 'application/json', 'Accept' => 'application/json'];
            $client = new Client();
            $response = $client->request('GET', $endpoint, ['headers' => $headers]);
            return [
                'statusCode' => $response->getStatusCode(),
                'body' => json_decode($response->getBody(), true),
            ];
        } catch(Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }
    
    public function makeADockerAPICall($endpoint, $headers, $method = 'GET') {
        try {
            $client = new Client();
            $response = null;
                $response = $client->request($method, $endpoint, [ 'headers' => $headers ]);
            return [
                'statusCode' => $response->getStatusCode(),
                'body' => json_decode($response->getBody(), true),
                //'headers' => $response->getHeaders()
            ];
        } catch(Exception $e) {
            return [
                'statusCode' => $e->getCode(),
                'message' => $e->getMessage(),
                'body' => null
            ];
        }
    }
}