<?php

namespace App\Backend\Models\Settings;

use Illuminate\Database\Eloquent\Model;

class Color extends Model
{
	protected $primaryKey = 'color_id';
	protected $table= 'colors';

	public function productWiseColor()
	{
		return $this->hasOne('App\Backend\Models\Products\ProductWiseColor','color_id','color_id');
	}
	
	
}
