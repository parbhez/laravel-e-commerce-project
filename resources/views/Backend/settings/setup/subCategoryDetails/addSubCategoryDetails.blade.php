    
<div class="row">
    <div class="col-md-12">
        <form action="{{route('settings.save-SubCategoryDetails.post')}}" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8" novalidate="true">
            {{csrf_field()}}
            <!-- SmartWizard html -->
            <div class="form-group">
                <div class="col-md-12">
                    <label for="designation_name" class="col-md-4">
                    	Select Category :
                	</label>
                    <div class="col-md-8">                        
                        {{ Form::select('category_id', $categories, null, ['class' => 'form-control select2', 'id' => 'category_id', 'required' => 'required']) }}
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label for="sub_category_name_id" class="col-md-4">
                       Select Sub Category :
                    </label>
                    <div class="col-md-8">
                        <select class="form-control" name="sub_category_name_id" id="sub_category_name_id">
                         </select>
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label for="sub_sub_category_name_lang1" class="col-md-4">Sub Category Detail English:</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="sub_sub_category_name_lang1" id="sub_sub_category_name_lang1" placeholder="Write Sub Sub Category Name English" required="">
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <label for="sub_sub_category_name_lang2" class="col-md-4">Sub Category Detail Bangla:</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="sub_sub_category_name_lang2" id="sub_sub_category_name_lang2" placeholder="Write Sub Sub Category Name Bangla" required="">
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
	$(".modal-title").html('Add Sub Category Details');
    $('.btn-submit-action').parent().show();

	$('.btn-submit-action').on('click', function(){
		$("#myForm").submit();
	});

    $("#category_id").on('change', function() {
        var categoryId = $(this).val();
        var subCategoryNameId = $("#sub_category_name_id");
        $.ajax({
            url :'categoryWiseSubcategory/' + categoryId,
            method : "GET",
            success:function(data){
                subCategoryNameId.empty();
                var content = '<option selected="" disabled=""> Please Select a sub category </option>';
                $.each(data, function(index,value){
                    // console.log(value.view_order);
                    content += '<option value="'+value.sub_category_id+'"> '+value.sub_category_name_lang1+''
                        '</option>';
                });
                subCategoryNameId.append(content);
            },
            error:function(){
                alert('Something went wrong !');
            }
        });
    });

</script>