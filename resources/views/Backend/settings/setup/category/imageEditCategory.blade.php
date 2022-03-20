<div class="row">
    <div class="col-md-12">
        <form action="{{URL::to('settings/category/image-update')}}/{{$editCategoryImage->category_id}}" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8" novalidate="true" enctype="multipart/form-data">
        	@csrf
            <!-- SmartWizard html -->
            <div class="form-group">
                <div class="col-md-12">
                    <label for="icon" class="col-md-2">Icon Image:</label>
                    <div class="col-sm-4">
                        <input type="file" class="form-control" name="icon" id="icon" required="">
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="col-sm-4">
						<img src="{{URL::to('public/images/category/icon_image')}}/{{$editCategoryImage->icon}}" width="40px" height="40px">	
					</div>
                </div>
              </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label for="featured_image" class="col-md-2">Featured Image:</label>
                    <div class="col-sm-4">
                        <input type="file" class="form-control" name="featured_image" id="featured_image" required="">
                        <div class="help-block with-errors"></div>
                    </div>
                    <div class="col-sm-4">
						<img src="{{URL::to('public/images/category/featured_image')}}/{{$editCategoryImage->featured_image}}" width="40px" height="40px">
					</div>
                </div>
                <div class="col-md-12">
                        <button type="submit" class="btn btn-success pull-right"> Save </button>
                </div>
              </div>
        </form>
 </div> 
 </div>     
   
<script type="text/javascript">

	$(".modal-title").html('Image Update');
    $('.btn-submit-action').parent().hide();
</script>