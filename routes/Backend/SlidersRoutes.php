<?php 
Route::group(['prefix' => 'sliders','middleware' => 'adminAuth'],function(){

	Route::get('add-slider', [
		'as' => 'sliders.photo-slider',
		'uses' => 'SlidersController@addSlider'
	]);

	Route::get('/categoryWiseSubCategory/{categoryId}', [
		'as' => 'sliders.categoryWiseSubCategory',
		'uses' => 'SlidersController@categoryWiseSubCategoryList'
	]);

	Route::post('save-slider', [
		'as' => 'sliders.save-slider.post',
		'uses' => 'SlidersController@saveSlider'
	]);

});