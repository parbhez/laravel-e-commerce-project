<?php

namespace App\Backend\Models\Settings;

use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
	protected $primaryKey = 'sub_category_id';
	protected $table= 'sub_categories';
	
    public function category()
    {
        //return $this->belongsTo(Category::class,'category_id','category_id');
    	return $this->belongsTo('App\Backend\Models\Settings\Category','category_id','category_id');
    }
    public function SubSubCategories()
    {
    	return $this->hasMany('App\Backend\Models\Settings\SubSubCategory','sub_category_id','sub_category_id');
    }

    public function products()
    {
        return $this->hasMany('App\Backend\Models\Products\Product','product_id','product_id');
    }
}
