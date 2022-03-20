    
<div class="row">
    <div class="col-md-12">
        <form action="{{route('settings.save-SubCategory.post')}}" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8" novalidate="true" enctype='multipart/form-data'>
            {{csrf_field()}}
            <!-- SmartWizard html -->
            <div class="form-group">
                <div class="col-md-12">
                    <label for="designation_name" class="col-md-4">
                    	Category Name:
                	</label>
                    <div class="col-md-8">
                        {{ Form::select('category_name_lang1', $categories, null, ['class' => 'form-control select2', 'id' => 'category_name_lang1', 'required' => 'required']) }}
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label for="sub_category_name_lang1" class="col-md-4">Sub Category Name English:</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="sub_category_name_lang1" id="sub_category_name_lang1" placeholder="Write Sub Category Name English" required="">
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <label for="sub_category_name_lang2" class="col-md-4">Sub Category Name Bangla:</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="sub_category_name_lang2" id="sub_category_name_lang2" placeholder="Write Sub Category Name Bangla" required="">
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <label for="featured_image" class="col-md-4">Featured Image:</label>
                    <div class="col-md-8">
                        <input type="file" class="form-control" name="featured_image" id="featured_image" >
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <label for="view_order" class="col-md-4">View Order:</label>
                    <div class="col-md-8">
                        <input type="number" class="form-control" name="view_order" id="view_order" required="">
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">

	$(".modal-title").html('Add Sub Category');
    $('.btn-submit-action').parent().show();

	$('.btn-submit-action').on('click', function(){
		$("#myForm").submit();
	});

</script>