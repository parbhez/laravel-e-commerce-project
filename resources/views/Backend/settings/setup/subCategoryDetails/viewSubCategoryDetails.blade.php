
<div class="row">
    <div class="col-md-12">
    	<table id="subCategoryDatatable" class="table table-bordered table-striped">
		    <thead>
		        <tr>
		            <th>Category Name</th>
		            <th>Sub Category Name</th>
                <th>Sub Category Details English</th>       
		            <th>Sub Category Details Bangla</th>		   
		            <th>Status</th>
		            <th>Action</th>
		        </tr>
		    </thead>
		    <tbody>
		    	@if(count($subCategoriesDetails) > 0)
		    	@foreach($subCategoriesDetails as $key => $subCategoryDetail)
		        <tr>
		        	<td>
      					<span>{{$subCategoryDetail->subCategoryList->category->category_name_lang1}}</span>	
                {{ Form::select('category_name_lang1',$categories,$subCategoryDetail->category_id, ['class' => 'form-control select2', 'id' => 'categoryNameEnType_'.$subCategoryDetail->sub_sub_category_id, 'required' => 'required', 'style' => 'display:none; width:100px;']) }}
					   </td>

             <td>
                <span>{{$subCategoryDetail->subCategoryList->sub_category_name_lang1}}</span>
                {{ Form::select('sub_category_name_lang1',$subCategories,$subCategoryDetail->sub_category_id, ['class' => 'form-control select2', 'id' => 'subCategoryNameEnType_'.$subCategoryDetail->sub_sub_category_id, 'required' => 'required', 'style' => 'display:none; width: 100px;']) }} 
             </td>

		            <td>
		            	<span>{{$subCategoryDetail->sub_sub_category_name_lang1}}</span>
                  <input type="text" name="sub_sub_category_name_lang1" id="subSubCategoryNameEn_{{$subCategoryDetail->sub_sub_category_id}}" class="form-control" value="{{$subCategoryDetail->sub_sub_category_name_lang1}}" style="display: none; width: 140px;">
		            </td>

		            <td>
		            	<span>{{$subCategoryDetail->sub_sub_category_name_lang2}}</span>
		            	<input type="text" name="sub_sub_category_name_lang2" id="subSubCategoryNameBn_{{$subCategoryDetail->sub_sub_category_id}}" class="form-control" value="{{$subCategoryDetail->sub_sub_category_name_lang2}}" style="display: none; width: 140px;">
		        	</td>
		            <td>
	            		<label class="label label-warning" style="@if($subCategoryDetail->status==1) display: none; @endif">
	            		Inactive
	            		</label>
	            		<label class="label label-success" style="@if($subCategoryDetail->status==0) display: none; @endif">
	            			active
	            		</label>
		            </td>
		            <td>
			            <a href="javascript:;" class="btn btn-success btn-xs" style="@if($subCategoryDetail->status == 1) display:none; @endif" onclick="updateStatus('sub-sub-category', 'active', {{$subCategoryDetail->sub_sub_category_id}})">
			            	<i class="fa fa-check-square-o" title="Active"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-warning btn-xs" style="@if($subCategoryDetail->status == 0) display: none;@endif" onclick="updateStatus('sub-sub-category', 'inactive', {{$subCategoryDetail->sub_sub_category_id}})">
			            	<i class="fa fa-ban" title="Inactive"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-info btn-xs edit-subCategoryDetails" id="reference_{{$subCategoryDetail->sub_sub_category_id}}">
			            	<i class="fa fa-edit" title="Edit"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-success btn-xs save-update-subCategoryDetails" id="saveUpdate_{{$subCategoryDetail->sub_sub_category_id}}" style="display: none;">
			            	<i class="fa fa-save" title="Save"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-primary btn-xs reset" style="display: none;">
			            	<i class="fa fa-refresh fa-spin" title="Reset"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-danger btn-xs" style="@if($subCategoryDetail->status == 2) display: none;@endif" onclick="updateStatus('sub-sub-category', 'delete', {{$subCategoryDetail->sub_sub_category_id}})">
			            	<i class="fa fa-trash" title="Delete"></i>	
			           	</a>
		            </td>
		        </tr>
		        @endforeach
		       @endif
		    </tbody>
		    <tfoot>
		        <tr>
		           <th>Category Name</th>
                <th>Sub Category Name</th>
                <th>Sub Category Details English</th>       
                <th>Sub Category Details Bangla</th>       
                <th>Status</th>
                <th>Action</th>
		        </tr>
		    </tfoot>
		</table>
    </div>
</div>

<script type="text/javascript">
	
  $(document).ready(function(){
		$('#subCategoryDatatable').DataTable();
	});

  $(".modal-title").html("View Sub Category Details");
  $(".btn-submit-action").parent().hide();
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
  					$(".box-modal-message").show();
  					$(".messageBodySuccess").slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
  				}else {
  					$(".box-modal-message").show();
  					$(".messageBodyError").slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
  				}
  			},
  			error: function(data){
  					$(".box-modal-message").show();
  					$(".messageBodyError").slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
  			}
  		});
  }
  $(".edit-subCategoryDetails").on('click',function(){
  		$(this).parent().prev().prev().prev().prev().prev().children().next().show().prev().hide();
      $(this).parent().prev().prev().prev().prev().children().next().show().prev().hide();
      $(this).parent().prev().prev().prev().children().next().show().prev().hide();
      $(this).parent().prev().prev().children().next().show().prev().hide();
      $(this).hide().next().show().next().show();
  });

  $(".reset").on('click',function(){
    $(this).parent().prev().prev().prev().prev().prev().children().next().hide().prev().show();
    $(this).parent().prev().prev().prev().prev().children().next().hide().prev().show();
    $(this).parent().prev().prev().prev().children().next().hide().prev().show();
    $(this).parent().prev().prev().children().next().hide().prev().show();
    $(this).hide().prev().hide().prev().show();
  });
  $(".save-update-subCategoryDetails").on('click',function(){
          var thisClass = $(this);
          var subSubCategoryId = thisClass.attr('id').split("_")[1];
          var categoryNameEnType = $("#categoryNameEnType_" + subSubCategoryId);
          var categoryNameEnTypeText = $("#categoryNameEnType_" + subSubCategoryId + " option:selected").text();
          var subCategoryNameEnType = $("#subCategoryNameEnType_" + subSubCategoryId);
          var subCategoryNameEnTypeText = $("#subCategoryNameEnType_"+ subSubCategoryId+" option:selected").text();
          var subSubCategoryNameEn = $("#subSubCategoryNameEn_" + subSubCategoryId);
          var subSubCategoryNameBn = $("#subSubCategoryNameBn_" + subSubCategoryId);
           alert(subCategoryNameEnTypeText);
          
          $.ajax({
            url : "update-save-subCategoryDetails",
            method : "GET",
            dataType : "json",
            data : {
                'sub_sub_category_id'     : subSubCategoryId,
                'category_name_lang1'     : categoryNameEnType.val(),
                'sub_category_name_lang1' : subCategoryNameEnType.val(),
                'sub_sub_category_name_lang1' : subSubCategoryNameEn.val(),
                'sub_sub_category_name_lang2' : subSubCategoryNameBn.val(),
            },
            success: function(data){
              //console.log(data);
              if(data.success == true){
                categoryNameEnType.hide().prev().show().html(categoryNameEnTypeText);
                subCategoryNameEnType.hide().prev().show().html(subCategoryNameEnTypeText);
                subSubCategoryNameEn.hide().prev().show().html(subSubCategoryNameEn.val());
                subSubCategoryNameBn.hide().prev().show().html(subSubCategoryNameBn.val());
                thisClass.hide().prev().show();
                $(".box-modal-message").show();
                $(".messageBodySuccess").slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
              }else {
                $(".box-modal-message").show();
                $(".messageBodyError").slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
              }
            },
            error: function(){
              $(".box-modal-message").show();
                $(".messageBodyError").slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
            }
          });    
  });

	
</script>