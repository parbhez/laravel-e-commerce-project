<?php

Route::group(['prefix' => 'products', 'middleware' => 'adminAuth'], function(){
	Route::get('/product', [
		'as' => 'products.product',
		'uses' => 'ProductsController@addProduct'
	]);

	Route::get('/categoryWiseSubCategory/{categoryId}', [
		'as' => 'products.categoryWiseSubCategory',
		'uses' => 'ProductsController@categoryWiseSubCategoryList'
	]);

	Route::get('/subCategoryWiseSubSubCategory/{subCategoryId}',[
		'as' => 'products.subCategoryWiseSubSubCategory',
		'uses' => 'ProductsController@subCategoryWiseSubSubCategoryList'
	]);

	Route::post('/save-product', [
		'as' => 'products.save-product.post',
		'uses' => 'ProductsController@saveProduct'

	]);

	Route::get('update-status/{modelReference}/{action}/{id}', [
		'as' => 'products.update-status',
		'uses' => 'ProductsController@updateStatus'
	]);

//Edit Route
	Route::get('edit-product/{productId}',[
		'as' => 'products.edit-product',
		'uses' => 'ProductsController@editProduct'
	]);

	Route::get('edit-product/categoryWiseSubCategory/{categoryId}', [
		'as' => 'products.categoryWiseSubCategory',
		'uses' => 'ProductsController@categoryWiseSubCategoryList'
	]);

	Route::get('edit-product/subCategoryWiseSubSubCategory/{subCategoryId}',[
		'as' => 'products.subCategoryWiseSubSubCategory',
		'uses' => 'ProductsController@subCategoryWiseSubSubCategoryList'
	]);

	Route::post('update-product/{productId}',[
		'as' => 'products.update-product.post',
		'uses' => 'ProductsController@productUpdate'
	]);
});