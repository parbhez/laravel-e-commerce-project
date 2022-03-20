<?php
Route::group(['prefix' => 'settings','middleware' => 'adminAuth'],function(){

	Route::get('/setup',[
	'as' => 'settings.setup',
	'uses' => 'SettingsController@setup'
	]);

	Route::get('/category',[
		'as' => 'settings.category',
		'uses' => 'SettingsController@categoryList'
	]);

	Route::post('/save-category',[
		'as' => 'settings.save-category.post',
		'uses' => 'SettingsController@saveCategory'
	]);
	
	Route::get('category/image-edit/{id}',[
		'as' => 'settings.category.image-edit',
		'uses' => 'SettingsController@imageEdit'
	]);

	Route::post('/category/image-update/{categoryId}',[
		'as' => 'settings.category.image-update.post',
		'uses' => 'SettingsController@imageUpdate'
	]);

	
	//Active Inactive route
	Route::get('update-status/{modelReference}/{action}/{id}',[
		'as' =>'settings.update-status',
		'uses' => 'SettingsController@statusUpdate'
	]);

	// Route::get('/update-save-category',[
	// 	'as' => 'settings.update-save-category',
	// 	'uses' => 'SettingsController@updateSaveCategory'
	// ]);

	//SubCategory
	Route::get('add-subCategory',[
		'as' => 'settings.add-subCategory',
		'uses' => 'SettingsController@addSubCategory'
	]);
	Route::post('/save-subCategory',[
		'as' => 'settings.save-SubCategory.post',
		'uses' => 'SettingsController@saveSubCategory'
	]);
	Route::get('view-subCategory',[
		'as' => 'settings.view-subCategory',
		'uses' => 'SettingsController@viewSubCategory'
	]);

	Route::get('update-save-subCategory',[
		'as' => 'settings.update-save-subCategory',
		'uses' => 'SettingsController@saveUpdateSubCategory'
	]);

//subCategory Details
	Route::get('/add-subCategoryDetails',[
		'as' => 'settings.add-subCategoryDetails',
		'uses' => 'SettingsController@addSubCategoryDetails'
	]);

	Route::get('/categoryWiseSubcategory/{categoryId}',[
		'as' => 'settings.categoryWiseSubcategory',
		'uses' => 'SettingsController@categoryWiseSubcategoryList'
	]);

	Route::post('/save-SubCategoryDetails',[
		'as' => 'settings.save-SubCategoryDetails.post',
		'uses' => 'SettingsController@saveSubCategoryDetails'
	]);
	Route::get('/view-subCategoryDetails',[
		'as' => 'settings.view-subCategoryDetails',
		'uses' => 'SettingsController@viewSubCategoryDetails'
	]);

	Route::get('/update-save-subCategoryDetails',[
		'as' => 'settings.update-save-subCategoryDetails',
		'uses' => 'SettingsController@saveUpdateSubCategoryDetails'
	]);

	//color route
	Route::get('/add-color', [
		'as' => 'settings.add-color',
		'uses' => 'SettingsController@addColor'
	]);

	Route::post('/save-color', [
		'as' => 'settings.save-color.post',
		'uses' => 'SettingsController@saveColor'
	]);

	Route::get('/view-color', [
		'as' => 'settings.view-color',
		'uses' => 'SettingsController@viewColor'
	]);

	Route::get('/update-save-color',[
		'as' => 'settings.update-save-color',
		'uses' => 'SettingsController@saveUpdateColor'
	]);

	//Size route
	Route::get('/add-size',[
		'as' => 'settings.add-size',
		'uses' => 'SettingsController@addSize'
	]);

	Route::post('/save-size',[
		'as' => 'settings.save-size.post',
		'uses' => 'SettingsController@saveSize'
	]);

	Route::get('/view-size',[
		'as' => 'settings.view-size',
		'uses' => 'SettingsController@viewSize'
	]);

	Route::get('/update-save-size',[
		'as' => 'settings.update-save-size',
		'uses' => 'SettingsController@saveUpdateSize'
	]);

	//City Route
	Route::get('/add-city', [
		'as' => 'settings.add-city',
		'uses' => 'SettingsController@addCity'
	]);

	Route::post('/save-city', [
		'as' => 'settings.save-city.post',
		'uses' => 'SettingsController@saveCity'
	]);

	Route::get('/view-city', [
		'as' => 'settings.view-city',
		'uses' => 'SettingsController@viewCity'
	]);

	Route::get('/update-save-city', [
		'as' => 'settings.update-save-city',
		'uses' => 'SettingsController@saveUpdateCity'
	]);

	
	
});
