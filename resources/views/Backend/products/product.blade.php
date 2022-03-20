@extends('Backend.app')
@section('extra-css')
<link rel="stylesheet" href="{{URL::to('public/assets/plugins/smartwizard/css/smart_wizard.css')}}">
<link rel="stylesheet" href="{{URL::to('public/assets/plugins/smartwizard/css/smart_wizard_theme_arrows.css')}}">
<link rel="stylesheet" type="text/css" href="{{URL::to('public/assets/plugins/chosen/css/chosen.min.css')}}">
<style type="text/css">
   .select2-container--default .select2-selection--single,
   .select2-selection .select2-selection--single {
   width: 380px;
   }
</style>
@endsection
@section('content-header')
<section class="content-header">
   <h1>
      Product List
      <small>Preview</small>
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
      <li><a href="#">Forms</a></li>
      <li class="active">Product</li>
   </ol>
</section>
@endsection
@section('main-content')
<!-- Main content -->
<section class="content">
   <!-- Custom Tabs -->
   <div class="nav-tabs-custom">
      <ul class="nav nav-tabs">
         <li class="active"><a href="#view-product" data-toggle="tab">View Product</a></li>
         <li><a href="#add-product" data-toggle="tab">Add Product</a></li>
         <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
      </ul>
      <div class="tab-content">
         <div class="tab-pane active" id="view-product">
            <div class="box box-default">
               <div class="box-body">
                  <div class="row">
                     <div class="col-md-12">
                        <table id="productDatatable" class="table table-bordered table-striped">
                           <thead>
                              <tr>
                                 <th>SL</th>
                                 <th>Category</th>
                                 <th>Product Name</th>
                                 <th>Image</th>
                                 <th>Price</th>
                                 <th>Discount</th>
                                 <th>Quantity</th>
                                 <th>Comission</th>
                                 <th>Status</th>
                                 <th>Action</th>
                              </tr>
                           </thead>
                           <tbody>
                              @if(count($products) > 0)
                              @foreach($products as $product)
                              <tr>
                                 <td>{{$product->product_id}}</td>

                                 
                                 <td>{{$product->product_name_lang1}}</td>
                                 <td> 
                                 @foreach($product->productImages as $img)
                                 @if($img->status == 1)
                                    <img src="{{URL::to('public/images/product/')}}/{{$img->path}}"alt="productimg" height="40px" width="40px">
                                 @endif   
                                 @endforeach
                                 </td>

                                 <td>{{$product->sale_price}}</td>
                                 <td>{{$product->discount}}</td>
                                 <td>{{$product->quantity}}</td>
                                 <td>{{$product->commission}}</td>
                                 <td>
                                    
                                    <label class="label label-warning" style="@if($product->status == 1) display: none;@endif">
                                    Inactive
                                    </label>
                                   
                                    <label class="label label-success"  style="@if($product->status == 0) display: none;@endif">
                                    Active
                                    </label>
                                    
                                 </td>
                                 <td>
                                    
                                    <a href="javascript:;" class="btn btn-success btn-xs" style="@if($product->status == 1) display: none;@endif" onclick="updateStatus('product','active', {{$product->product_id}})">
                                    <i class="fa fa-check-square-o" title="Active"></i>	
                                    </a>
                                    
                                    <a href="javascript:;" class="btn btn-warning btn-xs" style="@if($product->status == 0) display: none;@endif" onclick="updateStatus('product','inactive',{{$product->product_id}})">
                                    <i class="fa fa-ban" title="Inactive"></i>	
                                    </a>
                                    
                                    <a href="{{route('products.edit-product',$product->product_id)}}" class="btn btn-info btn-xs" id="reference_{{$product->product_id}}">
                                    <i class="fa fa-edit" title="Edit"></i>	
                                    </a>
                                    <a href="javascript:;" class="btn btn-danger btn-xs" style="@if($product->status == 2) display: none;@endif" onclick="updateStatus('product','delete',{{$product->product_id}})">
                                    <i class="fa fa-trash" title="Delete"></i>	
                                    </a>
                                 </td>
                              </tr>
                              @endforeach
                              @endif
                           </tbody>
                           <tfoot>
                              <tr>
                                 <th>SL</th>
                                 <th>Category</th>
                                 <th>Product Name</th>
                                 <th>Image</th>
                                 <th>Price</th>
                                 <th>Discount</th>
                                 <th>Quantity</th>
                                 <th>Comission</th>
                                 <th>Status</th>
                                 <th>Action</th>
                              </tr>
                           </tfoot>
                        </table>
                     </div>
                  </div>
               </div>
               <div class="box-footer">
               </div>
            </div>
         </div>
         <!-- /.tab-pane -->
         <div class="tab-pane" id="add-product">
            <div class="box box-default">
               <div class="box-body">
                  <div class="row">
                     <div class="col-md-12">
                        <form action="{{route('products.save-product.post')}}" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8" novalidate="true" enctype="multipart/form-data">
                           {{csrf_field()}}
                           <!-- SmartWizard html -->
                           <div id="smartwizard" class="sw-main sw-theme-arrows">
                              <ul class="nav nav-tabs step-anchor">
                                 <li class="nav-item active"><a href="#step-1" class="nav-link">Step 1<br><small>Product Information</small></a></li>
                                 <li class="nav-item"><a href="#step-2" class="nav-link">Step 2<br><small>Product Details</small></a></li>
                                 <li class="nav-item"><a href="#step-3" class="nav-link">Step 3<br><small>Image Information</small></a></li>
                              </ul>
                              <div class="sw-container tab-content" style="min-height: 152px;">
                                 <div id="step-1" class="tab-pane step-content" style="display: block;">
                                    <div id="form-step-0" role="form" data-toggle="validator">
                                       <div class="form-group">
                                          <div class="col-md-12">
                                             <label for="select-category" class="col-md-2">Select Category:</label>
                                             <div class="col-sm-4">
                                                {{ Form::select('category_id', $categories, null, ['class' => 'form-control select2', 'id' => 'category_id'])}}
                                                <div class="help-block with-errors"></div>
                                             </div>
                                             <label for="select-sub-category" class="col-md-2">Select Sub Category:</label>
                                             <div class="col-sm-4">
                                                <select class="form-control select2" name="sub_category_id" id="sub_category_id">
                                                   
                                                </select>
                                                <div class="help-block with-errors"></div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <div class="col-md-12">
                                             <label for="sub_sub_category_id" class="col-md-2">Select Sub Sub Category:</label>
                                             <div class="col-sm-4">
                                                <select class="form-control select2" name="sub_sub_category_id" id="sub_sub_category_id">
                                                   
                                                </select>
                                                <div class="help-block with-errors"></div>
                                             </div>
                                             <label for="select-color" class="col-md-2">Select Color:</label>
                                             <div class="col-sm-4">
                                                <!-- {{ Form::select('color_id[]',$colors,null, ['class' => 'form-control chosen-select select2', 'multiple tabindex' =>'6', 'id' => 'color_id', 'style' => 'width:380px;']) }} -->
                                                   <select class="form-control chosen-select" data-placeholder="Please Select a Color" multiple tabindex="4" name="color_id[]">

                                                   @if(count($colors) > 0)
                                                   @foreach($colors as $color)
                                                   <option value="{{$color->color_id}}">
                                                      {{$color->color_name_lang1}}
                                                   </option>
                                                   @endforeach
                                                   @endif
                                                </select>
                                                
                                                <div class="help-block with-errors"></div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <div class="col-md-12">
                                           <label for="select-size" class="col-md-2">Select Size:</label>
                                             <div class="col-sm-4">
                                                <!-- {{ Form::select('size_id[]',$sizes,null, ['class' => 'form-control chosen-select select2', 'multiple tabindex' =>'6', 'id' => 'size_id', 'style' => 'width:380px;']) }} -->
                                                <select class="form-control chosen-select" data-placeholder="Please Select a Size" multiple tabindex="4" name="size_id[]" id="size_id">
                                                   @if(count($sizes) > 0)
                                                   @foreach($sizes as $size)
                                                   <option value="{{$size->size_id}}">{{$size->size_title_lang1}}</option>
                                                   @endforeach
                                                   @endif
                                                </select>
                                                <div class="help-block with-errors"></div>
                                             </div>
                                             <label for="product_name_lang1" class="col-md-2">Product Name English:</label>
                                             <div class="col-sm-4">
                                                <input type="text" class="form-control" name="product_name_lang1" id="product_name_lang1" placeholder="Write your Product Name English">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <div class="col-md-12">
                                             <label for="product_name_lang2" class="col-md-2">Product Name Bangla:</label>
                                             <div class="col-sm-4">
                                                <input type="text" class="form-control" name="product_name_lang2" id="product_name_lang2" placeholder="Write your Product Name Bangla">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                             <label for="market_price" class="col-md-2">Market Price:</label>
                                             <div class="col-sm-4">
                                                <input type="text" class="form-control market_price_discount" name="market_price" id="market_price">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <div class="col-md-12">
                                             <label for="discount" class="col-md-2">Discount:</label>
                                             <div class="col-sm-4">
                                                <input type="text" class="form-control market_price_discount" name="discount" id="discount">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                             <label for="sale_price" class="col-md-2">Sale Price:</label>
                                             <div class="col-sm-4">
                                                <input type="text" class="form-control sale_price product_commission" name="sale_price" id="sale_price">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div id="step-2" class="tab-pane step-content">
                                    <div id="form-step-1" role="form" data-toggle="validator">


                                       <div class="form-group">
                                          <div class="col-md-12">
                                             <label for="commission" class="col-md-2">Commission (%):</label>
                                             <div class="col-sm-4">
                                                <input type="text" name="commission" id="commission" class="form-control product_commission">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                             <label for="product_code" class="col-md-2">E-shopping Commission:</label>
                                             <div class="col-sm-4">
                                                <input type="text" class="form-control eshopping_commission" name="commission_amount" id="commission_amount">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                          </div>
                                       </div>

                                       <div class="form-group">
                                          <div class="col-md-12">
                                             <label for="placement_type" class="col-md-2">Product Placement:</label>
                                             <div class="col-sm-4">
                                                <select class="form-control select2" name="placement_type" id="placement_type">
                                                   <option selected="" disabled="">Please Select a Product</option>
                                                   <option value="1">Normal Product</option>
                                                   <option value="2">Slider Product</option>
                                                   <option value="3">Selected Product</option>
                                                </select>
                                                <div class="help-block with-errors"></div>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="form-group">
                                          <div class="col-md-12">
                                             <label for="quantity" class="col-md-2">Product Quantity:</label>
                                             <div class="col-sm-4">
                                                <input type="text" class="form-control" name="quantity" id="quantity" value="100">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                             <label for="product_code" class="col-md-2">Product Code:</label>
                                             <div class="col-sm-4">
                                                <input type="text" class="form-control" name="product_code" id="product_code">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                          </div>
                                       </div>

                                       <div class="form-group">
                                          <div class="col-md-12">
                                             <label for="details_lang1" class="col-md-2">Product Details English:</label>
                                             <div class="col-sm-4">
                                                <textarea class="form-control" name="details_lang1" id="details_lang1" rows="3" placeholder="Write Product Details English"></textarea>
                                                <div class="help-block with-errors"></div>
                                             </div>
                                             <label for="details_lang2" class="col-md-2">Product Details Bangla:</label>
                                             <div class="col-sm-4">
                                                <textarea class="form-control" name="details_lang2" id="details_lang2" rows="3" placeholder="Write Product Details Bangla"></textarea>
                                                <div class="help-block with-errors"></div>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div id="step-3" class="tab-pane step-content">
                                    <div id="form-step-2" role="form" data-toggle="validator">
                                       <div class="form-group">
                                          <div class="col-md-12">
                                             <label for="path" class="col-md-2">Prouduct Image:</label>
                                             <div class="col-sm-4">
                                                <input type="file" class="form-control" name="path[]" required="">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                             <label for="caption" class="col-md-2">Image Title: </label>
                                             <div class="col-sm-3">
                                                <input type="text" class="form-control" name="caption[]" placeholder="Write Image Title" required="">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                             <div class="col-sm-1">
                                                <!-- <button type="button" class="btn btn-xs btn-success btn-add-image" title="Add More Image">
                                                   <span class="fa fa-plus"></span>
                                                   </button> -->
                                                <a href="javascript:;" class="btn btn-xs btn-success btn-add-image" title="Add More Image">
                                                <i class="fa fa-plus"></i>
                                                </a>
                                             </div>
                                          </div>
                                       </div>
                                       <div class="load-dynamic-image-content">    </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- /.tab-pane -->
      </div>
      <!-- /.tab-content -->
   </div>
   <!-- nav-tabs-custom -->
   <!-- SELECT2 EXAMPLE -->
</section>
@endsection
@section('extra-js')
<script src="{{URL::to('public/assets/plugins/validator/validator.min.js')}}"></script>
<script src="{{URL::to('public/assets/plugins/smartwizard/js/jquery.smartWizard.js')}}"></script>
<script type="text/javascript" src="{{URL::to('public/assets/plugins/chosen/js/chosen.jquery.min.js')}}"></script>
@endsection
@section('script')

<script type="text/javascript">

   $(document).ready(function(){
   	$('#productDatatable')
   		.addClass( 'nowrap' )
   		.dataTable( {
   			responsive: true,
   			columnDefs: [
   				{ targets: [-1, -3], className: 'dt-body-right' }
   			]
   		});
   	});
   $(document).ready(function(){
   	var btnFinish = $('<button></button>').text('Finish')
              .addClass('btn btn-info')
              .on('click', function(){
                  if( !$(this).hasClass('disabled')){
                      var elmForm = $("#myForm");
                      if(elmForm){
                          elmForm.validator('validate');
                          var elmErr = elmForm.find('.has-error');
                          if(elmErr && elmErr.length > 0){
                              alert('Oops we still have error in the form');
                              return false;
                          }else{
                              alert('Great! we are ready to submit form');
                              elmForm.submit();
                              return false;
                          }
                      }
                  }
              });
          var btnCancel = $('<button></button>').text('Cancel')
              .addClass('btn btn-danger')
              .on('click', function(){
                  $('#smartwizard').smartWizard("reset");
                  $('#myForm').find("input, textarea").val("");
              });
              // Smart Wizard
          $('#smartwizard').smartWizard({
              selected: 0,
              theme: 'dots',
              transitionEffect:'fade',
              toolbarSettings: {toolbarPosition: 'bottom',
                                toolbarButtonPosition: 'right',
                                toolbarExtraButtons: [btnFinish, btnCancel]
                              },
              anchorSettings: {
                  markDoneStep: true, // add done css
                  markAllPreviousStepsAsDone: true, // When a step selected by url hash, all previous steps are marked done
                  removeDoneStepOnNavigateBack: true, // While navigate back done step after active step will be cleared
                  enableAnchorOnDoneStep: true // Enable/Disable the done steps navigation
              }
          });
          $("#smartwizard").on("leaveStep", function(e, anchorObject, stepNumber, stepDirection) {
              var elmForm = $("#form-step-" + stepNumber);
              // stepDirection === 'forward' :- this condition allows to do the form validation
              // only on forward navigation, that makes easy navigation on backwards still do the validation when going next
              if(stepDirection === 'forward' && elmForm){
                  elmForm.validator('validate');
                  var elmErr = elmForm.children('.has-error');
                  if(elmErr && elmErr.length > 0){
                      // Form validation failed
                      return false;
                  }
              }
              return true;
          });
          $("#smartwizard").on("showStep", function(e, anchorObject, stepNumber, stepDirection) {
              // Enable finish button only on last step
              if(stepNumber == 3){
                  $('.btn-finish').removeClass('disabled');
              }else{
                  $('.btn-finish').addClass('disabled');
              }
          });
          //Date picker
          $('.datepicker').datepicker({
            autoclose: true
          });
   });
   
   //Creating Multi Select Box using Select2 jQuery
   $(document).ready(function(){
      $(".chosen-select").chosen({
          disable_search_threshold: 10,
          no_results_text: "Oops, nothing found!",
          //placeholder_text_multiple: "Select Some Options",
          allow_single_deselect: true,
          width: "100%"
  });
   });
   //Add More Image Javascript
   	$(".btn-add-image").on('click', function(){
   		var content =  '<div class="form-group">'+
                            '<div class="col-md-12">'+
                                  '<label for="path" class="col-md-2">Prouduct Image:</label>' +
                                  '<div class="col-sm-4">' +
                                      '<input type="file" class="form-control" name="path[]">' +
                                      '<div class="help-block with-errors"></div>' +
                                  '</div>' +
                                  '<label for="caption" class="col-md-2">Image Title: </label>' +
                                  '<div class="col-sm-3">' +
                                      '<input type="text" class="form-control" name="caption[]" placeholder="Write Image Title">' +
                                      '<div class="help-block with-errors"></div>' +
                                  '</div>' +
                                  '<div class="col-sm-1">' +
                                  	'<a href="javascript:;" class="btn btn-xs btn-danger btn-remove-image" title="Remove Image">' + 
                                  		'<i class="fa fa-minus"></i>' +
                                  	'</a>' +
                                  '</div>' +  
                              '</div>' +
                          '</div>';
              $(".load-dynamic-image-content").append(content);
              $(".btn-remove-image").on('click', function(){
              	$(this).parent().parent().parent().remove();
              	//$(this).parent().prev().prev().prev().prev().parent().parent().remove();
              });            
   	});
   
   //Active Inactive

    function updateStatus(modelReference,action,id)
   {
      var reference = $("#reference_"+id);
      if(action == 'delete'){
         if(!confirm('Do you want to Delete ?')){
            return false;
         }
      }
      $.ajax({
         url: "update-status/"+modelReference+"/"+action+"/"+id,
          method: "GET",
          dataType: 'json',
          success: function(data){
            //console.log(data);
            if(data.success == true){
               if(action == 'active'){
                  // reference.
                  reference.prev().show().prev().hide();
                  reference.parent().prev().children().next().show().prev().hide();
               }else if(action == 'inactive'){
                  reference.prev().hide().prev().show();
                  reference.parent().prev().children().next().hide().prev().show();
               }else if(action == 'delete'){
                  reference.parent().parent().hide(1000).remove();
               }
               
               $('.box-body-second').show();
               $('.messageBodySuccess').slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
               $('.box-body-second').slideDown(1000).delay(3000).slideUp(1000);
            }else{
               $('.box-body-second').show();
               $('.messageBodyError').slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
            }
          },
          error: function(data){
            $('.box-body-second').show();
            $('.messageBodyError').slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
          }
      });
   }
   
   

   //Get Category Wise Sub Category
   $("#category_id").on('change',function(){
      var categoryId = $(this).val();
      var subCategoryId = $("#sub_category_id");

      $.ajax({
         url: 'categoryWiseSubCategory/' + categoryId,
         method : "GET",
         dataType : "json",
         success: function(data){
            //console.log(data);
            subCategoryId.empty();
            var content = '<option selected="" disabled="">Please Select a Sub Category</option>';
            $.each(data, function(index,value){
               //console.log(value);
               content += '<option value="'+value.sub_category_id+'">'+value.sub_category_name_lang1+'</option>';
            });
            subCategoryId.append(content);
         },
         error:function(){
            alert("Something Went Wrong");
         }

      });
   });

   //Get Sub Category Wise Sub Sub Category Details
   $("#sub_category_id").on('change',function(){
      var subCategoryId = $(this).val();
      var subSubCategoryId = $("#sub_sub_category_id");
      //alert(subCategoryId);

      $.ajax({
         url : 'subCategoryWiseSubSubCategory/' +subCategoryId,
         method : "GET",
         dataType : "json",

         success:function(data){
            //console.log(data);
            subSubCategoryId.empty();
            var content = '<option selected="" disabled="">Please Select a Sub Sub Category</option>';
            $.each(data,function(index, value){
                  content+='<option value="'+value.sub_sub_category_id+'">'+value.sub_sub_category_name_lang1+'</option>';
            });
            subSubCategoryId.append(content);
         },
         error:function(){
            alert("Something Went Wrong");
         }
      });
   });

   //Market price-discount-Sale Price
   $(".market_price_discount").on('keyup', function(){
      var market_price = $("#market_price").val();
      var discount = $("#discount").val();

      if(!market_price){
         return false;
      }
      if(!discount){
         discount = 0;
      }
      var net_sale_price = market_price - discount;
      $("#sale_price").val(net_sale_price);
   });

   //Commission
   $(".product_commission").on('keyup', function(){
      var productCommission = $("#commission").val();
      var salePrice = $("#sale_price").val();
      
      if(!salePrice){
         return false;
      }else {
         var commission = (salePrice * productCommission)/100;
         $(".eshopping_commission").val(commission);
      }
   });

  
</script>
@endsection