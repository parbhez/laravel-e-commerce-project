@extends('Backend.app') @section('extra-css')
<link rel="stylesheet" href="{{URL::to('public/assets/plugins/smartwizard/css/smart_wizard.css')}}">
<link rel="stylesheet" href="{{URL::to('public/assets/plugins/smartwizard/css/smart_wizard_theme_arrows.css')}}">
<link rel="stylesheet" type="text/css" href="{{URL::to('public/assets/plugins/chosen/css/chosen.min.css')}}">
<style type="text/css">
.select2-container--default .select2-selection--single,
.select2-selection .select2-selection--single {
width: 386px;
}
</style>
@endsection @section('content-header')
<section class="content-header">
<h1>
Product Information
<small>Edit Product</small>
</h1>
<ol class="breadcrumb">
<li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
<li><a href="#">Forms</a></li>
<li class="active">Product</li>
</ol>
</section>
@endsection @section('main-content')
<!-- Main content -->
<section class="content">
<!-- Custom Tabs -->
<div class="box box-default">
<div class="box-header with-border">
<h3 class="box-title">
<a href="{{route('products.product')}}" class="btn btn-info btn-md">
<i class="fa fa-hand-o-left"></i>&nbsp;
View Employee
</a>
</h3>
<div class="box-tools pull-right">
<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
<button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-remove"></i></button>
</div>
</div>
<div class="box-body">
<div class="row">
<div class="col-md-12">
@if($products)
<form action="{{route('products.update-product.post',$products->product_id)}}" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8" novalidate="true" enctype="multipart/form-data">
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
<select class="form-control select2" name="category_id" id="category_id">
<option disabled="" selected="">please Select a Category</option>
@if(count($categories) > 0) @foreach($categories as $key=> $category)
<option value="{{$category->category_id}}" {{ ($category->category_id == $products->categoryList->category_id) ? 'selected' : '' }}>{{$category->category_name_lang1}}</option>
@endforeach @endif
</select>
<div class="help-block with-errors"></div>
</div>
<label for="select-sub-category" class="col-md-2">Select Sub Category:</label>
<div class="col-sm-4">
<select class="form-control select2" name="sub_category_id" id="sub_category_id" required="">
<option value="{{$products->subCategoryList->sub_category_id}}">{{$products->subCategoryList->sub_category_name_lang1}}</option>
</select>
<div class="help-block with-errors"></div>
</div>
</div>
</div>
<div class="form-group">
<div class="col-md-12">
<label for="sub_sub_category_id" class="col-md-2">Select Sub Sub Category:</label>
<div class="col-sm-4">
<select class="form-control select2" name="sub_sub_category_id" id="sub_sub_category_id" required="">
<option value="{{$products->subSubCategoryList->sub_sub_category_id}}">{{$products->subSubCategoryList->sub_sub_category_name_lang1}}</option>
</select>
<div class="help-block with-errors"></div>
</div>
<label for="select-color" class="col-md-2">Select Color:</label>
<div class="col-sm-4">
<!-- {{ Form::select('color_id[]',$colors,$products->productWiseColors->pluck('color_id')->toArray(), ['class' => 'form-control chosen-select select2', 'multiple tabindex' =>'6', 'id' => 'color_id', 'required' => 'required', 'style' => 'width:380px;']) }} -->
<select name="color_id[]" id="color_id" class="form-control select2" multiple tabindex="6" required="">
@if(count($colors) > 0) @foreach($colors as $key=> $color)
<?php $count=0; ?>
@foreach($products->productWiseColors as $pcolor) @if($pcolor->status == $color->status && $pcolor->color_id == $color->color_id)
<option value="{{$color->color_id}}" selected=''>{{$color->color_name_lang1}}</option>
<?php $count++; break; ?>
@endif @endforeach @if($count == 0)
<option value="{{$color->color_id}}">{{$color->color_name_lang1}}</option>
@endif @endforeach @endif
</select>

<div class="help-block with-errors"></div>
</div>
</div>
</div>
<div class="form-group">
<div class="col-md-12">
<label for="select-size" class="col-md-2">Select Size:</label>
<div class="col-sm-4">
<!-- {{ Form::select('size_id[]',$sizes,$products->productWiseSizes->pluck('size_id')->toArray(), ['class' => 'form-control chosen-select select2', 'multiple tabindex' =>'6', 'id' => 'size_id', 'required' => 'required', 'style' => 'width:380px;']) }} -->
<select name="size_id[]" id="size_id" class="form-control select2" multiple tabindex="6" required="">
@if(count($sizes) > 0) @foreach($sizes as $key=> $size)
<?php $count=0; ?>
@foreach($products->productWiseSizes as $psize) @if($psize->status == $size->status && $psize->size_id == $size->size_id)
<option value="{{$size->size_id}}" selected=''>{{$size->size_title_lang1}}</option>
<?php $count++; break; ?>
@endif @endforeach @if($count == 0)
<option value="{{$size->size_id}}">{{$size->size_title_lang1}}</option>
@endif @endforeach @endif
</select>
<div class="help-block with-errors"></div>
</div>
<label for="product_name_lang1" class="col-md-2">Product Name English:</label>
<div class="col-sm-4">
<input type="text" class="form-control" name="product_name_lang1" id="product_name_lang1" value="{{$products->product_name_lang1}}" required="">
<div class="help-block with-errors"></div>
</div>
</div>
</div>
<div class="form-group">
<div class="col-md-12">
<label for="product_name_lang2" class="col-md-2">Product Name Bangla:</label>
<div class="col-sm-4">
<input type="text" class="form-control" name="product_name_lang2" id="product_name_lang2" value="{{$products->product_name_lang2}}" required="">
<div class="help-block with-errors"></div>
</div>
<label for="market_price" class="col-md-2">Market Price:</label>
<div class="col-sm-4">
<input type="text" class="form-control market_price_discount" name="market_price" id="market_price" required="" value="{{$products->market_price}}">
<div class="help-block with-errors"></div>
</div>
</div>
</div>
<div class="form-group">
<div class="col-md-12">
<label for="discount" class="col-md-2">Discount:</label>
<div class="col-sm-4">
<input type="text" class="form-control market_price_discount" name="discount" id="discount" value="{{$products->discount}}" required="">
<div class="help-block with-errors"></div>
</div>
<label for="sale_price" class="col-md-2">Sale Price:</label>
<div class="col-sm-4">
<input type="text" class="form-control sale_price product_commission" name="sale_price" id="sale_price" required="" value="{{$products->sale_price}}">
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
<input type="text" name="commission" , id="commission" class="form-control product_commission" value="{{$products->commission}}">
<div class="help-block with-errors"></div>
</div>
<label for="product_code" class="col-md-2">E-shopping Commission:</label>
<div class="col-sm-4">
<input type="text" class="form-control eshopping_commission" name="commission_amount" id="commission_amount" required="" value="{{($products->sale_price * $products->commission)/100}}">
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
<option value="1" @if($products->placement_type == 1) selected=''@endif>Normal Product</option>
<option value="2" @if($products->placement_type == 2) selected=''@endif>Slider Product</option>
<option value="3" @if($products->placement_type == 3) selected=''@endif>Selected Product</option>
</select>
<div class="help-block with-errors"></div>
</div>
</div>
</div>
<div class="form-group">
<div class="col-md-12">
<label for="quantity" class="col-md-2">Product Quantity:</label>
<div class="col-sm-4">
<input type="text" class="form-control" name="quantity" id="quantity" value="{{$products->quantity}}" required="">
<div class="help-block with-errors"></div>
</div>
<label for="product_code" class="col-md-2">Product Code:</label>
<div class="col-sm-4">
<input type="text" class="form-control" name="product_code" id="product_code" required="" value="{{$products->product_code}}">
<div class="help-block with-errors"></div>
</div>
</div>
</div>
<div class="form-group">
<div class="col-md-12">
<label for="details_lang1" class="col-md-2">Product Details English:</label>
<div class="col-sm-4">
<textarea class="form-control" name="details_lang1" id="details_lang1" rows="3" value="">{{$products->product_name_lang1}}</textarea>
<div class="help-block with-errors"></div>
</div>
<label for="details_lang2" class="col-md-2">Product Details Bangla:</label>
<div class="col-sm-4">
<textarea class="form-control" name="details_lang2" id="details_lang2" rows="3">{{$products->product_name_lang2}}</textarea>
<div class="help-block with-errors"></div>
</div>
</div>
</div>
</div>
</div>
<div id="step-3" class="tab-pane step-content">
<div id="form-step-2" role="form" data-toggle="validator">

<div class="form-group">
@if($products->productImages) 
@foreach($products->productImages as $imageKey => $image)
<div class="col-md-12">
<label for="path" class="col-md-2">Prouduct Image:</label>

<div class="col-sm-4">
<input type="file" class="form-control" name="image[{{$imageKey}}][path]">
<input type="hidden" class="form-control" name="image[{{$imageKey}}][image_id]" value="{{$image->product_wise_image_id}}">
<div class="help-block with-errors"></div>
</div>

<label for="caption" class="col-md-2">Image Title: </label>
<div class="col-sm-3">
<input type="text" class="form-control" name="image[{{$imageKey}}][caption]" value="{{$image->caption}}">
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
@endforeach  
@endif

</div>
<div class="load-dynamic-image-content"> </div>
</div>
</div>
</div>
</div>
</form>
@endif
</div>
</div>
</div>
</div>
<!-- nav-tabs-custom -->
</section>
@endsection @section('extra-js')
<script src="{{URL::to('public/assets/plugins/validator/validator.min.js')}}"></script>
<script src="{{URL::to('public/assets/plugins/smartwizard/js/jquery.smartWizard.js')}}"></script>
<script type="text/javascript" src="{{URL::to('public/assets/plugins/chosen/js/chosen.jquery.min.js')}}"></script>
@endsection @section('script')
<script type="text/javascript">
$(document).ready(function() {
$("#employeeDataTable").DataTable();
});
$(document).ready(function() {
var btnFinish = $('<button></button>').text('Finish')
.addClass('btn btn-info')
.on('click', function() {
if (!$(this).hasClass('disabled')) {
var elmForm = $("#myForm");
if (elmForm) {
elmForm.validator('validate');
var elmErr = elmForm.find('.has-error');
if (elmErr && elmErr.length > 0) {
alert('Oops we still have error in the form');
return false;
} else {
alert('Great! we are ready to submit form');
elmForm.submit();
return false;
}
}
}
});
var btnCancel = $('<button></button>').text('Cancel')
.addClass('btn btn-danger')
.on('click', function() {
$('#smartwizard').smartWizard("reset");
$('#myForm').find("input, textarea").val("");
});
// Smart Wizard
$('#smartwizard').smartWizard({
selected: 0,
theme: 'dots',
transitionEffect: 'fade',
toolbarSettings: {
toolbarPosition: 'bottom',
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
if (stepDirection === 'forward' && elmForm) {
elmForm.validator('validate');
var elmErr = elmForm.children('.has-error');
if (elmErr && elmErr.length > 0) {
// Form validation failed
return false;
}
}
return true;
});
$("#smartwizard").on("showStep", function(e, anchorObject, stepNumber, stepDirection) {
// Enable finish button only on last step
if (stepNumber == 3) {
$('.btn-finish').removeClass('disabled');
} else {
$('.btn-finish').addClass('disabled');
}
});
//Date picker
$('.datepicker').datepicker({
autoclose: true,
});
});

//Get Category Wise Sub Category
$("#category_id").on('change', function() {
var categoryId = $(this).val();
var subCategoryId = $("#sub_category_id");
$.ajax({
url: 'categoryWiseSubCategory/' + categoryId,
method: "GET",
dataType: "json",
success: function(data) {
//console.log(data);
subCategoryId.empty();
var content = '<option selected="" disabled="">Please Select a Sub Category</option>';
$.each(data, function(index, value) {
//console.log(value);
content += '<option value="' + value.sub_category_id + '">' + value.sub_category_name_lang1 + '</option>';
});
subCategoryId.append(content);
},
error: function() {
alert("Something Went Wrong");
}
});
});
//Get Sub Category Wise Sub Sub Category Details
$("#sub_category_id").on('change', function() {
var subCategoryId = $(this).val();
var subSubCategoryId = $("#sub_sub_category_id");
//alert(subCategoryId);
$.ajax({
url: 'subCategoryWiseSubSubCategory/' + subCategoryId,
method: "GET",
dataType: "json",
success: function(data) {
//console.log(data);
subSubCategoryId.empty();
var content = '<option selected="" disabled="">Please Select a Sub Sub Category</option>';
$.each(data, function(index, value) {
content += '<option value="' + value.sub_sub_category_id + '">' + value.sub_sub_category_name_lang1 + '</option>';
});
subSubCategoryId.append(content);
},
error: function() {
alert("Something Went Wrong");
}
});
});



//Add More Image Javascript
var key = "{{$imageKey}}";
$(".btn-add-image").on('click', function() {
if(key){    
key++;
var content = '<div class="form-group">' +
'<div class="col-md-12">' +
'<label for="path" class="col-md-2">Prouduct Image:</label>' +
'<div class="col-sm-4">' +
'<input type="file" class="form-control" name="image['+key+'][path]" required="">' +
'<div class="help-block with-errors"></div>' +
'</div>' +
'<label for="caption" class="col-md-2">Image Title: </label>' +
'<div class="col-sm-3">' +
'<input type="text" class="form-control" name="image['+key+'][caption]" placeholder="Write Image Title" required=""><input type="hidden" class="form-control" name="image['+key+'][image_id]">' +
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
$(".btn-remove-image").on('click', function() {
key--;
$(this).parent().parent().parent().remove();
//$(this).parent().prev().prev().prev().prev().parent().parent().remove();
});
}
});


//Market price-discount-Sale Price
$(".market_price_discount").on('keyup', function() {
var market_price = $("#market_price").val();
var discount = $("#discount").val();
if (!market_price) {
return false;
}
if (!discount) {
discount = 0;
}
var net_sale_price = market_price - discount;
$("#sale_price").val(net_sale_price);
});
//Commission
$(".product_commission").on('keyup', function() {
var productCommission = $("#commission").val();
var salePrice = $("#sale_price").val();
if (!salePrice) {
return false;
} else {
var commission = (salePrice * productCommission) / 100;
$(".eshopping_commission").val(commission);
}
});
</script>
@endsection