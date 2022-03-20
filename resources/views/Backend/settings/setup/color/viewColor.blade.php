
<div class="row">
    <div class="col-md-12">
    	<table id="colorDatatable" class="table table-bordered table-striped">
		    <thead>
		        <tr>
		            <th>#Serial</th>
                <th>Color Name English</th>
		            <th>Color Name Bangla</th>		   
		            <th>Choose Color</th>
		            <th>Status</th>
		            <th>Action</th>
		        </tr>
		    </thead>
		    <tbody>
		    	@if(count($colors) > 0)
          @foreach($colors as $key=> $color)
		        <tr>
		        	<td>
      					<span>{{$color->color_id}}</span>	
      					
					   </td>
              <td>
                <span>{{$color->color_name_lang1}}</span> 
                <input type="text" name="color_name_lang1" class="form-control" id="colorNameEn_{{$color->color_id}}" value="{{$color->color_name_lang1}}" style="width: 110px;display: none;">
             </td>
		            <td>
		            	<span>{{$color->color_name_lang2}}</span>
		            	<input type="text" name="color_name_lang2" class="form-control" id="colorNameBn_{{$color->color_id}}" value="{{$color->color_name_lang2}}" style="width: 110px;display: none;">
		            </td>
		            <td>
		            	<div style="height: 20px; width: 20px; border-radius: 100% !important; background-color: {{$color->color_code}};"></div>

		            	<input type="color" id="colorEdit_{{$color->color_id}}" onchange="clickColorEdit({{$color->color_id}})" value="#ff0000" style="display: none;">

                  <input type="text" name="color_code" id="colorCode_{{$color->color_id}}" class="form-control" value="{{$color->color_code}}" readonly="" style="width: 80px; display: none;">
		        	</td>
		  
		            <td>
	            		<label class="label label-warning" style="@if($color->status == 1) display: none; @endif">
	            		Inactive
	            		</label>
	            		<label class="label label-success" style="@if($color->status == 0) display: none;@endif">
	            			active
	            		</label>
		            </td>
		            <td>
			            <a href="javascript:;" class="btn btn-success btn-xs" style="@if($color->status == 1) display: none;@endif" onclick="updateStatus('color','active', {{$color->color_id}})">
			            	<i class="fa fa-check-square-o" title="Active"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-warning btn-xs" style="@if($color->status == 0) display: none;@endif" onclick="updateStatus('color', 'inactive', {{$color->color_id}})">
			            	<i class="fa fa-ban" title="Inactive"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-info btn-xs edit-color" id="reference_{{$color->color_id}}">
			            	<i class="fa fa-edit" title="Edit"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-success btn-xs save-update-color" id="saveUpdate_{{$color->color_id}}" style="display: none;">
			            	<i class="fa fa-save" title="Save"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-primary btn-xs reset" style="display: none;">
			            	<i class="fa fa-refresh fa-spin" title="Reset"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-danger btn-xs" onclick="updateStatus('color', 'delete', {{$color->color_id}})">
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
		            <th>Color Name English</th>
                <th>Color Name Bangla</th>       
                <th>Choose Color</th>
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
    $(".modal-title").html("View Color");
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

    $(".edit-color").on('click',function(){
      $(this).parent().prev().prev().prev().prev().children().next().show().prev().hide();
      $(this).parent().prev().prev().prev().children().next().show().prev().hide();
      $(this).parent().prev().prev().children().next().show().next().show().prev().prev().hide();
      $(this).hide();//Hide Edit button
      $(this).next().show().next().show(); //Show update & reset button
    });

    $(".reset").on('click',function(){
      $(this).parent().prev().prev().prev().prev().children().next().hide().prev().show();
      $(this).parent().prev().prev().prev().children().next().hide().prev().show();
      $(this).parent().prev().prev().children().next().hide().next().hide().prev().prev().show();
      $(this).hide().prev().hide().prev().show();
    });


    $(".save-update-color").on('click',function(){
      var thisClass   = $(this);
      var colorId     = thisClass.attr('id').split("_")[1];
      var colorNameEn = $("#colorNameEn_" + colorId);
      var colorNameBn = $("#colorNameBn_" + colorId);
      var colorCode   = $("#colorCode_" + colorId);

      $.ajax({
        url : 'update-save-color',
        method : "GET",
        dataType : "json",
        data : {
          'color_id'         : colorId,
          'color_name_lang1' : colorNameEn.val(),
          'color_name_lang2' : colorNameBn.val(),
          'color_code'       : colorCode.val(),
        },
        success: function(data){
          //console.log(data);
          if(data.success == true){
            colorNameEn.hide().prev().show().html(colorNameEn.val());
            colorNameBn.hide().prev().show().html(colorNameBn.val());
            colorCode.hide().prev().hide().prev().show().attr('style','height:20px; width:20px; border-radius:100% !important; background-color:'+colorCode.val());
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

    function clickColorEdit(colorId)
    {
      var c = $("#colorEdit_"+colorId).val();
      $("#colorCode_"+colorId).val(c);

    }

   

</script>