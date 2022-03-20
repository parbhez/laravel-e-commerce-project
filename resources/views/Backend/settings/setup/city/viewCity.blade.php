
<div class="row">
    <div class="col-md-12">
    	<table id="cityDatatable" class="table table-bordered table-striped">
		    <thead>
		        <tr>
		            <th>#Serial</th>
                <th>City Name English</th>
                <th>City Name Bangla</th>      
		            <th>Cost</th>		   
		            <th>Status</th>
		            <th>Action</th>
		        </tr>
		    </thead>
		    <tbody>
		    	@if(count($cities) > 0)
          @foreach($cities as $key=> $city)
		        <tr>
		        	<td>
      					<span>{{$city->city_id}}</span>	
      					
					   </td>
              <td>
                <span>{{$city->city_name_lang1}}</span> 
                <input type="text" name="city_name_lang1" class="form-control" id="cityNameEn_{{$city->city_id}}" value="{{$city->city_name_lang1}}" style="width: 110px;display: none;">
             </td>
		          <td>
                <span>{{$city->city_name_lang2}}</span> 
                <input type="text" name="city_name_lang2" class="form-control" id="cityNameBn_{{$city->city_id}}" value="{{$city->city_name_lang2}}" style="width: 110px;display: none;">
             </td>

             <td>
                <span>{{$city->cost}}</span> 
                <input type="text" name="cost" class="form-control" id="cost_{{$city->city_id}}" value="{{$city->cost}}" style="width: 110px;display: none;">
             </td>
		            
		  
		            <td>
	            		<label class="label label-warning" style="@if($city->status == 1) display: none; @endif">
	            		Inactive
	            		</label>
	            		<label class="label label-success" style="@if($city->status == 0) display: none;@endif">
	            			active
	            		</label>
		            </td>
		            <td>
			            <a href="javascript:;" class="btn btn-success btn-xs" style="@if($city->status == 1) display: none;@endif" onclick="updateStatus('city','active', {{$city->city_id}})">
			            	<i class="fa fa-check-square-o" title="Active"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-warning btn-xs" style="@if($city->status == 0) display: none;@endif" onclick="updateStatus('city', 'inactive', {{$city->city_id}})">
			            	<i class="fa fa-ban" title="Inactive"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-info btn-xs edit-city" id="reference_{{$city->city_id}}">
			            	<i class="fa fa-edit" title="Edit"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-success btn-xs save-update-city" id="saveUpdate_{{$city->city_id}}" style="display: none;">
			            	<i class="fa fa-save" title="Save"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-primary btn-xs reset" style="display: none;">
			            	<i class="fa fa-refresh fa-spin" title="Reset"></i>	
			           	</a>
			           	<a href="javascript:;" class="btn btn-danger btn-xs" onclick="updateStatus('city', 'delete', {{$city->city_id}})">
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
                <th>City Name English</th>
                <th>City Name Bangla</th>      
                <th>Cost</th>      
                <th>Status</th>
                <th>Action</th>
		        </tr>
		    </tfoot>
		</table>
    </div>
</div>

<script type="text/javascript">
  $(document).ready(function(){
    $("#cityDatatable").dataTable();
    $(".modal-title").html("View City");
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

    $(".edit-city").on('click',function(){
      $(this).parent().prev().prev().prev().prev().children().next().show().prev().hide();
      $(this).parent().prev().prev().prev().children().next().show().prev().hide();
      $(this).parent().prev().prev().children().next().show().prev().hide();
      $(this).hide();//Hide Edit button
      $(this).next().show().next().show(); //Show update & reset button
    });

    $(".reset").on('click',function(){
      $(this).parent().prev().prev().prev().prev().children().next().hide().prev().show();
      $(this).parent().prev().prev().prev().children().next().hide().prev().show();
      $(this).parent().prev().prev().children().next().hide().prev().show();
      $(this).hide().prev().hide().prev().show();
    });


    $(".save-update-city").on('click',function(){
      var thisClass  = $(this);
      var cityId     = thisClass.attr('id').split("_")[1];
      var cityNameEn = $("#cityNameEn_" + cityId);
      var cityNameBn = $("#cityNameBn_" + cityId);
      var cost       = $("#cost_" + cityId);

      $.ajax({
        url : 'update-save-city',
        method : "GET",
        dataType : "json",
        data : {
          'city_id'         : cityId,
          'city_name_lang1' : cityNameEn.val(),
          'city_name_lang2' : cityNameBn.val(),
          'cost'            : cost.val()
        },
        success: function(data){
          //console.log(data);
          if(data.success == true){
            cityNameEn.hide().prev().show().html(cityNameEn.val());
            cityNameBn.hide().prev().show().html(cityNameBn.val());
            cost.hide().prev().show().html(cost.val());
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