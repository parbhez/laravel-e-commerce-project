<?php

namespace App\Http\Controllers\Backend\Sliders;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Backend\Models\Settings\Category;
use App\Backend\Models\Settings\SubCategory;
use App\Backend\Models\Settings\SubSubCategory;
use App\Backend\Models\Settings\Color;
use App\Backend\Models\Settings\Size;
use App\Backend\Models\Settings\City;
use App\Backend\Models\Products\Product;
use App\Backend\Models\Products\ProductWiseColor;
use App\Backend\Models\Products\ProductWiseSize;
use App\Backend\Models\Products\ProductWiseImage;
use App\Backend\Models\Sliders\PhotoSlider;
use App\Custom\Helper;
use Session;
use DB;
use Image;
use File;
class SlidersController extends Controller
{
    public $view_page_url;
    public function __construct()
    {
    	$this->view_page_url = 'Backend.sliders.';
    }

    public function addSlider()
    {
    	$categories = ['' => 'Please Select a Category'] +
    				Category::where('status', 1)
    				->pluck('category_name_lang1','category_id')
    				->all();
    	return view($this->view_page_url.'addSlider',compact('categories'));
    }

    public function categoryWiseSubCategoryList($categoryId)
    {
    	return SubCategory::where('category_id',$categoryId)->get();
    }

    public function saveSlider(Request $request)
    {
    	// return $request;

    	DB::beginTransaction();
    	try{
    		$saveSlider = PhotoSlider::insertGetId([
    			'category_id'        => $request->category_id,
    			'sub_category_id'    => $request->sub_category_id,
    			'image_caption'    => $request->image_caption,
    			'created_at'         => date('Y-m-d H:i:s'),
    			'created_by' 	     => 1	
    			]);
    			//create a row size
    		if($saveSlider){
    		    if ($request->hasFile('image_path')) {
                    $pimage = $request->file('image_path');
                    $fileName = $saveSlider. '-' .time() . '.' . $pimage->getClientOriginalExtension();
                    Image::make($pimage)->resize(1200, 400)->save(public_path('images/slider/' . $fileName));
                if($fileName != null){
                        $uploadImage = PhotoSlider::where('photo_slider_id',$saveSlider)
                            ->update([
                                'image_path' => $fileName,
                                'updated_by'    => 1
                            ]);
                }    
            }
                
    			
    		DB::commit();
    		Session::flash('success', 'Slider Added Successfully !!');
    	}else{
    		DB::rollback();
    		Session::flash('error', 'Something Went Wrong');
    	}		
    	}catch(\Exception $e){
    		DB::rollback();
    		return $e;
    		Session::flash('error', $e->errorInfo[2]);
    	}
    	return redirect()->route('sliders.photo-slider');
    }
}
