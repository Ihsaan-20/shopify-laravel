<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('shopify_webhook_events', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('event_id')->nullable();
            $table->bigInteger('subject_id')->nullable();
            $table->string('subject_type');
            $table->string('verb');
            $table->json('arguments');
            $table->text('body')->nullable();
            $table->string('message');
            $table->string('author');
            $table->text('description');
            $table->string('path');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('shopify_webhook_events');
    }
};
