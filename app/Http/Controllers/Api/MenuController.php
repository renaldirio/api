<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\Menu;

class MenuController extends Controller
{
    //method untuk menampilkan semua data product (read)
    public function index() {
        $menus = Menu::  join('bahan_menu', 'menu.id_bahan', '=' ,'bahan_menu.id_bahan') -> select('menu.*', 'bahan_menu.*') -> get();
       // $menus = Menu::all();

        if(count($menus) > 0) {
            return response([
                'message' => 'Retrieve All Success',
                'data' => $menus
            ], 200);
        }

        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    //method untuk menampilkan 1 data product (search)
    public function show($cari) {
        $menu = Menu:: join('stok_bahan', 'menu.id_bahan', '=' ,'stok_bahan.id_bahan') -> select('menu.*', 'stok_bahan.*') ->
                where('id_menu','like',$cari,'or','nama_menu','like','%'.$cari.'%')->get();

        if(!is_null($menu)) {
            return response([
                'message' => 'Retrive Menu Success',
                'data' => $menu
            ], 200);
        }

        return response([
            'message' => 'Menu Not Found',
            'data' => null
        ], 404);
    }

    //method untuk menambah 1 data product baru (create)
    public function store(Request $request) {
        $storeData = $request->all();
        $validate = Validator::make($storeData, [
            'id_bahan' => 'required|numeric',
            'nama_menu' => 'required',
            'kategori_menu' => 'required',
            'deskripsi_menu' => 'required',
            'unit_menu' => 'required',
            'harga_menu' => 'required|numeric',
            // 'image' => 'required|image|mimes:jpeg,png,jpg|max:10048'
            
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);

        // if ($files = $request->file('image')) {
        //     $path = time() . '.' . $request->image->extension();
        //     $request->image->move(public_path('image'), $path);
            $menu = Menu::create($storeData
                // [
                //     'nama_menu' => $request->nama_menu,
                //     'deskripsi_menu' => $request->deskripsi_menu,
                //     'kategori_menu' => $request->kategori_menu,
                //     'unit_menu' => $request->unit_menu,
                //     'harga_menu' => $request->harga_menu,
                //     'id_bahan' => $request->id_bahan,
                //     // 'gambar_menu' =>$path,
                // ]
            );
            return response([
                'message' => 'Berhasil menambahkan menu',
                'data' => $menu
            ],200);
        // };

    }

    //method untuk menghapus 1 data product (delete)
    public function destroy($cari) {
        $menu = Menu::where('id_menu','like',$cari,'or','nama_menu','like','%'.$cari.'%');

        if(is_null($menu)) {
            return response([
                'message' => 'Menu Not Found',
                'data' => null
            ], 404);
        }

        if($menu->delete()) {
            return response([
                'message' => 'Delete Menu Success',
                'data' => $menu,
            ], 200);
        }
        return response([
            'message' => 'Delete Menu Failed',
            'data' => null
        ], 400);
    }

    //method untuk mengubah 1 data product (update)
    public function update(Request $request, $cari) {
        $menu = Menu::find($cari);
        if(is_null($menu)) {
            return response([
                'message' => 'Menu Not Found',
                'data' => null
            ], 404);
        }

        $updateData = $request->all();
        $validate = Validator::make($updateData, [
            'nama_menu' => 'required',
            'kategori_menu' => 'required',
            'deskripsi_menu' => 'required',
            'unit_menu' => 'required',
            'harga_menu' => 'required|numeric',
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);

        $menu->nama_menu = $updateData['nama_menu'];
        $menu->deskripsi_menu = $updateData['deskripsi_menu'];
        $menu->kategori_menu = $updateData['kategori_menu'];
        $menu->unit_menu = $updateData['unit_menu'];
        $menu->harga_menu = $updateData['harga_menu'];

        if($menu->save()) {
            return response([
                'message' => 'Update Menu Success',
                'data' => $menu
            ], 200);
        }
        return response([
            'message' => 'Update menu Failed',
            'data' => null
        ], 400);
    } 

    // public function uploadImage(Request $request, $cari){
    //     $menu = Menu::find($cari);
        
    //     if(!$request->hasFile('image')) {
    //         return response()->json(['upload_file_not_found'], 400);
    //     }

    //     $file = $request->file('image');
    //     if(!$file->isValid()) {
    //         return response()->json(['invalid_file_upload'], 400);
    //     }

    //     $path = time() . '.' . $request->image->extension();
    //     $request->image->move(public_path('image'), $path);

    //     $updateData = $request->all();
    //     $validate = Validator::make($updateData, [
    //         'image' => $path
    //     ]);
    //     $menu->image = $path;
        
    //     if($menu->save()){
    //         return response([
    //             'message' => 'Upload Successful',
    //             'status_meja' => $path,
    //         ],400);
    //     }    
    // }
       
    
    // public function downloadImage(Request $request, $cari){
    //     $menu = Menu::find($cari);
    //     $path = $menu->image;

    //     if(!is_null($menu)){
    //         return response()->download($path, 'image');
    //     }

    //     return response([
    //         'message' => 'Product Image Not Found',
    //         'path' => null
    //     ],404);
    // }

}
  