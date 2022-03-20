<?php

/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// Route::get('/',[
// 	'as' => '/',
// 	'uses' => 'DashBoardController@index'
// ]);
Route::get('/password',function(){
	return bcrypt('1234');
});

Route::get('/login',[
	'as' => '/login',
	'uses' => 'DashBoardController@index'
]);

Route::post('/login-check',[
	'as' => '/login-check.post',
	'uses' => 'LoginController@loginCheck'
]);

Route::group(['middleware' => 'adminAuth'],function(){
	
		Route::get('dashboard',[
			'as' => 'dashboard',
			'uses'=> 'LoginController@dashboard'
		]);

		Route::get('/logout',[
			'as' => '/logout',
			'uses' => 'LoginController@Logout'
		]);

		Route::get('/autocomplete',[
			'as' => 'test.autocomplete',
			'uses' => 'DashBoardController@autoComplete'
		]);

		//Test
		Route::get('/test',[
			'as' => 'test.test',
			'uses' => 'DashBoardController@Test'
		]);	

		Route::post('/addRecord', [
			'as' => 'addRecord',
			'uses' => 'DashBoardController@addRecord'
		]);

		Route::get('edit-record/{productId}', [
			'as' => 'edit-record',
			'uses' => 'DashBoardController@editRecord'
		]);

		Route::post('/update-record/{productId}', [
			'as' => 'update-record.post',
			'uses' => 'DashBoardController@updateRecord'
		]);


});


