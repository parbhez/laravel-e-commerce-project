<?php

namespace App\Http\Controllers\Backend\Settings;

use Illuminate\Http\Request;
use App\Http\Requests\CategoryRequest;
use App\Http\Controllers\Controller;
use App\Backend\Models\Settings\Category;
use App\Backend\Models\Settings\SubCategory;
use App\Backend\Models\Settings\SubSubCategory;
use App\Backend\Models\Settings\Color;
use App\Backend\Models\Settings\Size;
use App\Backend\Models\Settings\City;
use App\Custom\Helper;
use Session;
use DB;
use Image;
use File;
class SettingsController extends Controller
{
    public $view_page_url;
    public function __construct()
    {
    	$this->view_page_url = 'Backend.settings.setup.';
    }
    public function setup()
    {
    	return view($this->view_page_url.'setup');
    }
    // @@===============Category Panel Start===============@@
    public function categoryList()
    {
        $categories = Category::whereIn('status', [0, 1])->get();
        // echo "<pre>";
        // print_r($categories);
        // echo "</pre>";
        // exit();
    	return view($this->view_page_url.'category.category',compact('categories'));
    }

    public function saveCategory(CategoryRequest $request)
    {
    	// return $request->file('featured_image');
    	try{
    		DB::beginTransaction();
    			$saveCategory = Category::insertGetId([
    			  'category_name_lang1' => $request->category_name_lang1,
    			  'category_name_lang2' => $request->category_name_lang2,
    			  'is_selected'			=> $request->is_selected,
    			  'view_order'			=> $request->view_order,
    			  'created_by'			=> 1,
    			  'created_at'          => date("Y-m-d H:i:s")
    			]);
    		if($saveCategory){
    			  if (strlen($request->file('featured_image') && $request->file('icon')) > 0) {
                    $folderPath1 = 'images/category/featured_image/';
                    $fileName1 = Helper::imageUploadRaw($saveCategory, $request->file('featured_image'), $folderPath1, 211, 848);
                     $folderPath2 = 'images/category/icon_image/';
                    $fileName2 = Helper::imageUploadRaw($saveCategory, $request->file('icon'), $folderPath2, 75, 75);
                    if ($fileName1 != null && $fileName2 != null) {
                        $saveEmployee = Category::where('category_id', $saveCategory)
                            ->update([
                                'featured_image' => $fileName1,
                                'icon' => $fileName2,
                                'updated_by' => 1
                            ]);
                    }
                }
    			DB::commit();
    			Session::flash('success','Category Save Successfull');
    		}else{
    			DB::rollback();
    			Session::flash('error','Something Went Wrong !!');
    		}	
    	}catch(\Exception $e){
    		DB::rollback();
    		// return $e;
    		Session::flash('error',$e->errorInfo[2]);
    	}
    	return redirect()->route('settings.category');
    }

    public function viewCategory()
    {
    	$categories = Category::whereIn('status', [0, 1])->get();
    	// echo "<pre>";
    	// print_r($categories);
    	// echo "</pre>";
    	// exit();
    	return view($this->view_page_url.'category.viewCategory',compact('categories'));
    }

    public function imageEdit($id)
    {
        //return $id;
         $editCategoryImage = Category::where('category_id',$id)
                ->first();
        // echo "<pre>";
        // print_r($editCategoryImage);
        // echo "</pre>";
        // exit();
        return view($this->view_page_url.'category.imageEditCategory',compact('editCategoryImage'));
    }

    public function imageUpdate(Request $request,$categoryId)
    {
        //return $request->all();
        //return $request->file('featured_image');
        //echo $categoryId;
        $category = Category::where('category_id',$categoryId)->first();
            //echo "<pre>";
            // print_r($category);
            //return $category->featured_image;
            // echo $category->icon;
            // echo "</pre>";
            // exit(); 
        if($category){
        DB::beginTransaction();
        try{
            if($request->hasFile('featured_image') && $request->hasFile('icon')){
                    $featured_image = $request->file('featured_image');
                    $icon = $request->file('icon');
                    $fileName1 = $category->category_id . '-' .time() . '.' .$featured_image->getClientOriginalExtension();
                    $fileName2 = $category->category_id . '-' .time() . '.' .$icon->getClientOriginalExtension();
                $img1 = Image::make($featured_image)->resize(211, 848)->save(public_path('images/category/featured_image/' . $fileName1));
                $img2 = Image::make($icon)->resize(20, 20)->save(public_path('images/category/icon_image/' . $fileName2));
                if($fileName1 != null && $fileName2 != null){
                    $updateImage = Category::where('category_id',$category->category_id)
                        ->update([
                            'featured_image' => $fileName1,
                            'icon' => $fileName2,
                            'updated_at'    => date('Y-m-d H:i:s'),
                            'updated_by'    => 1
                        ]);
                   }

                    if ($category->featured_image != $fileName1) {
                        $oldImagePath1 = 'images/category/featured_image/'.$category->featured_image;
                        File::delete(public_path($oldImagePath1));
                    }else if ($category->icon != $fileName2) {
                        $oldImagePath2 = 'images/category/icon/'.$category->icon;
                        File::delete(public_path($oldImagePath2));
                    }  
            
                DB::commit();
                Session::flash('success','Category Image Updated Successfull');
            }else{
                DB::rollback();
                Session::flash('error','Something Went Wrong !!');
            }   
        }catch(\Exception $e){
            DB::rollback();
             return $e;
            Session::flash('error',$e->errorInfo[2]);
        }
        }
      
        return redirect()->route('settings.category');
        
    }

    public function statusUpdate($modelReference,$action,$id)
    {
    	// $modelName = "";
    	// foreach (explode("-", $modelReference) as $value) {
    	// 	$modelName .= ucwords($value);
    	// }
    	// $filterColumn = implode("_",explode("-", $modelReference)) .'_id';
    	// $modelPath = 'App\Backend\Models\Settings\\'.$modelName;
    	// $model = new $modelPath();
        $modelName = '';
        $stringToArryConvert = explode("-",$modelReference);
        foreach ($stringToArryConvert as $value) {
             $modelName .= ucwords($value);
         }
         $arrayToStringConvert = implode("_",$stringToArryConvert);
         $filterColumn = $arrayToStringConvert."_id";
         $modelPath = 'App\Backend\Models\Settings\\'.$modelName;
         $model = new $modelPath();
    	try{
    		DB::beginTransaction();
    		$result = $model::where($filterColumn,$id)
    				->update([
    					'status' =>Helper::getStatus($action),
    					'updated_by' => 1
    				]);
    		if($result){
    			DB::commit();
    			return response()->json(['success' => true, 'message' => ucwords($action) . ' Successfull !!']);
    		}else{
    			DB::rollback();
    			return response()->json(['error' => true, 'message' => 'Something Went Wrong !!']);
    		}		
    	}catch(\Exception $e){
    		DB::rollback();
    		//return $e;
    		return response()->json(['error' => true, 'message' => $e->errorInfo[2]]);
    	}

    	
    }

    public function updateSaveCategory(Request $request)
    {
            $this->validate($request, [
                'category_name_lang1' => 'required',
                'category_name_lang2' => 'required',
            ]);

            try{
                DB::beginTransaction();
                   $updateCategory = Category::where('category_id',$request->category_id)
                        ->update([
                            'category_name_lang1' => $request->category_name_lang1,
                            'category_name_lang2' => $request->category_name_lang2,
                            'is_selected' => $request->is_selected,
                            'view_order'  => $request->view_order,
                            'updated_by'  => 1,
                            'updated_at'  => date('Y-m-d H:i:s')
                        ]);
                if($updateCategory){
                    DB::commit();
                    return response()->json(['success' => true, 'message' => 'Category Updated Successfully !!!']);
                }else {
                    DB::rollback();
                    return response()->json(['error' => true, 'message' => 'Something Went Wrong !!!']);
                }        
            }catch(\Exception $e){
                DB::rollback();
                return $e;
                return response()->json(['error' => true, 'message' => $e->errorInfo[2]]);
            }
    }

    // @@===============Category Panel End===============@@

    // @@===============Sub Category Panel Start===============@@

    public function addSubCategory()
    {
        $categories = ['' => 'Please Select Category'] +
                $categories = Category::where('status',1)
                    ->pluck('category_name_lang1','category_id')
                    ->all();
            // echo "<pre>";
            // print_r($categories);
            // echo "</pre>";
            // exit();           
        return view($this->view_page_url.'subCategory.addSubCategory',compact('categories'));
    }
    public function saveSubCategory(Request $request)
    {
        //return $request->all();
        $this->validate($request, [
            'category_name_lang1'     => 'required',
            'sub_category_name_lang1' => 'required',
            'sub_category_name_lang2' => 'required',
            'view_order'              => 'required',
        ]);
        try{
        DB::beginTransaction();
           $subCategory = SubCategory::insertGetId([
                'category_id' => $request->category_name_lang1,
                'sub_category_name_lang1' => $request->sub_category_name_lang1,
                'sub_category_name_lang2' => $request->sub_category_name_lang2,
                'view_order' => $request->view_order,
                'created_by' => 1,
                'created_at' => date('Y-m-d H:i:s')
        ]); 
           if($subCategory){
            if($request->hasFile('featured_image')){
                    $featured_image = $request->file('featured_image');
                    $fileName = $subCategory . '-' .time() . '.' .$featured_image->getClientOriginalExtension();
                $img = Image::make($featured_image)->resize(350, 350)->save(public_path('images/subcategory/featured_image/' . $fileName));
                if($fileName != null){
                    $updateImage = SubCategory::where('sub_category_id',$subCategory)
                        ->update([
                            'featured_image' => $fileName,
                            'updated_at'    => date('Y-m-d H:i:s'),
                            'updated_by'    => 1
                        ]);
                   }
            }
            DB::commit();
            Session::flash('success','Sub Category Created Successfull !!');
           }else {
            DB::rollback();
            Session::flash('error','Something Went Wrong !!');
           }
        }catch(\Exception $e){
            DB::rollback();
            return $e;
            Session::flash('error',$e->errorInfo[2]);
        }
        return redirect()->route('settings.setup');
    }

    public function viewSubCategory()
    {
        $subCategories = SubCategory::whereIn('status',[0,1])->get();
       
        // dd($subCategories->category->category_id);
        // dd();

        $categories = ['' => 'Please Select Category'] +
                    Category::whereIn('status', [0,1])
                    ->pluck('category_name_lang1','category_id')
                    ->all();
        // dd($categories);
                    

        // $subCategories = DB::table('sub_categories as sc')
        //                 ->join('categories as c','sc.category_id', '=', 'c.category_id')
        //                 ->whereIn('sc.status',[0,1])
        //                 ->get([
        //                     'sc.*',
        //                     'c.category_id',
        //                     'c.category_name_lang1',
        //                 ]);
            // echo "<pre>";
            // print_r($subCategories);
            // echo "</pre>";
            // exit();
        return view($this->view_page_url.'subCategory.viewSubCategory',compact('subCategories','categories'));
    }

    public function saveUpdateSubCategory(Request $request)
    {
        //return $request->all();
        $this->validate($request, [
            'category_name_lang1' => 'required',
            'sub_category_name_lang1' => 'required',
            'sub_category_name_lang2' => 'required',
            'view_order' => 'required',
        ]);

        try{
            DB::beginTransaction();
            $updateSubCategory = subCategory::where('sub_category_id',$request->sub_category_id)
                ->update([
                    'category_id'             =>$request->category_name_lang1,
                    'sub_category_name_lang1' => $request->sub_category_name_lang1,
                    'sub_category_name_lang2' => $request->sub_category_name_lang2,
                    'view_order'              => $request->view_order,
                ]);
            if($updateSubCategory){
                DB::commit();
                return response()->json(['success' => true, 'message' => 'Sub Category Updated Successfully !!']);
            }else {
                DB::rollback();
                return response()->json(['error' => true, 'message' => 'Something Went Wrong !!']);
            }    
        }catch(\Exception $e){
            DB::rollback();
            //return $e;
            return response()->json(['error' => true, 'message' => $e->errorInfo[2]]);
        }
    }
    // @@===============Sub Category Panel End===============@@

    // @@===============Sub Category Details Panel Start===============@@

    public function addSubCategoryDetails()
    {
        $categories = ['' => 'Please Select Category'] +
                    Category::whereIn('status', [0,1])
                    ->pluck('category_name_lang1','category_id')
                    ->all();

        return view($this->view_page_url.'subCategoryDetails.addSubCategoryDetails',compact('categories'));
    }

    public function categoryWiseSubcategoryList($categoryId)
    {
        return SubCategory::where('category_id',$categoryId)
            ->get();
    }

    public function saveSubCategoryDetails(Request $request)
    {
        //return $request->all();
        try{
            DB::beginTransaction();
            $saveSabSabCategory = SubSubCategory::insertGetId([
                'category_id' => $request->category_id,
                'sub_category_id' => $request->sub_category_name_id,
                'sub_sub_category_name_lang1' => $request->sub_sub_category_name_lang1,
                'sub_sub_category_name_lang2' => $request->sub_sub_category_name_lang2,
                'created_by'       => 1,
                'created_at'       => date('Y-m-d H:i:s'),
            ]);
            if($saveSabSabCategory){
                DB::commit();
                Session::flash('success', 'Sub Category Details created Successfully !!');
            }else{
                 DB::rollback();
                Session::flash('error', 'Something Went Wrong !!');
            }
        }catch(\Exception $e){
            DB::rollback();
            //return $e;
            Session::flash('error', $e->errorInfo[2]);
        }
        return redirect()->route('settings.setup');
    }

    public function viewSubCategoryDetails()
    {
        $subCategoriesDetails = SubSubCategory::whereIn('status', [0,1])->get();
         // echo $subCategoriesDetails->subCategoryList->sub_category_name_lang1;
         //echo $subCategoriesDetails->subCategoryList->category->category_id;

        // echo "<pre>";
        // print_r($subCategoriesDetails);
        // echo "</pre>";
        // exit();
        $categories = ['Please Select Category'] +
                Category::whereIn('status', [0, 1])
                    ->pluck('category_name_lang1', 'category_id')
                    ->all();

        $subCategories = ['Please Select Sub Category'] +
                SubCategory::whereIn('status', [0, 1])
                ->pluck('sub_category_name_lang1','sub_category_id')
                ->all(); 

        return view($this->view_page_url.'subCategoryDetails.viewSubCategoryDetails',compact('subCategoriesDetails','categories','subCategories'));
    }

    public function saveUpdateSubCategoryDetails(Request $request)
    {
        //return $request->all();
        $this->validate($request, [
            'category_name_lang1' => 'required',
            'sub_category_name_lang1' => 'required',
            'sub_sub_category_name_lang1' => 'required',
            'sub_sub_category_name_lang2' => 'required',
        ]);

        try{
            DB::beginTransaction();
           $updateSubCategoryDetails = SubSubCategory::where('sub_sub_category_id',$request->sub_sub_category_id)
            ->update([
                'category_id' => $request->category_name_lang1,
                'sub_category_id' => $request->sub_category_name_lang1,
                'sub_sub_category_name_lang1' => $request->sub_sub_category_name_lang1,
                'sub_sub_category_name_lang2' => $request->sub_sub_category_name_lang2,
                'updated_by' => 1,
                'updated_at' => date('Y-m-d H:s:i'),
            ]); 
           if($updateSubCategoryDetails){
                DB::commit();
                return response()->json(['success' => true, 'message' => 'Sub Category Details Updated Successfully !!']);
           }else {
                DB::rollback();
                return response()->json(['error' => true, 'message' => 'Something Went Wrong !!']);
           } 
        }catch(\Exception $e){
            DB::rollback();
            //return $e;
            return response()->json(['error' => true, 'message' => $e->errorInfo[2]]);
        }
    }
    // @@===============Sub Category Details Panel Start===============@@

    // @@===============Color Panel Start===============@@

    public function addColor()
    {
        return view($this->view_page_url.'color.addColor');
    }

    public function saveColor(Request $request)
    {
        //return $request->all();
        // $this->validate($request, [
        //     'color_name_lang1' => 'required',
        //     'color_name_lang2' => 'required',
        //     'color_code'       => 'required'
        // ]);
        try{
            DB::beginTransaction();
            $saveColor = Color::insertGetId([
                'color_name_lang1' =>$request->color_name_lang1,
                'color_name_lang2' =>$request->color_name_lang2,
                'color_code'       =>$request->color_code,
                'created_at'       => date("Y-m-d H:i:s"),
                'created_by'       => 1, 
            ]);
            if($saveColor){
                DB::commit();
                Session::flash('success', 'Color Add Successfully!!');
            }else {
                DB::rollback();
                Session::flash('error','Something Went Wrong !!');
            }
        }catch(\Exception $e){
            DB::rollback();
            //return $e;
            Session::flash('error', $e->errorInfo[2]);
        }
        return redirect()->route('settings.setup');
    }

    public function viewColor()
    {
        $colors = Color::whereIn('status', [0,1])->get();
        return view($this->view_page_url.'color.viewColor',compact('colors'));
    }

    public function saveUpdateColor(Request $request)
    {
        //return $request->all();
       $this->validate($request, [
            'color_name_lang1' => 'required',
            'color_name_lang2' => 'required',
            'color_code'       => 'required'
        ]);
        try{
            DB::beginTransaction();
            $updateColor = Color::where('color_id',$request->color_id)
                    ->update([
                        'color_name_lang1' => $request->color_name_lang1,
                        'color_name_lang2' => $request->color_name_lang2,
                        'color_code' => $request->color_code,
                        'updated_at' => date("Y-m-d H:i:s"),
                        'updated_by' => 1,
                    ]);
            if($updateColor) {
                DB::commit();
                return response()->json(['success' => true, 'message' => 'Color Updated Successfully!!']);
            }else {
                DB::rollback();
                return response()->json(['error' => true, 'message' => 'Something Went Wrong !!']);
            }       
            
        }catch(\Exception $e){
            DB::rollback();
            //return $e;
            return response()->json(['error' => true, 'message' => $e->errorInfo[2]]);
        }
    }
    // @@===============Color Panel End===============@@

    // @@===============Size Panel Start===============@@

    public function addSize()
    {
        return view($this->view_page_url.'size.addSize');
    }

    public function saveSize(Request $request)
    {
        //return $request->all();
        $this->validate($request, [
            'size_title_lang1' => 'required',
            'size_title_lang2' => 'required'
        ]);

        try{
            DB::beginTransaction();
            $saveSize = Size::insertGetId([
                   'size_title_lang1' => $request->size_title_lang1, 
                   'size_title_lang2' => $request->size_title_lang2, 
            ]);
            if($saveSize){
                DB::commit();
                Session::flash('success', 'Size Added Successfully');
            }else {
                DB::rollback();
                Session::flash('error', 'Something Went Wrong');
            }
        }catch(\Exception $e){
            DB::rollback();
            //return $e;
            Session::flash('error', $e->errorInfo[2]);

        }
        return redirect()->route('settings.setup');
    }

    public function viewSize()
    {
        $sizes = Size::whereIn('status',[0,1])->get();
        return view($this->view_page_url.'size.viewSize',compact('sizes'));
    }

    public function saveUpdateSize(Request $request)
    {
        // return $request->all();
       $this->validate($request, [
            'size_title_lang1' => 'required',
            'size_title_lang2' => 'required'
        ]);
        try{
            DB::beginTransaction();
            $updateSize = Size::where('size_id',$request->size_id)
                    ->update([
                        'size_title_lang1' => $request->size_title_lang1,
                        'size_title_lang2' => $request->size_title_lang2,
                        'updated_at' => date("Y-m-d H:i:s"),
                        'updated_by' => 1,
                    ]);
            if($updateSize) {
                DB::commit();
                return response()->json(['success' => true, 'message' => 'Size Updated Successfully!!']);
            }else {
                DB::rollback();
                return response()->json(['error' => true, 'message' => 'Something Went Wrong !!']);
            }       
            
        }catch(\Exception $e){
            DB::rollback();
            //return $e;
            return response()->json(['error' => true, 'message' => $e->errorInfo[2]]);
        }
    }
    // @@===============Size Panel End===============@@


    // @@===============City Panel End===============@@

    public function addCity()
    {
        return view($this->view_page_url.'city.addCity');
    }

    public function saveCity(Request $request)
    {
        //return $request->all();
        $this->validate($request, [
            'city_name_lang1' => 'required',
            'city_name_lang2' => 'required',
            'cost'            => 'required',  
        ]);

        try{
            DB::beginTransaction();
            $saveCity = City::insertGetId([
                'city_name_lang1' => $request->city_name_lang1,
                'city_name_lang2' => $request->city_name_lang2,
                'cost'            => $request->cost,
                'cost'            => $request->cost,
                'created_at'       => date("Y-m-d H:i:s"),
                'created_by'       => 1, 
            ]);

         if($saveCity){
            DB::commit();
            Session::flash('success', 'City Added Successfully !!');
         }else {
            DB::rollback();
            Session::flash('error', 'Something Went Wrong');
         }   
        }catch(\Exception $e){
            DB::rollback();
            return $e;
            Session::flash('error', $e->errorInfo[2]);
        }
        return redirect()->route('settings.setup');
    }

    public function viewCity()
    {
        $cities = City::whereIn('status', [0,1])->get();
        return view($this->view_page_url.'city.viewCity',compact('cities'));
    }

    public function saveUpdateCity(Request $request)
    {
        //return $request->all();
       $this->validate($request, [
            'city_name_lang1' => 'required',
            'city_name_lang2' => 'required',
            'cost'            => 'required'
        ]);
        try{
            DB::beginTransaction();
            $updateCity = City::where('city_id',$request->city_id)
                    ->update([
                        'city_name_lang1' => $request->city_name_lang1,
                        'city_name_lang2' => $request->city_name_lang2,
                        'cost'            => $request->cost,
                        'updated_at'      => date("Y-m-d H:i:s"),
                        'updated_by'      => 1,
                    ]);      
            if($updateCity) {
                DB::commit();
                return response()->json(['success' => true, 'message' => 'City Updated Successfully!!']);
            }else {
                DB::rollback();
                return response()->json(['error' => true, 'message' => 'Something Went Wrong !!']);
            }       
            
        }catch(\Exception $e){
            DB::rollback();
            //return $e;
            return response()->json(['error' => true, 'message' => $e->errorInfo[2]]);
        }
    }

    

} 
