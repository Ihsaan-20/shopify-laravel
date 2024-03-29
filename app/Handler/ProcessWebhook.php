<?php

namespace App\Handler;

use Illuminate\Support\Facades\Log;
use Spatie\WebhookClient\Jobs\ProcessWebhookJob as SpatieProcessWebhookJob;

//The class extends "ProcessWebhookJob" class as that is the class 
//that will handle the job of processing our webhook before we have 
//access to it.

class ProcessWebhook extends SpatieProcessWebhookJob
{
    public function handle()
    {
      Log::info('before');
        $dat = json_decode($this->webhookCall, true);
        $data = $dat['payload'];
    
        if ($data['event'] == 'charge.success') {
          // take action since the charge was success
          // Create order
          // Sed email
          // Whatever you want
          Log::info($data);
        }
        Log::info('after');
        //Acknowledge you received the response
        http_response_code(200);
        logger($this->webhookCall);
    }
}