<?php

namespace App\Backend\Models\Settings;

use Illuminate\Database\Eloquent\Model;

class SubSubCategory extends Model
{
	protected $primaryKey = 'sub_sub_category_id';
	protected $table = 'sub_sub_categories';

	public function subCategoryList()
	{
		return $this->belongsTo('App\Backend\Models\Settings\SubCategory','sub_category_id','sub_category_id');
	}
	public function products()
	{
		return $this->hasMany('App\Backend\Models\Products\Product', 'sub_sub_category_id','sub_sub_category_id');
	}
}
