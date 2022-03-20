<?php

namespace App\Backend\Models\Settings;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
	protected $primaryKey = 'category_id';
	protected $table= 'categories';
	
    public function subCategories()
    {
    	return $this->hasMany('App\Backend\Models\Settings\SubCategory','category_id','category_id');
    }

    public function products()
    {
    	return $this->hasMany('App\Backend\Models\Products\Product','category_id','category_id');
    }
}
