<?php

namespace App\Backend\Models\Products;

use Illuminate\Database\Eloquent\Model;

class ProductWiseColor extends Model
{
	protected $primaryKey = 'product_wise_color_id';
	protected $table= 'product_wise_color';
	
	public function color()
	{
		return $this->belongsTo('App\Backend\Models\Settings\Color','color_id','color_id');
	} 
    
    public function productList()
	{
		return $this->belongsTo('App\Backend\Models\Products\Product', 'product_id', 'product_id');
	}
}
