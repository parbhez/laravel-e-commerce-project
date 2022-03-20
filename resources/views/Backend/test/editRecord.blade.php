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
            <a href="{{route('test.test')}}" class="btn btn-info btn-md">
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
                    <form action="{{route('update-record.post',$products->product_test_id)}}" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8" novalidate="true" enctype="multipart/form-data">
                        {{csrf_field()}}
                        <!-- SmartWizard html -->
                        <div id="smartwizard" class="sw-main sw-theme-arrows">
                            <ul class="nav nav-tabs step-anchor">
                                <li class="nav-item active"><a href="#step-3" class="nav-link">Step 1<br><small>Image Information</small></a></li>
                            </ul>
                            <div class="sw-container tab-content" style="min-height: 152px;">
                                <div id="step-3" class="tab-pane step-content">
                                    <div id="form-step-2" role="form" data-toggle="validator">
                                        <div class="form-group">
                                            <div class="col-md-12">
                                                <label for="product_name" class="col-md-2">Product Name: </label>
                                                <div class="col-sm-9">
                                                    <input type="text" name="product_name" id="product_name" class="form-control" value="{{$products->product_name}}">
                                                    <div class="help-block with-errors"></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            @if(count($images) > 0)
                                            @foreach($images as $imageKey=> $image)
                                            
                                          <div class="col-md-12">
                                             <label for="name" class="col-md-2">Product Image:</label>
                                             <div class="col-sm-3">
                                                <input type="file" class="form-control" name="image[{{$imageKey}}][path]" id="path">
                                                <input type="hidden" class="form-control" name="image[{{$imageKey}}][image_id]" id="path"value="{{$image->image_id}}">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                             <div class="col-sm-1">
                                                 <img src="{{URL::to('public/images/product',$image->path)}}" height="20px" width="30px">
                                             </div>
                                             <label for="name" class="col-md-2">Image Caption:</label>
                                             <div class="col-sm-3">
                                                <input type="text" class="form-control" name="image[{{$imageKey}}][caption]" id="caption" value="{{$image->caption}}">
                                                <div class="help-block with-errors"></div>
                                             </div>
                                             <div class="col-sm-1">
                                                    <a href="javascript:;" class="btn btn-xs btn-success btn-add-image" title="Add More Image" style="display:show">
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

    
    //================@@Add More panel start Image @@===============
      //Add More Image Javascript
        var key = "{{$imageKey}}";
    $(".btn-add-image").on('click', function(){
        if(key){
        key++;
        var content =  '<div class="form-group">'+
                           '<div class="col-md-12">'+
                              '<label for="name" class="col-md-2">Product Image:</label>'+
                              '<div class="col-sm-4">'+
                                 '<input type="file" class="form-control" name="image['+key+'][path]" id="path">'+
                                 '<div class="help-block with-errors"></div>'+
                              '</div>'+
                              '<label for="name" class="col-md-2">Image Caption:</label>'+
                              '<div class="col-sm-3">'+
                                 '<input type="text" class="form-control" name="image['+key+'][caption]" id="caption" placeholder="Write Product your Name"><input type="hidden" class="form-control" name="image['+key+'][image_id]">'+
                                 '<div class="help-block with-errors"></div>'+
                              '</div>'+
                              '<div class="col-sm-1">'+
                                     '<a href="javascript:;" class="btn btn-xs btn-danger btn-remove-image" title="Remove Image">'+
                                         '<i class="fa fa-minus"></i>'+
                                     '</a>'+
                              '</div>'+
                           '</div>'+
                        '</div>';

              $(".load-dynamic-image-content").append(content);
              $(".btn-remove-image").on('click', function(){
                key--;
                $(this).parent().parent().parent().remove();
              }); 
        }                 
    });
   
   //================@@Add More panel end Image @@=================
    


    
</script>
@endsection