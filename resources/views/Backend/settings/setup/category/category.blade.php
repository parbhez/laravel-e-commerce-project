@extends('Backend.app')

@section('extra-css')
    <link rel="stylesheet" href="{{URL::to('public/assets/plugins/smartwizard/css/smart_wizard.css')}}">
    <link rel="stylesheet" href="{{URL::to('public/assets/plugins/smartwizard/css/smart_wizard_theme_arrows.css')}}">

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
        Category List
        <small>Preview</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Category</li>
      </ol>
    </section>
@endsection

@section('main-content')
<!-- Main content -->
<section class="content">
	<!-- Custom Tabs -->
	<div class="nav-tabs-custom">
	    <ul class="nav nav-tabs">
	        <li class="active"><a href="#view-category" data-toggle="tab">View Category</a></li>
	        <li><a href="#add-category" data-toggle="tab">Add Category</a></li>
	        <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
	    </ul>
	    <div class="tab-content">
	        <div class="tab-pane active" id="view-category">
	        	<div class="box box-default">
		        	<div class="box-body">
			            <div class="row">
			                <div class="col-md-12">
			                	<table id="categoryDatatable" class="table table-bordered table-striped">
								    <thead>
								        <tr>
								            <th>Category Name English</th>
								            <th>Category Name Bangla</th>
								            <th>Icon Image</th>
								            <th>Featured Image</th>
								            <th>Is Selected</th>
								            <th>View Order</th>
								            <th>Status</th>
								            <th>Action</th>
								        </tr>
								    </thead>
								    <tbody>
								    	@if(count($categories) > 0)
								    	@foreach($categories as $key=> $category)
								        <tr>
								            <td>
								            	<span>{{$category->category_name_lang1}}</span>
								            	<input type="text" name="category_name_lang1" class="form-control" id="categoryNameEn_{{$category->category_id}}" value="{{$category->category_name_lang1}}" style="display: none;">
		           							 </td>

								            <td>
								            	<span>{{$category->category_name_lang2}}</span>
								            	<input type="text" name="category_name_lang2" class="form-control" id="categoryNameBn_{{$category->category_id}}" value="{{$category->category_name_lang2}}" style="display: none;">
		        							</td>
								            <td>
								            	<img src="{{URL::to('public/images/category/icon_image')}}/{{$category->icon}}" alt="icon_image" height="40px" width="40px">
								            	<a data-toggle="modal" class="btn btn-primary btn-xs" onclick="loadModalEdit('settings/category/image-edit','{{ $category->category_id }}')" href="#modal" style="display: none;"> Change</a>	
								            	<!-- <div class="help-block with-errors">
								            	
								            	</div> -->
								            	
		        							</td>

		        							<td>
								            	<img src="{{URL::to('public/images/category/featured_image')}}/{{$category->featured_image}}" alt="featured_image" height="40px" width="40px">
								            	<a data-toggle="modal" class="btn btn-primary btn-xs" onclick="loadModalEdit('settings/category/image-edit', '{{ $category->category_id}}')" href="#modal" style="display: none;"> Change</a>
								            	<!-- <div class="help-block with-errors"></div> -->
								            	
		        							</td>

								            <td>
					     	 				<!-- <label class="label label-warning" style="@if($category->is_selected==1) display: none; @endif"> Not Selected</label>
					      					<label class="label label-success" style="@if($category->is_selected==0) display: none; @endif"> Selected</label> -->
					      					<span>{{Helper::isSelected($category->is_selected)}}</span>
					      					<select name="is_selected" id="isSelectedType_{{$category->category_id}}" class="form-control" required="" style="display: none;">
					                        	<option selected="" disabled="">Select a Type</option>
					                        	<option value="1" @if($category->is_selected == 1) selected="" @endif> Selected</option>
					                        	<option value="0" @if($category->is_selected ==0) selected="" @endif> Not Selected</option>
					                        </select>

											</td>

								            <td>
		            							<span>{{$category->view_order}}</span>
		            							<input type="number" name="view_order" class="form-control" id="viewOrder_{{$category->category_id}}" value="{{$category->view_order}}" style="display: none;">
		        							</td>
								            <td>
							            		<label class="label label-warning" style="@if($category->status==1) display: none; @endif">
							            		Inactive
							            		</label>
							            		<label class="label label-success" style="@if($category->status==0) display: none; @endif">
							            			active
							            		</label>
		            						</td>
								            <td>
									            <a href="javascript:;" class="btn btn-success btn-xs" style="@if($category->status == 1) display:none; @endif" onclick="updateStatus('category', 'active', {{$category->category_id}})">
									            	<i class="fa fa-check-square-o" title="Active"></i>	
									           	</a>
									           	<a href="javascript:;" class="btn btn-warning btn-xs" style="@if($category->status == 0) display: none;@endif" onclick="updateStatus('category', 'inactive', {{$category->category_id}})">
									            	<i class="fa fa-ban" title="Inactive"></i>	
									           	</a>


									           	<a href="javascript:;" class="btn btn-info btn-xs edit-category" id="reference_{{$category->category_id}}">
									            	<i class="fa fa-edit" title="Edit"></i>	
									           	</a>

									           	<a href="javascript:;" class="btn btn-success btn-xs save-update-category" id="saveUpdate_{{$category->category_id}}" style="display: none;">
									            	<i class="fa fa-save" title="Save"></i>	
									           	</a>
									           	<a href="javascript:;" class="btn btn-primary btn-xs reset" id="refresh_{{$category->category_id}}" style="display: none;">
									            	<i class="fa fa-refresh fa-spin" title="Reset"></i>	
									           	</a>
									           	<a href="javascript:;" class="btn btn-danger btn-xs" style="@if($category->status == 2) display: none;@endif" onclick="updateStatus('category', 'delete', {{$category->category_id}})">
									            	<i class="fa fa-trash" title="Delete"></i>	
									           	</a>
		            						</td>
								        </tr>
								        @endforeach
								        @endif
								    </tbody>
								    <tfoot>
								        <tr>
								            <th>Category Name English</th>
								            <th>Category Name Bangla</th>
								            <th>Icon Image</th>
								            <th>Featured Image</th>
								            <th>Is Selected</th>
								            <th>View Order</th>
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
	        <div class="tab-pane" id="add-category">
	            <div class="box box-default">
		        	<div class="box-body">
			            <div class="row">
			                <div class="col-md-12">
			                	<form action="{{route('settings.save-category.post')}}" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8" novalidate="true" enctype="multipart/form-data">
			                		@csrf
			                        <!-- SmartWizard html -->
			                        <div id="smartwizard" class="sw-main sw-theme-arrows">
			                            <ul class="nav nav-tabs step-anchor">
			                                <li class="nav-item active"><a href="#step-1" class="nav-link">Step 1<br><small>Basic Information</small></a></li>
			                                <!-- <li class="nav-item"><a href="#step-2" class="nav-link">Step 2<br><small>Address</small></a></li> -->
			                                <!-- <li class="nav-item"><a href="#step-3" class="nav-link">Step 3<br><small>Login Information</small></a></li> -->
			                            </ul>
			                            <div class="sw-container tab-content" style="min-height: 152px;">
			                                <div id="step-1" class="tab-pane step-content" style="display: block;">
			                                    <div id="form-step-0" role="form" data-toggle="validator">
			                                        <div class="form-group">
			                                            <div class="col-md-12">
			                                                <label for="category_name_lang1" class="col-md-2">Category Name English</label>
			                                                <div class="col-sm-4">
			                                                    <input type="text" class="form-control" name="category_name_lang1" id="category_name_lang1" placeholder="Write your Category Name" required="">
			                                                    <div class="help-block with-errors"></div>
			                                                </div>
			                                                <label for="category_name_lang2" class="col-md-2">Category Name Bangla</label>
			                                                <div class="col-sm-4">
			                                                    <input type="text" class="form-control" name="category_name_lang2" id="category_name_lang2" placeholder="Write your Category Name Ban" required="">
			                                                    <div class="help-block with-errors"></div>
			                                                </div>
			                                            </div>
			                                        </div>
			                                       
			                                        <div class="form-group">
			                                            <div class="col-md-12">
			                                                <label for="featured_image" class="col-md-2">Featured Image:</label>
			                                                <div class="col-sm-4">
			                                                    <input type="file" class="form-control" name="featured_image" id="featured_image" >
			                                                    <div class="help-block with-errors"></div>
			                                                </div>
			                                                <label for="icon" class="col-md-2">Icon Image:</label>
			                                                <div class="col-sm-4">
			                                                    <input type="file" class="form-control" name="icon" id="icon">
			                                                    <div class="help-block with-errors"></div>
			                                                </div>
			                                            </div>
			                                        </div>
			                                        
			                                        <div class="form-group">
			                                            <div class="col-md-12">
			                                                
			                                                <label for="is_selected" class="col-md-2">is_selected:</label>
			                                                <div class="col-sm-4">
			                                                    <select class="form-control select2" name="is_selected" id="isSelectedType_{{$category->category_id}}" required="">
			                                                        <option selected="" disabled="">Please Select a Type</option>
			                                                        <option value="1">Selected</option>
			                                                        <option value="0">Not Selected</option>
			                                                        
			                                                    </select>
			                                                    <div class="help-block with-errors"></div>
			                                                </div>
			                                                 <label for="view_order" class="col-md-2">View Order</label>
			                                                <div class="col-sm-4">
			                                                    <input type="number" class="form-control" name="view_order" id="view_order"  required="">
			                                                    <div class="help-block with-errors"></div>
			                                                </div>
			                                            </div>
			                                        </div>
			                                        
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
@endsection

@section('script')
<script type="text/javascript">
	$(document).ready(function(){
		$('#categoryDatatable')
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


	function updateStatus(modelReference,action,id)
  {
  		var reference = $("#reference_" + id);
  		if(action == 'delete'){
  			if(!confirm("Do you Want to delete ??")){
  				return false;
  			}
  		}
  		$.ajax({
  			url: "update-status/"+modelReference+"/"+action+"/"+id,
  			method: "GET",
  			dataType: "json",
  			success: function(data){
  				//console.log(data);
  				if(data.success == true){
  					if(action == 'active'){
						reference.prev().show().prev().hide();
  						reference.parent().prev().children().next().show().prev().hide();
  					}else if(action == 'inactive'){
  						reference.prev().hide().prev().show();
  						reference.parent().prev().children().next().hide().prev().show();
  					}else if(action == 'delete'){
  						reference.parent().parent().hide(1000).remove();
  					}
  					$(".box-body-second").show();
  					$(".messageBodySuccess").slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
  				}else {
  					$(".box-body-second").show();
  					$(".messageBodyError").slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
  				}
  			},
  			error: function(data){
  					$(".box-body-second").show();
  					$(".messageBodyError").slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
  			}
  		});
  }

  $(".edit-category").on('click',function(){
  	$(this).parent().prev().prev().prev().prev().prev().prev().prev().children().next().show().prev().hide();
  	$(this).parent().prev().prev().prev().prev().prev().prev().children().next().show().prev().hide();
  	$(this).parent().prev().prev().prev().prev().prev().children().next().show().prev().hide();
  	$(this).parent().prev().prev().prev().prev().children().next().show().prev().hide();
  	$(this).parent().prev().prev().prev().children().next().show().prev().hide();
  	$(this).parent().prev().prev().children().next().show().prev().hide();
  	$(this).hide().next().show().next().show();
  });

  $(".reset").on('click',function(){
  	$(this).parent().prev().prev().prev().prev().prev().prev().prev().children().next().hide().prev().show();
  	$(this).parent().prev().prev().prev().prev().prev().prev().children().next().hide().prev().show();
  	$(this).parent().prev().prev().prev().prev().prev().children().next().hide().prev().show();
  	$(this).parent().prev().prev().prev().prev().children().next().hide().prev().show();
  	$(this).parent().prev().prev().prev().children().next().hide().prev().show();
  	$(this).parent().prev().prev().children().next().hide().prev().show();
  	$(this).hide().prev().hide().prev().show();
  });

  $(".save-update-category").on('click',function(){
  			var thisClass          = $(this);
  			//var categoryId         = thisClass.attr('id');
  			var categoryId         = thisClass.attr('id').split('_')[1];
  			var categoryNameEn     = $("#categoryNameEn_" + categoryId);
  			var categoryNameBn     = $("#categoryNameBn_" + categoryId);
  			var isSelectedType	   = $("#isSelectedType_" + categoryId);	
  			var isSelectedTypeText = $("#isSelectedType_" + categoryId + " option:selected").text();
  			var viewOrder          = $("#viewOrder_" + categoryId);
  			//console.log(categoryNameEn);
  			//console.log(categoryNameEn.val());
  			//alert(isSelectedTypeText);
  			//alert(isSelectedTypeText);
  			$.ajax({
  				url : "update-save-category",
  				method : "GET",
  				dataType : "json",
  				data : {
  					'category_id '		: categoryId,
  					'category_name_lang1' : categoryNameEn.val(),
  					'category_name_lang2' : categoryNameBn.val(),
  					'is_selected'         : isSelectedType.val(),
  					'view_order'          : viewOrder.val(),  
  				},
  				success: function(data){
  					// console.log(data);
  					// return false;
  					if(data.success == true){
  						categoryNameEn.hide().prev().show().html(categoryNameEn.val());
  						categoryNameBn.hide().prev().show().html(categoryNameBn.val());
  						isSelectedType.hide().prev().show().html(isSelectedTypeText);
  						viewOrder.hide().prev().show().html(viewOrder.val());
  						thisClass.hide().prev().show();
  						$(".box-body-second").show();
  						$(".messageBodySuccess").slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
  					}else {
  						$(".box-body-second").show();
  						$(".messageBodyError").slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
  					}
  				},
  				error: function(){
  					$(".box-body-second").show();
  						$(".messageBodyError").slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
  				}
  			});

  });





</script>
@endsection
