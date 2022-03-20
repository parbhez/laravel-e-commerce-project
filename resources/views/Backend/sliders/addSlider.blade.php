@extends('Backend.app')
@section('extra-css')
<link rel="stylesheet" href="{{URL::to('public/assets/plugins/smartwizard/css/smart_wizard.css')}}">
<link rel="stylesheet" href="{{URL::to('public/assets/plugins/smartwizard/css/smart_wizard_theme_arrows.css')}}">
<link rel="stylesheet" type="text/css" href="{{URL::to('public/assets/plugins/chosen/css/chosen.min.css')}}">
<style type="text/css">
   .select2-container--default .select2-selection--single,
   .select2-selection .select2-selection--single {
   width: 377px;
   }
</style>
@endsection
@section('content-header')
<section class="content-header">
   <h1>
      Sliders List
      <small>Preview</small>
   </h1>
   <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i>Home</a></li>
      <li><a href="#">Forms</a></li>
      <li class="active">Slider</li>
   </ol>
</section>
@endsection
@section('main-content')
<!-- Main content -->
<section class="content">
   <!-- Custom Tabs -->
   <div class="nav-tabs-custom">
      <ul class="nav nav-tabs">
         <li class="active"><a href="#view-info" data-toggle="tab">View Slider</a></li>
         <li><a href="#add-info" data-toggle="tab">Add Slider</a></li>
         <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
      </ul>
      <div class="tab-content">
         <div class="tab-pane active" id="view-info">
            <div class="box box-default">
               <div class="box-body">
                  <div class="row">
                     <div class="col-md-12">
                        <table id="productDatatable" class="table table-bordered table-striped">
                           <thead>
                              <tr>
                                 <th>NO</th>
                                 <th>SL</th>
                                 <th>Product Name</th>
                                 <th>Image</th>
                                 <th>Caption</th>
                                 <th>Status</th>
                                 <th>Action</th>
                              </tr>
                           </thead>
                           <tbody>
                        
                              <tr>
                                 <td>2</td>
                                 <td></td>
                                 <td></td>
                                 <td>
                                
                                    <img src="" height="50px" width="50px">
                                 
                                 </td>
                                 <td>
                                 
                                 </td>
                                 <td>
                                    <label class="label label-warning" style="">
                                    Inactive
                                    </label>
                                    <label class="label label-success"  style="">
                                    Active
                                    </label>
                                 </td>
                                 <td>
                                    <a href="javascript:;" class="btn btn-success btn-xs" style="" onclick="updateStatus()">
                                    <i class="fa fa-check-square-o" title="Active"></i> 
                                    </a>
                                    <a href="javascript:;" class="btn btn-warning btn-xs" style="" onclick="updateStatus()">
                                    <i class="fa fa-ban" title="Inactive"></i>  
                                    </a>
                                    <a href="" class="btn btn-info btn-xs" id="">
                                    <i class="fa fa-edit" title="Edit"></i> 
                                    </a>
                                    <a href="javascript:;" class="btn btn-danger btn-xs" style="" onclick="updateStatus()">
                                    <i class="fa fa-trash" title="Delete"></i>  
                                    </a>
                                 </td>
                              </tr>
                             
                           </tbody>
                           <tfoot>
                              <tr>
                                 <th>SL</th>
                                 <th>NO</th>
                                 <th>Product Name</th>
                                 <th>Image</th>
                                 <th>Caption</th>
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
         <div class="tab-pane" id="add-info">
            <div class="box box-default">
               <div class="box-body">
                  <div class="row">
                     <div class="col-md-12">
                        <form action="{{route('sliders.save-slider.post')}}" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8" novalidate="true" enctype="multipart/form-data">
                           {{csrf_field()}}
                           <!-- SmartWizard html -->
                           <div id="smartwizard" class="sw-main sw-theme-arrows">
                              <ul class="nav nav-tabs step-anchor">
                                 <li class="nav-item active"><a href="#step-1" class="nav-link">Step 1<br><small>Image</small></a></li>
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
                                             <label for="name" class="col-md-2">Product Image:</label>
                                             <div class="col-sm-4">
                                                <input type="file" class="form-control" name="image_path" id="image_path" required="">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                             <label for="name" class="col-md-2">Image Caption:</label>
                                             <div class="col-sm-4">
                                                <input type="text" class="form-control" name="image_caption" id="image_caption" placeholder="Write image caption" required="">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                             
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
   
</script>
@endsection