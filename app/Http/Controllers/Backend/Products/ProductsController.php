<?php

namespace App\Http\Controllers\Backend\Products;

use Illuminate\Http\Request;
use App\Http\Requests\ProductRequest;
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
use App\Custom\Helper;
use Session;
use DB;
use Image;
use File;

class ProductsController extends Controller
{
    public $view_page_url;
    public function __construct()
    {
        $this->view_page_url = 'Backend.products.';
    }
    public function addProduct()
    {
    	$categories = ['' => 'Please Select a Category'] +
    				Category::where('status', 1)
    				->pluck('category_name_lang1','category_id')
    				->all();

        $colors = Color::where('status',1)->get();
        $sizes = Size::where('status',1)->get();						

        //view data code
        $products = Product::whereIn('status', [0,1])->get();
        //$categories = Category::whereIn('status', [0,1])->get()->first();
        //parent to child tble access
       // foreach ($categories->products as $value) {
       //      dd($value);
       //  } 
       // exit();
        return view($this->view_page_url.'product',compact('categories','colors','sizes','products'));
    }

    public function categoryWiseSubCategoryList($categoryId)
    {
    	return SubCategory::where('category_id',$categoryId)->get();
    }

    public function subCategoryWiseSubSubCategoryList($subCategoryId)
    {
    	return SubSubCategory::where('sub_category_id',$subCategoryId)->get();
    }

    public function saveProduct(ProductRequest $request)
    {
        //return $request->file('path');
        //return $request->all();
        // $p = $request->color_id;
        // echo '<pre>';
        // print_r($p);
        // echo '</pre>';
        // exit();

        $slug = $request->product_name_lang1;
        $productSlug = str_slug($slug,'-');
    	try{
    		DB::beginTransaction();
    		$saveProduct = Product::insertGetId([
    			'category_id'        => $request->category_id,
    			'sub_category_id'    => $request->sub_category_id,
    			'sub_sub_category_id'=> $request->sub_sub_category_id,
    			'product_name_lang1' => $request->product_name_lang1,
    			'product_name_lang2' => $request->product_name_lang2,
    			'market_price'       => $request->market_price,
    			'discount'		     => $request->discount,
                'slug'               => $productSlug,
    			'sale_price'		 => $request->sale_price,
    			'quantity'			 => $request->quantity,
    			'product_code'       => $request->product_code,
    			'details_lang1'      => $request->details_lang1,
                'details_lang2'      => $request->details_lang2,
    			'placement_type'     => $request->placement_type,
                'commission'         => $request->commission, 
    			'created_at'         => date('Y-m-d H:i:s')
    			]);
    			//create a row size
    		if($saveProduct){
    		    foreach ($request->color_id as $color) {
                      $saveColor = ProductWiseColor::insertGetId([
                            'product_id' => $saveProduct,
                            'color_id'   => $color,
                            'created_at' => date('Y-m-d H:i:s'),
                            'created_by' => 1
                    ]);
                }

               

                foreach ($request->size_id as $size) {
                    $saveSize = ProductWiseSize::insertGetId([
                        'product_id' => $saveProduct,
                        'size_id'   => $size,
                        'created_at' => date('Y-m-d H:i:s'),
                        'created_by' => 1
                    ]);
                } 
    			//image
                $data = $request->all();
                $imageType = null;
                //$folderPath = '/images/product/';
                for ($i = 0; $i < count($data['caption']); $i++) {
                    ($i == 0) ? $imageType = 1 : $imageType = 2;
                    //$fileName = Helper::imageUploadRaw($saveProduct.$i, $data['path'][$i], $folderPath,211,848);
                     $fileName = $saveProduct.$i . '-' .time() . '.' .$data['path'][$i]->getClientOriginalExtension();
                     //return $fileName;
                $img = Image::make($data['path'][$i])->resize(350, 848)->save(public_path('images/product/' . $fileName));
                    ProductWiseImage::insert([
                            'product_id' => $saveProduct,
                            'path' => $fileName,
                            'type' => $imageType,
                            'caption' => $data['caption'][$i],
                            'status' => 1,
                            'created_at' => date('Y-m-d h:i:s'),
                            'created_by' => 1,
                        ]);
                }

    		DB::commit();
    		Session::flash('success', 'Product Added Successfully !!');
    	}else{
    		DB::rollback();
    		Session::flash('error', 'Something Went Wrong');
    	}		
    	}catch(\Exception $e){
    		DB::rollback();
    		return $e;
    		Session::flash('error', $e->errorInfo[2]);
    	}
    	return redirect()->route('products.product');

    }

    public function updateStatus($modelReference,$action,$id)
    {
        $modelName = "";
        $stringToArrayConvert = explode("-",$modelReference);
        foreach ($stringToArrayConvert as $value) {
            $modelName .= ucwords($value);
        }
        $arrayToStringConvert = implode("_",$stringToArrayConvert);
        $filterColumn = $arrayToStringConvert."_id";
        $modelPath = 'App\Backend\Models\Products\\'.$modelName;
        $model = new $modelPath();

        try{
            $result = $model::where($filterColumn,$id)
                    ->update([
                        'status' => Helper::getStatus($action),
                        'updated_by' => 1
                    ]);
                    if($result){
                        return response()->json(['success' => true, 'message' => ucwords($action). ' Successfully !!!']);
                    } else {
                        return response()->json(['error' => true, 'message' => 'Something went Wrong !!']);
                    }    
        }catch(\Exception $e){
            return $e;
            return response()->json(['error' => true, 'message' => $e->errorInfo[2]]);
        }
    }

    public function editProduct($productId)
    {
        $products = Product::where('product_id',$productId)->first();
        $categories = Category::where('status',1)->get(['categories.category_id','categories.category_name_lang1']);
        // $colors =Color::where('status', 1)
        //             ->pluck('color_name_lang1','color_id')
        //             ->all();
        $colors = Color::where('status',1)->get();            
        // $sizes = Size::where('status',1)
        //         ->pluck('size_title_lang1','size_id')
        //         ->all();
        $sizes = Size::where('status',1)->get();           
        //dd($products->productWiseColors->product_id);
       //  foreach ($products->productWiseSizes as $value) {
       //      echo '<pre>';
       //  print_r($value);
       //  echo '</pre>';
       //  //print_r($value->color->color_name_lang1);
       //     //$result[] = $value;
       // }
           
        return view('Backend.products.editProduct',compact('products','categories','sizes','colors'));
    }

    public function productUpdate(Request $request,$productId)
    {

        $slug = $request->product_name_lang1;
        $productSlug = str_slug($slug,'-');
        $findProduct = Product::where('product_id',$productId)->first();
        if($findProduct){
             DB::beginTransaction();
         try{
            $updateProduct = Product::where('product_id',$findProduct->product_id)
                ->update([
                    'category_id'        => $request->category_id,
                    'sub_category_id'    => $request->sub_category_id,
                    'sub_sub_category_id'=> $request->sub_sub_category_id,
                    'product_name_lang1' => $request->product_name_lang1,
                    'product_name_lang2' => $request->product_name_lang2,
                    'market_price'       => $request->market_price,
                    'discount'           => $request->discount,
                    'slug'               => $productSlug,
                    'sale_price'         => $request->sale_price,
                    'quantity'           => $request->quantity,
                    'product_code'       => $request->product_code,
                    'details_lang1'      => $request->details_lang1,
                    'details_lang2'      => $request->details_lang2,
                    'placement_type'     => $request->placement_type,
                    'commission'         => $request->commission, 
                    'created_at'         => date('Y-m-d H:i:s')
                    ]);

             if($updateProduct){
                $oldColorArr =    [];
                $updateColorArr = [];
                $insertColorArr = [];
                $existsColorArr = [];

            if(isset($request->color_id) && !empty($request->color_id)){
              $productWiseColors = ProductWiseColor::where('status',1)
                                   ->where('product_id',$productId)
                                   ->get();
              foreach ($productWiseColors as $key => $color) {
                  if(in_array($color->color_id,$request->color_id)){
                    $updateColorArr[] = [
                        'product_wise_color_id' => $color->product_wise_color_id,
                        'product_id' => $color->product_id,
                        'color_id' => $color->color_id,
                    ];
                  }else {
                    $oldColorArr[] = [
                        'product_wise_color_id' => $color->product_wise_color_id,
                        'product_id' => $color->product_id,
                        'color_id' => $color->color_id,
                    ];
                  }
              }

              foreach ($updateColorArr as $value) {
                    $existsColorArr[] = $value['color_id'];
                }

                $insertColorArr = array_diff($request->color_id,$existsColorArr);

                foreach ($oldColorArr as $oldColor) {
                    ProductWiseColor::where('product_wise_color_id',$oldColor['product_wise_color_id'])
                    ->update([
                        'status' => 2
                    ]);                    
                }

                foreach ($insertColorArr as $insertColor) {
                    ProductWiseColor::insert([
                        'product_id' => $productId,
                        'color_id' => $insertColor,
                        'status' => 1,
                        'created_at' => date('Y-m-d H:i:s'),
                        'created_by' => 1
                    ]);
                       
                }  
            }

            //size

            $oldSizeArr =    [];
            $updateSizeArr = [];
            $insertSizeArr = [];
            $existsSizeArr = [];

            if(isset($request->size_id) && !empty($request->size_id)){
                $productWiseSizes = ProductWiseSize::where('status',1)
                                    ->where('product_id',$productId)
                                    ->get();

               foreach ($productWiseSizes as $key=> $productWiseSize) {
                if(in_array($productWiseSize->size_id,$request->size_id)){
                    $updateSizeArr[] = [
                        'product_wise_size_id' => $productWiseSize->product_wise_size_id,
                        'product_id' => $productWiseSize->product_id,
                        'size_id' => $productWiseSize->size_id,
                    ];
                }else {
                    $oldSizeArr[] = [
                        'product_wise_size_id' => $productWiseSize->product_wise_size_id,
                        'product_id' => $productWiseSize->product_id,
                        'size_id' => $productWiseSize->size_id,
                    ];
                }
                   
                } 

                foreach ($updateSizeArr as $value) {
                    $existsSizeArr[] = $value['size_id'];
                }

                $insertSizeArr = array_diff($request->size_id,$existsSizeArr);

                foreach ($oldSizeArr as $oldSize) {
                    ProductWiseSize::where('product_wise_size_id',$oldSize['product_wise_size_id'])
                    ->update([
                        'status' => 2
                    ]);                    
                }

                foreach ($insertSizeArr as $insertSize) {
                    ProductWiseSize::insert([
                        'product_id' => $productId,
                        'size_id' => $insertSize,
                        'status' => 1,
                        'created_at' => date('Y-m-d H:i:s'),
                        'created_by' => 1
                    ]);
                       
                }
            }

            // return $request->all();

            if (isset($request->image)) {
                $folderPath = 'images/product/';
                foreach ($request->image as $key => $image) {
                    if (!is_null($image['image_id'])) {
                        if(isset($image['path'])){
                            $fileName = Helper::imageUploadRaw($productId,$image['path'],$folderPath,211,848);
                            if($fileName != null ){
                                ProductWiseImage::where('product_wise_image_id',$image['image_id'])
                                ->update([
                                    'path' => $fileName,
                                    'caption' => $image['caption'],
                                    'updated_by' => 1
                                ]);
                            }
                         }   

                    } else {  
                        if(isset($image['path'])){
                            $fileName = Helper::imageUploadRaw($productId,$image['path'],$folderPath,211,848);
                            if($fileName != null ){
                                ProductWiseImage::insert([
                                    'path' => $fileName,
                                    'product_id' => $productId,
                                    'caption' => $image['caption'],
                                    'updated_by' => 1
                                ]);
                            }
                        }
                    }
                }
            }

            DB::commit();
            // return;
            Session::flash('success', 'Product Update Successfully !!');
         }else {
                DB::rollback();
                Session::flash('error', 'Something Went Wrong !!');

             }        
        }catch(\Exception $e){
            return $e;
            DB::rollback();
            Session::flash('error',$e->errorInfo[2]);
        }
        }
        
       return redirect()->route('products.product');
    }
}