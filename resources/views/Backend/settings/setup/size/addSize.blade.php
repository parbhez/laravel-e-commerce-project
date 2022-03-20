    
<div class="row">
    <div class="col-md-12">
        <form action="{{route('settings.save-size.post')}}" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8" novalidate="true">
            {{csrf_field()}}
           
            <div class="form-group">
                <div class="col-md-12">
                    <label for="size_title_lang1" class="col-md-4">Size Name English:</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="size_title_lang1" id="size_title_lang1" placeholder="Write Size Name English" required="">
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <label for="size_title_lang2" class="col-md-4">Size Name Bangla:</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="size_title_lang2" id="size_title_lang2" placeholder="Write Size Name Bangla" required="">
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
	$(".modal-title").html('Add Size')

	$(".btn-submit-action").on('click',function(){
		$("#myForm").submit();
	});
	
</script>