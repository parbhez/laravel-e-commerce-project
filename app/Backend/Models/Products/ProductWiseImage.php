<?php

namespace App\Backend\Models\Products;

use Illuminate\Database\Eloquent\Model;

class ProductWiseImage extends Model
{
	protected $primaryKey = 'product_wise_image_id';
	protected $table = 'product_wise_image';
	
   public function productList()
   {
   	return $this->belongsTo('App\Backend\Models\Products\Product','product_id', 'product_id');
   }
}
