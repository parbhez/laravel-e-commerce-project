@include('Frontend._partials.top')
@include('Frontend._partials.header')
<!--Start topNavigation -->
@include('Frontend._partials.topNavigation')
<!--Close topNavigation -->    
 @yield('main_content')       
@include('Frontend._partials.footer')      
@include('Frontend._partials.bottom')      
@include('Frontend._partials.modal')      
