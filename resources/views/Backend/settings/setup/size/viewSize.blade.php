
<div class="row">
    <div class="col-md-12">
    	<table id="colorDatatable" class="table table-bordered table-striped">
		    <thead>
		        <tr>
		            <th>#Serial</th>
                <th>Size Name English</th>
		            <th>Size Name Bangla</th>		   
		            <th>Status</th>
		            <th>Action</th>
		        </tr>
		    </thead>
		    <tbody>
		    	@if(count($sizes) > 0)
          @foreach($sizes as $key=> $size)
		        <tr>
		        	<td>
      					<span>{{$size->size_id}}</span>	
      					
					   </td>
              <td>
                <span>{{$size->size_title_lang1}}</span> 
                <input type="text" name="size_title_lang1" class="form-control" id="sizeNameEn_{{$size->size_id}}" value="{{$size->size_title_lang1}}" style="width: 110px;display: none;">
             </td>
		          <td>
                <span>{{$size->size_title_lang2}}</span> 
                <input type="text" name="size_title_lang2" class="form-control" id="sizeNameBn_{{$size->size_id}}" value="{{$size->size_title_lang2}}" style="width: 110px;display: none;">
             </td>
		            
		  
		            <td>
	            		<label class="label label-warning" style="@if($size->status == 1) display: none; @endif">
	            		Inactive
	            		</label>
	            		<label class="label label-success" style="@if($size->status == 0) display: none;@endif">
	            			active
	            		</label>
		            </td>
		            <td>
			            <a href="javascript:;" class="btn btn-success btn-xs" style="@if($size->status == 1) display: none;@endif" onclick="updateStatus('size','active', {{$size->size_id}})">
			            	<i class="fa fa-check-square-o" title="Active"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-warning btn-xs" style="@if($size->status == 0) display: none;@endif" onclick="updateStatus('size', 'inactive', {{$size->size_id}})">
			            	<i class="fa fa-ban" title="Inactive"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-info btn-xs edit-size" id="reference_{{$size->size_id}}">
			            	<i class="fa fa-edit" title="Edit"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-success btn-xs save-update-size" id="saveUpdate_{{$size->size_id}}" style="display: none;">
			            	<i class="fa fa-save" title="Save"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-primary btn-xs reset" style="display: none;">
			            	<i class="fa fa-refresh fa-spin" title="Reset"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-danger btn-xs" onclick="updateStatus('size', 'delete', {{$size->size_id}})">
			            	<i class="fa fa-trash" title="Delete"></i>	
			           	</a>
		            </td>
		        </tr>
            @endforeach
		       @endif
		    </tbody>
		    <tfoot>
		        <tr>
               <th>#Serial</th>
                <th>Size Name English</th>
                <th>Size Name Bangla</th>      
                <th>Status</th>
                <th>Action</th>
		        </tr>
		    </tfoot>
		</table>
    </div>
</div>

<script type="text/javascript">
  $(document).ready(function(){
    $("#colorDatatable").dataTable();
    $(".modal-title").html("View Size");
    $(".btn-submit-action").parent().hide();
  });

  function updateStatus(modelReference,action,id)
    {
      var reference = $("#reference_" + id);
      if(action == 'delete')
      {
        if(!confirm("Do you Want to delete now ??"))
        {
          return false;
        }
      }
      $.ajax({
        url : "update-status/"+modelReference+"/"+action+"/"+ id,
        method : "GET",
        dataType: "json",

        success: function(data)
        {
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
          }else{
            $(".box-modal-message").show();
            $(".messageBodyError").slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
          }
        },
        error: function()
        {
          $(".box-modal-message").show();
            $(".messageBodyError").slideDown(1000).delay(3000).slideUp(1000).children().next().html(data.message);
        }
      });
      
    }

    $(".edit-size").on('click',function(){
      $(this).parent().prev().prev().prev().children().next().show().prev().hide();
      $(this).parent().prev().prev().children().next().show().prev().hide();
      $(this).hide();//Hide Edit button
      $(this).next().show().next().show(); //Show update & reset button
    });

    $(".reset").on('click',function(){
      $(this).parent().prev().prev().prev().children().next().hide().prev().show();
      $(this).parent().prev().prev().children().next().hide().prev().show();
      $(this).hide().prev().hide().prev().show();
    });


    $(".save-update-size").on('click',function(){
      var thisClass   = $(this);
      var sizeId     = thisClass.attr('id').split("_")[1];
      var sizeNameEn = $("#sizeNameEn_" + sizeId);
      var sizeNameBn = $("#sizeNameBn_" + sizeId);

      $.ajax({
        url : 'update-save-size',
        method : "GET",
        dataType : "json",
        data : {
          'size_id'         : sizeId,
          'size_title_lang1' : sizeNameEn.val(),
          'size_title_lang2' : sizeNameBn.val(),
        },
        success: function(data){
          //console.log(data);
          if(data.success == true){
            sizeNameEn.hide().prev().show().html(sizeNameEn.val());
            sizeNameBn.hide().prev().show().html(sizeNameBn.val());
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