    
<div class="row">
    <div class="col-md-12">
        <form action="{{route('settings.save-color.post')}}" id="myForm" role="form" data-toggle="validator" method="post" accept-charset="utf-8" novalidate="true">
            {{csrf_field()}}
            <!-- SmartWizard html -->
            <div class="form-group">
                <div class="col-md-12">
                    <label for="color_name_lang1" class="col-md-4">Color Name English:</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="color_name_lang1" id="color_name_lang1" placeholder="Write Color Name English" required="">
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <label for="color_name_lang2" class="col-md-4">Color Name Bangla:</label>
                    <div class="col-md-8">
                        <input type="text" class="form-control" name="color_name_lang2" id="color_name_lang2" placeholder="Write Color Name Bangla" required="">
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-12">
                    <label for="color_code" class="col-md-4">Choose Color</label>
                    <div class="col-md-8">
                        <!-- <input type="color" id="html5colorpicker" onchange="clickColor()" value="#ff0000"> -->
                        <input type="color" id="html5colorpicker" value="#ff0000">
                        <input type="text" name="color_code" id="color_code" class="form-control" readonly="">
                        <div class="help-block with-errors"></div>
                    </div>
                </div>
            </div>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
     $(document).ready(function() {
            //Custom validation rules
            //alphaspace allowed
            $("#myForm").validate({
                onkeyup: false,
                rules: {
                    color_name_lang1: {
                        required: true
                    },
                    color_name_lang2: {
                        required: true
                    },
                    color_code: {
                        required: true
                    },
                },
                // submitHandler: function(form){
                //     form.submit();
                // }
            });
        });
        //  function clickColor()
        // {
        //     var c = $("#html5colorpicker").val();
        //     $("#color_code").val(c);
        // }
        $("#html5colorpicker").on("change", function(){
            var c = $(this).val();
            $("#color_code").val(c);
        });

        $(".modal-title").html("Add Color");
        $(".btn-submit-action").on('click',function(){
            $("#myForm").submit();
        }); 


        
   


	
    
</script>