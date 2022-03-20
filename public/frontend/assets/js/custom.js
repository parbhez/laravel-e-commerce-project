jQuery(document).ready(function () {
    $('.main_slider').owlCarousel({
        loop: true,
        responsiveClass: true,
        margin: 5,
        autoplay: 5000,
        nav: true,
        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        responsive: {0: {items: 1}, 600: {items: 1}, 1000: {items: 1}}
    });
    $('.second_slider').owlCarousel({
        loop: true,
        responsiveClass: true,
        margin: 5,
        autoplay: 5000,
        nav: true,
        navText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        responsive: {0: {items: 1}, 600: {items: 2}, 1000: {items: 4}}
    });

    function showProducts(minPrice, maxPrice) {
        $("#products li").hide().filter(function () {
            var price = parseInt($(this).data("price"), 10);
            return price >= minPrice && price <= maxPrice;
        }).show();
    }

    $(function () {
        var options = {
            range: true, min: 0, max: 10000, values: [50, 300], slide: function (event, ui) {
                var min = ui.values[0], max = ui.values[1];
                $("#amount").val("৳" + min + " - ৳" + max);
                showProducts(min, max);
            }
        }, min, max;
        $("#slider-range").slider(options);
        min = $("#slider-range").slider("values", 0);
        max = $("#slider-range").slider("values", 1);
        $("#amount").val("৳" + min + " - ৳" + max);
        showProducts(min, max);
    });
    $("#productImage1").click(function () {
        $("#product_img_1").click();
    });

    function imageReset() {
        $("#applicantImage").val('');
        $('#productImage1').attr('src', 'img/img-upload.png');
    }

    function readImage(file) {
        var reader = new FileReader();
        var image = new Image();
        reader.readAsDataURL(file);
        reader.onload = function (_file) {
            image.src = _file.target.result;
            image.onload = function () {
                var w = this.width, h = this.height, t = file.type, n = file.name, s = ~~(file.size / 1024);
                if (s > 800) {
                    $('#imageAlert').text("Image size too large!");
                    imageReset();
                } else {
                    $('#imageAlert').text(" ");
                    $('#productImage1').attr('src', this.src);
                }
            };
            image.onerror = function () {
                imageReset();
                $('#imageAlert').text("Invalid file type:" + file.type);
            };
        };
    }

    $("#product_img_1").change(function (e) {
        if (this.disabled) {
            imageReset();
        }
        var F = this.files;
        if (F && F[0]) for (var i = 0; i < F.length; i++) readImage(F[i]);
    });
    $(".product_quantity label").click(function () {
        $(".product_quantity label").removeClass("active");
        $(this).addClass("active");
    });
    $(window).load(function () {
        if ($.fn.sticky) {
            $(".all_categories_menu").sticky({topSpacing: 0, center: true});
        }
    });
});