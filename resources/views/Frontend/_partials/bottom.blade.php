<div class="fixed_box loadModal" data-toggle="modal" href="#modal" onclick="loadModal('shoppingCartModal')">
        <div class="fixed_box_icon">
          <i class="fa fa-shopping-basket"></i>
        </div>
        <div class="item_list">
          <p>
            <b>Total Items :</b>
          </p>
          <p ><span id="shooping_cart_item">0</span> টি</p>
          <p>
            <b>Quantity :</b>
          </p>
          <p><span id="shooping_cart_quantity">0</span> টি</p>
          <p>
            <b>Total :</b>
          </p>
          <p><span class="count" id="shooping_cart_price">0</span> টাকা</p>
        </div>
      </div>

    <script>
    $('.loadModal').on('click',function (e) {
    e.preventDefault();
    console.log("asdfsadf");
    console.log($(".modal-header").length);
    var heading = '<div class="login_section_title"> <h4><i class="fa fa-shopping-cart"></i> আপনার অর্ডার সম্পর্কিত তথ্য <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></h4></div>';
    $('.modal-header').html(heading);
    $('.modal-content').removeClass('modal-small');
    $('.modal-dialog').addClass('modal-lg');
    });
    </script>

 {{ HTML::script('public/frontend/assets/js/magiczoom.js') }}
{{ HTML::script('public/frontend/assets/js/jquery-ui.js') }}
{{ HTML::script('public/frontend/assets/js/custom.js') }}
{{ HTML::script('public/frontend/assets/js/jquery.scrollUp.min.js') }}
{{ HTML::script('public/frontend/assets/js/jquery.scrollUp.min.js') }}
{{ HTML::script('public/frontend/assets/js/modernizr.min.js') }}
{{ HTML::script('public/frontend/assets/js/jquery.bxslider.min.js') }}
{{ HTML::script('public/frontend/assets/js/jquery.meanmenu.js') }}
{{ HTML::script('public/frontend/assets/js/owl.carousel.min.js') }}
{{ HTML::script('public/frontend/assets/js/jquery.nivo.slider.js') }}
{{ HTML::script('public/frontend/assets/js/bootstrap.min.js') }}
{{ HTML::script('public/frontend/assets/js/wow.js') }}
{{ HTML::script('public/frontend/assets/js/main.js') }}
{{ HTML::script('public/frontend/assets/js/fastclick.min.js') }}
{{ HTML::script('public/frontend/assets/js/handlebars.min.js') }}

   <script>
      new WOW().init();
   </script>

<script type="text/javascript">
        
      $(".language-select").on('click',function(e){
         e.preventDefault();
         var langType = $(this).data("status");
         $.ajax({
            url: "{{URL::to('frontendLangChange')}}/"+langType,
            type: 'GET',
            dataType : 'json',
            success: function(data){
               if (data.success == true) {
                  location.reload();
               }
            }
          });
      });
  </script>
   </body>
</html>

         