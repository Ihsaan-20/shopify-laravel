<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $fillable = [
       'store_id',
       'title',
       'body_html',
       'vendor',
       'product_type',
       'handle',
       'template_suffix',
       'published_scope',
       'tags',
       'status',
       'admin_graphql_api_id',
       'variants',
       'options',
       'images',
       'image', 
    ];

    
}
