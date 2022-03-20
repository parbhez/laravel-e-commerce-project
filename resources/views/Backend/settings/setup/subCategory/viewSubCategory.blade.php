
<div class="row">
    <div class="col-md-12">
    	<table id="subCategoryDatatable" class="table table-bordered table-striped">
		    <thead>
		        <tr>
		            <th>Category Name</th>
		            <th>Sub Category Name English</th>
		            <th>Sub Category Name Bangla</th>		   
		            <th>View Order</th>
		            <th>Status</th>
		            <th>Action</th>
		        </tr>
		    </thead>
		    <tbody>
		    	@if(count($subCategories) > 0)
		    	@foreach($subCategories as $key => $subCategory)
		        <tr>
		        	<td>
      					<span>{{$subCategory->category->category_name_lang1}}</span>	
      					{{ Form::select('category_name_lang1',$categories,$subCategory->category_id, ['class' => 'form-control select2', 'id' => 'categoryNameTypeEn_'.$subCategory->sub_category_id, 'required' => 'required', 'style' => 'display:none; width:110px;']) }}
					</td>
		            <td>
		            	<span>{{$subCategory->sub_category_name_lang1}}</span>
		            	<input type="text" name="sub_category_name_lang1" class="form-control" id="subCategoryNameEn_{{$subCategory->sub_category_id}}" value="{{$subCategory->sub_category_name_lang1}}" style="display: none; width: 130px;">
		            </td>
		            <td>
		            	<span>{{$subCategory->sub_category_name_lang2}}</span>
		            	<input type="text" name="category_name_lang2" class="form-control" id="subCategoryNameBn_{{$subCategory->sub_category_id}}" value="{{$subCategory->sub_category_name_lang2}}" style="display: none; width: 130px;">
		        	</td>
		        	<td>
		            	<span>{{$subCategory->view_order}}</span>
		            	<input type="number" name="view_order" id="viewOrder_{{$subCategory->sub_category_id}}" value="{{$subCategory->view_order}}" style="display: none; width: 80px;">
		        	</td>
		            <td>
	            		<label class="label label-warning" style="@if($subCategory->status==1) display: none; @endif">
	            		Inactive
	            		</label>
	            		<label class="label label-success" style="@if($subCategory->status==0) display: none; @endif">
	            			active
	            		</label>
		            </td>
		            <td>
			            <a href="javascript:;" class="btn btn-success btn-xs" style="@if($subCategory->status == 1) display:none; @endif" onclick="updateStatus('sub-category', 'active', {{$subCategory->sub_category_id}})">
			            	<i class="fa fa-check-square-o" title="Active"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-warning btn-xs" style="@if($subCategory->status == 0) display: none;@endif" onclick="updateStatus('sub-category', 'inactive', {{$subCategory->sub_category_id}})">
			            	<i class="fa fa-ban" title="Inactive"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-info btn-xs edit-subCategory" id="reference_{{$subCategory->sub_category_id}}">
			            	<i class="fa fa-edit" title="Edit"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-success btn-xs save-update-subCategory" id="saveUpdate_{{$subCategory->sub_category_id}}" style="display: none;">
			            	<i class="fa fa-save" title="Save"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-primary btn-xs reset" style="display: none;">
			            	<i class="fa fa-refresh fa-spin" title="Reset"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-danger btn-xs" style="@if($subCategory->status == 2) display: none;@endif" onclick="updateStatus('sub-category', 'delete', {{$subCategory->sub_category_id}})">
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
		            <th>Sub Category Name English</th>
		            <th>Sub Category Name Bangla</th>		   
		            <th>View Order</th>
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

  $(".modal-title").html("View Sub Category");
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
  $(".edit-subCategory").on('click',function(){
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

  $(".save-update-subCategory").on("click",function(){
  		var thisClass = $(this);
  		var subCategoryId = thisClass.attr('id').split('_')[1];
  		var categoryNameTypeEn	   = $("#categoryNameTypeEn_" + subCategoryId);	
  		var categoryNameTypeTextEn = $("#categoryNameTypeEn_" + subCategoryId + " option:selected").text();
  		var subCategoryNameEn = $("#subCategoryNameEn_" + subCategoryId);
  		var subCategoryNameBn = $("#subCategoryNameBn_" + subCategoryId);
  		var viewOrder         = $("#viewOrder_" + subCategoryId);
  		//console.log(categoryNameTypeEn.val());
  		//alert(categoryNameTypeTextEn);
  		//alert(categoryNameTypeTextEn);
  		$.ajax({
  			url : 'update-save-subCategory',
  			method : "GET",
  			dataType : "json",
  			data : {
  				sub_category_id     : subCategoryId,
  				category_name_lang1 : categoryNameTypeEn.val(),
  				sub_category_name_lang1 : subCategoryNameEn.val(),
  				sub_category_name_lang2 : subCategoryNameBn.val(),
  				view_order				: viewOrder.val(),	
  			},
  			success: function(data){
  				//console.log(data);
  				if(data.success == true){
  					categoryNameTypeEn.hide().prev().show().html(categoryNameTypeTextEn);
  					subCategoryNameEn.hide().prev().show().html(subCategoryNameEn.val());
  					subCategoryNameBn.hide().prev().show().html(subCategoryNameBn.val());
  					viewOrder.hide().prev().show().html(viewOrder.val());
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