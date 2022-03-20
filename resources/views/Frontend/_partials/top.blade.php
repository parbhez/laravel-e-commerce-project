<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if lt IE 7 ]> <html lang="en" class="ie6">    <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7">    <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8">    <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="ie9">    <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en"><!--<![endif]-->
    <html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" type="image/png" sizes="32x32" href="{{URL::to('public/frontend/assets/img/mohasagor.png')}}">
        <title>Home::Plus</title>

  <!-- CSS ================================================== -->
  {!! Html::style('public/frontend/assets/css/font-awesome.min.css') !!}
  {!! Html::style('public/frontend/assets/css/timber.scss.css') !!}
  {!! Html::style('public/frontend/assets/css/animate.css') !!}
  {!! Html::style('public/frontend/assets/css/jquery.bxslider.css') !!}
  {!! Html::style('public/frontend/assets/css/meanmenu.min.css') !!}
  {!! Html::style('public/frontend/assets/css/nivo-slider.css') !!}
  {!! Html::style('public/frontend/assets/css/owl.carousel.css') !!}
  {!! Html::style('public/frontend/assets/css/owl.transitions.css') !!}
  {!! Html::style('public/frontend/assets/css/owl.theme.css') !!}
  {!! Html::style('public/frontend/assets/css/bootstrap.css') !!}
  {!! Html::style('public/frontend/assets/css/jquery-ui.css') !!}
  {!! Html::style('public/frontend/assets/css/style.css') !!}
  {!! Html::style('public/frontend/assets/css/sign-me-in-cart.css') !!}
  {!! Html::style('public/frontend/assets/css/responsive.css') !!}
  {!! Html::style('public/frontend/assets/css/responsive-style.css') !!}


  @if(Request::segment(1))
    {!! Html::style('public/frontend/assets/css/magiczoom.css') !!}
    {!! Html::style('public/frontend/assets/css/product-list.css') !!}
    {!! Html::style('public/frontend/assets/css/solaiman-lipi.css') !!}
    {!! Html::style('public/frontend/assets/css/single_product_view.css') !!}
  @endif


  <!-- Modal Carousel CSS --> 
  {!! Html::style('public/frontend/assets/css/util.carousel.skins.css') !!}
  {!! Html::style('public/frontend/assets/css/all.css') !!}



    {!! Html::script('public/frontend/assets/js/jquery.min.js') !!}
    {{ Html::script('public/assets/validation/jquery.validate.min.js') }}
    {{ Html::script('public/assets/validation/jquery.customValidation.js') }}
   
 </head>

  <body>
