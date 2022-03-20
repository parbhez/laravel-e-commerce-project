<?php

namespace App\Http\Controllers\Frontend;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Backend\Models\Settings\Category;
use App\Backend\Models\Products\Product;
use App\Backend\Models\Settings\SubCategory;
use App\Backend\Models\Settings\SubSubCategory;
use App\Backend\Models\Sliders\PhotoSlider;
use App\Custom\Helper;
use Session;
use DB;

class HomeController extends Controller
{

    public function index()
    {
    	$topMenuCategories = $this->getMenuForTopNavigation();
        //$getMenus = HomeController::getMenu();
        $getMenus = self::getMenu();
        // foreach ($getMenus as $key=>$value) {
        //     $p = explode("#",$key);
        //     echo '<pre>';

        //     //print_r($p);
        //     //print_r($key);
        //     print_r($value);
        // }
        // exit();
        $sliders =  $this->topSlider(); 
        $getSelectedProductSliders = $this->getSelectedProductSlider();
    	return view('Frontend.index',compact('topMenuCategories','getMenus','sliders','getSelectedProductSliders'));
    }

    public static function getMenu()
    {
        $result = [];
        //if(Session::get('frontendLanguage') == 1){
                    $categories = Category::where('status',1)
                      ->orderBy('category_id','ASC')
                      ->take(10)
                      ->get();      

         foreach ($categories as $category) {
            $subCategories = SubCategory::where('category_id',$category->category_id)
                                   ->where('status',1)
                                   ->orderBy('sub_category_id','ASC')
                                   ->get();
                if(!$subCategories){
                    $result[$category->category_name_lang1.'#'.$category->icon.'#'.$category->category_id] = 'null';
                     //break;
                 }else{
                    foreach ($subCategories as $subCategory) {
                        $subSubCategories =  SubSubCategory::where('sub_category_id',$subCategory->sub_category_id)
                                         ->where('status',1)
                                         ->orderBy('sub_sub_category_id','ASC')
                                         ->get();         
                        if(!$subSubCategories){
                            $result[$category->category_name_lang1.'#'.$category->icon.'#'.$category->category_id][$subCategory->sub_category_name_lang1.'-'.$subCategory->sub_category_id] = 'null';
                            //break;
                        }else {
                            foreach ($subSubCategories as $subSubCategory) {
                            $result[$category->category_name_lang1.'#'.$category->icon.'#'.$category->category_id][$subCategory->sub_category_name_lang1.'-'.$subCategory->sub_category_id][] = $subSubCategory;                             
                             }  
                        } 
                                           
                    }   
                }
                                
        }  
        return $result; 

    } 
    //     // else {

    //     //         $categories = Category::where('status',1)
    //     //           ->orderBy('category_id','ASC')
    //     //           ->take(10)
    //     //           ->get();

    //     //  foreach ($categories as $category) {
    //     //     $subCategories = SubCategory::where('category_id',$category->category_id)
    //     //                            ->where('status',1)
    //     //                            ->orderBy('sub_category_id','ASC')
    //     //                            ->get();
    //     //         if(!$subCategories){
    //     //             $result[$category->category_name_lang2.'#'.$category->icon.'#'.$category->category_id] = 'null';
    //     //             //break;
    //     //         }else{
    //     //             foreach ($subCategories as $subCategory) {
    //     //                 $subSubCategories =  SubSubCategory::where('sub_category_id',$subCategory->sub_category_id)
    //     //                                  ->where('status',1)
    //     //                                  ->orderBy('sub_sub_category_id','ASC')
    //     //                                  ->get();
    //     //                 if(!$subSubCategories){
    //     //                     $result[$category->category_name_lang2.'#'.$category->icon.'#'.$category->category_id][$subCategory->sub_category_name_lang2.'-'.$subCategory->sub_category_id] = 'null';
    //     //                     //break;
    //     //                 }else {
    //     //                     foreach ($subSubCategories as $subSubCategory) {
    //     //                     $result[$category->category_name_lang2.'#'.$category->icon.'#'.$category->category_id][$subCategory->sub_category_name_lang2.'-'.$subCategory->sub_category_id][] = $subSubCategory;                             
    //     //                      }  
    //     //                 } 
                                           
    //     //             }   
    //     //         }
                                
    //     // }  
    //     // return $result; 
    //     // }
        
    // }


    protected function getMenuForTopNavigation()
    {
        $languageType = 1;
         if($languageType == 1){
            $topMenu = Category::where('status',1)
            ->orderBy('category_id','ASC')
            ->take(5)
            ->get();
        }else {
            $topMenu = Category::where('status',1)
            ->orderBy('category_id','ASC')
            ->take(5)
            ->get();
        }
        return $topMenu;
    }

    protected function getSelectedProductSlider()
    {
         return Product::join('product_wise_image as pwi', 'products.product_id', '=', 'pwi.product_id')
            ->where('pwi.type', 1)
            ->where('products.status', 1)
            ->where('products.placement_type', 2) //product type  1 = normal, 2 = slider, 3 = selected
            ->get([
                'products.product_id as product_id',
                'pwi.*',
                'products.*',
            ]);
    }

    protected function topSlider()
    {
       $sliderPhoto = PhotoSlider::join('categories as c', 'photo_sliders.category_id', '=', 'c.category_id')
            ->leftJoin('sub_categories as sc', 'photo_sliders.sub_category_id', '=', 'sc.sub_category_id')
            ->where('photo_sliders.status', 1)
            ->take(5)
            ->get([
                'photo_sliders.image_path','photo_sliders.sub_category_id',
                'c.category_id as category_id',
                'sc.sub_category_id as sub_category_id',
                'c.*','sc.*'
            ]);
        return $sliderPhoto;    
    }


    


}
