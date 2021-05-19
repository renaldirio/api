<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('login','Api\AuthController@login');
//Route::post('logout','Api\AuthController@logout');
    
    //Jabatan
Route::get('jabatan','Api\JabatanController@index');//show
Route::get('jabatan/{cari}','Api\JabatanController@show');//show with id
Route::post('jabatan','Api\JabatanController@store');// insert
Route::put('jabatan/{cari}','Api\JabatanController@update');//update
Route::delete('jabatan/{cari}','Api\JabatanController@destroy');//delete

    //Karyawan
Route::get('karyawan','Api\KaryawanController@index');//show
Route::get('karyawan/{cari}','Api\KaryawanController@show');//show with id
Route::post('karyawan','Api\KaryawanController@store');// insert
Route::put('karyawan/{cari}','Api\KaryawanController@update');//update
Route::put('resignkaryawan/{cari}','Api\KaryawanController@resign');//update

    //Reservasi
Route::get('reservasi','Api\ReservasiController@index');//show
Route::get('reservasi/{cari}','Api\ReservasiController@show');//show with id
Route::post('reservasi','Api\ReservasiController@store');// insert
Route::put('reservasi/{cari}','Api\ReservasiController@update');//update
Route::delete('reservasi/{cari}','Api\ReservasiController@destroy');//delete

    //Meja
Route::get('meja','Api\MejaController@index');//show
Route::get('mejaEmpty','Api\MejaController@mejaEmpty');//show
Route::get('meja/{cari}','Api\MejaController@show');//show with id
Route::post('meja','Api\MejaController@store');// insert
Route::put('meja/{cari}','Api\MejaController@update');//update
Route::delete('meja/{cari}','Api\MejaController@destroy');//delete

    //Menu
Route::get('menu','Api\MenuController@index');//show
Route::get('menu/{cari}','Api\MenuController@show');//show with id
Route::post('menu','Api\MenuController@store');// insert
Route::put('menu/{cari}','Api\MenuController@update');//update
Route::delete('menu/{cari}','Api\MenuController@destroy');//delete
Route::get('menu/image/{cari}','Api\MenuController@downloadImage'); //ambil meja image
Route::post('menu/image/{cari}','Api\MenuController@uploadImage'); //update image

    //Reservasi
Route::get('reservasi','Api\ReservasiController@index');//show
Route::get('reservasi/{cari}','Api\ReservasiController@show');//show with id
Route::post('reservasi','Api\ReservasiController@store');// insert
Route::put('reservasi/{cari}','Api\ReservasiController@update');//update
Route::delete('reservasi/{cari}','Api\ReservasiController@destroy');//delete

    //Customer
Route::get('customer','Api\CustomerController@index');//show
Route::get('customer/{cari}','Api\CustomerController@show');//show with id
Route::post('customer','Api\CustomerController@store');// insert
Route::put('customer/{cari}','Api\CustomerController@update');//update
Route::delete('customer/{cari}','Api\CustomerController@destroy');//delete

    //Bahan
Route::get('bahan','Api\BahanController@index');//show
Route::get('bahan/{cari}','Api\BahanController@show');//show with id
Route::post('bahan','Api\BahanController@store');// insert
Route::put('bahan/{cari}','Api\BahanController@update');//update
Route::delete('bahan/{cari}','Api\BahanController@destroy');//delete

    //Stok
    Route::get('stokbahan','Api\StokBahanController@index');//show
    Route::get('stokbahan/{cari}','Api\StokBahanController@show');//show with id
    Route::post('stokbahan','Api\StokBahanController@store');// insert
    Route::put('stokbahan/{cari}','Api\StokBahanController@update');//update
    Route::delete('stokbahan/{cari}','Api\StokBahanController@destroy');//delete
    

Route::delete('user/{id}','Api\AuthController@destroy');
Route::post('details', 'Api\AuthController@details')->middleware('verified');
Route::get('usercount','Api\AuthController@index');
Route::post('admin','Api\AdminController@login');

Route::post('updatePic/{id}','Api\AuthController@updatePic');//updatePicture
Route::put('update/{id}','Api\AuthController@update');//update Data User
Route::put('updateStatus/{id}','Api\TransaksiController@updateStatus');//Update Status id, Transaksi
Route::get('getT','Api\TransaksiController@getTransaksi');//get Data Transaksi

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
