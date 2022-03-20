    
<div class="row">
    <div class="col-md-12">
        <form action="{{route('settings.save-city.post')}}" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8" novalidate="true">
            @csrf
           
            <div class="form-group">
                <div class="col-md-12">
                    <label for="city_name_lang1" class="col-md-4">City Name English:</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="city_name_lang1" id="city_name_lang1" placeholder="Write City Name English" required="">
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <label for="city_name_lang2" class="col-md-4">City Name Bangla:</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="city_name_lang2" id="city_name_lang2" placeholder="Write City Name Bangla" required="">
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-md-12">
                    <label for="cost" class="col-md-4">Shipping Cost:</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="cost" id="cost" placeholder="Write Shipment Cost" required="">
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
	$(".modal-title").html('Add City')

	$(".btn-submit-action").on('click',function(){
		$("#myForm").submit();
	});
	
</script>