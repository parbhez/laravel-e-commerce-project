<?php

namespace App\Backend\Models\Products;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
	protected $primaryKey = 'product_id';
	protected $table= 'products';
	
	public function categoryList()
	{
		return $this->belongsTo('App\Backend\Models\Settings\Category','category_id','category_id');
	}

	public function subCategoryList()
	{
		return $this->belongsTo('App\Backend\Models\Settings\SubCategory','sub_category_id','sub_category_id');
	}

	public function subSubCategoryList()
	{
		return $this->belongsTo('App\Backend\Models\Settings\SubSubCategory','sub_sub_category_id','sub_sub_category_id');
	}

	public function productImages()
	{
		return $this->hasMany('App\Backend\Models\Products\ProductWiseImage', 'product_id', 'product_id');
	}

	public function productWiseColors()
	{
		return $this->hasMany('App\Backend\Models\Products\ProductWiseColor','product_id','product_id');
	}

	public function productWiseSizes()
	{
		return $this->hasMany('App\Backend\Models\Products\ProductWiseSize','product_id','product_id');
	}

	
}