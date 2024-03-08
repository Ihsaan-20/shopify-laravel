<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Spatie\WebhookClient\WebhookConfig;
use Spatie\WebhookClient\WebhookProcessor;

class WebhookController
{
    public function __invoke(Request $request, WebhookConfig $config)
    {
        (new WebhookProcessor($request, $config))->process();

        return response()->json(['message' => 'ok']);
    }
}