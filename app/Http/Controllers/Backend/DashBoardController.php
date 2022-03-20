<?php

namespace App\Http\Controllers\Backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Backend\Models\Settings\Category;
use DB;
use Session;
use Image;
class DashBoardController extends Controller
{
	public $view_page_url;
	public function __construct()
	{
		$this->view_page_url = 'Backend.';
	}
    public function index()
    {
        if(Session::get('xyz')){
    	   return redirect()->intended('/dashboard');
        }else{
            return view($this->view_page_url.'login');
        }
    }

    public function autoComplete(Request $request)
    {
    	$terms = $request->term;
    	$data = Category::where('status',[0,1])
    			->where('category_name_lang1','LIKE','%'.$terms.'%')
    			->take(10)
    			->get();	
    	$result = [];
    	foreach ($data as $key=> $value) {
    				$result[] = [
    					'id' => $key,
    					'value' => $value->city_name_lang1
    				];
    			}
    		return response()->json($result);			
    }

    //Test 
    public function Test()
    {
        $products = DB::table('product_tests')
                ->join('images','images.product_test_id', '=','product_tests.product_test_id')
                ->select('product_tests.*','images.*')
                ->groupBy('product_tests.product_test_id')
                ->get();

        $images = DB::table('product_tests')
                ->join('images','images.product_test_id', '=','product_tests.product_test_id')
                ->select('images.*')
                ->get();        

        // echo '<pre>';
        // print_r($images);
        // exit();        
        return view($this->view_page_url.'test.addRecord',compact('products','images'));
    }

    public function addRecord(Request $request)
    {
        $data = $request->all();
        DB::beginTransaction();
        try{
             $insertId = DB::table('product_tests')
               ->insertGetId([
                'product_name' => $request->product_name,
                'created_at'   => date('Y-m-d H:i:s')
               ]);
              if($insertId){
        //=============@@ For Loop Multiple Image Insert in DB Start Panel@@================
                // for($i = 0; $i < count($data['caption']); $i++){
                //     $fileName = $insertId.$i . '-' .time(). '.' . $data['path'][$i]->getClientOriginalExtension();
                //     Image::make($data['path'][$i])->resize(320,540)->save(public_path('images/product/'. $fileName));
                //     DB::table('images')
                //               ->insert([
                //                 'product_test_id' => $insertId,
                //                 'path'            => $fileName,
                //                 'caption'         => $data['caption'][$i],
                //                 'created_at'      => date('Y-m-d H:i:s') 
                //               ]);  
                // }
         //=============@@ For Loop Multiple Image Insert in DB End Panel@@================

         //=============@@ Foreach Loop Multiple Image Insert in DB Start Panel@@================
                foreach ($request->caption as $key=> $value) {
                    $fileName = $insertId.$key. '-' . time(). rand(1000,5000). '.' .$request->path[$key]->getClientOriginalExtension();
                    Image::make($request->path[$key])->resize(500,500)->save(public_path('images/product/'. $fileName));
                    //return $fileName;
                    DB::table('images')
                        ->insert([
                            'product_test_id' => $insertId,
                            'path' => $fileName,
                            'caption' => $request->caption[$key],
                            'created_at' => date('Y-m-d H:i:s')
                        ]);
                }
        //========@@ Foreach Loop Multiple Image Insert in DB End Panel @@===========       
                DB::commit();
                Session::flash('success','Product Add Successfully');
              }else {
                DB::rollback();
                Session::flash('error','Something Went Wrong!!');
              } 
               
        }catch(\Exception $e){
            return $e;
            DB::rollback();
            Session::flash('error',$e->errorInfo[2]);
        }
        return redirect()->back();
    }

    public function editRecord($productId)
    {
        $products = DB::table('product_tests')
                ->join('images','images.product_test_id', '=','product_tests.product_test_id')
                ->where('product_tests.product_test_id',$productId)
                ->select('product_tests.*','images.*')
                ->first();
        $images = DB::table('product_tests')
                ->join('images','images.product_test_id', '=','product_tests.product_test_id')
                ->where('product_tests.product_test_id',$productId)
                ->select('images.*')
                ->get();          
        return view($this->view_page_url.'test.editRecord',compact('products','images'));
    }

    public function updateRecord(Request $request,$productId)
    {
        //return $productId;
        //return $request->image;
        $data = $request->all();;
        //return $request;
        $findProduct = DB::table('product_tests')->where('product_test_id',$productId)->first();
        if($findProduct){
            DB::beginTransaction();
            try{
               $updateProduct = DB::table('product_tests')
                     ->where('product_test_id',$productId)
                     ->update([
                        'product_name' => $request->product_name,
                        'updated_at'   => date('Y-m-d H:i:s')
                     ]);
                if($updateProduct){
                    if(isset($request->image)){
                      foreach ($request->image as $key=>$image) {
                        if(!empty($image['image_id'])){
                            if(isset($image['path'])){
                                $fileName = $productId.$key. '-'. time().rand(1000,5000). '.' . $image['path']->getClientOriginalExtension();
                                //return $fileName;
                                Image::make($image['path'])->resize(500,500)->save(public_path('images/product/'. $fileName));
                            if($fileName != null){
                                DB::table('images')
                                    ->updateOrInsert([
                                        'image_id' => $image['image_id']
                                    ],[
                                        'product_test_id' => $productId,
                                        'path'            => $fileName,
                                        'caption'         => $image['caption']
                                    ]);
                            }    
                         }
                        }else{
                               if(isset($image['path'])){
                                $fileName = $productId.$key. '-'. time().rand(1000,5000). '.' . $image['path']->getClientOriginalExtension();
                                //return $fileName;
                                Image::make($image['path'])->resize(500,500)->save(public_path('images/product/'. $fileName));
                            if($fileName != null){
                                DB::table('images')
                                    ->insert([
                                        'product_test_id' => $productId,
                                        'path'            => $fileName,
                                        'caption'         => $image['caption']
                                    ]);
                            }    
                         }
                        }
                    }
                }
                    DB::commit();
                    Session::flash('success', 'Updated Successfully');
                }else {
                    DB::rollback();
                    Session::flash('error', 'Something Went Wrong !!');

                }     
            }catch(\Exception $e){
              return $e;
              DB::rollback();
              Session::flash('error', $e->errorInfo[2]);  
            }
        }
        return redirect()->back();

    }
}
