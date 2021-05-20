<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\StokBahan;

class StokBahanController extends Controller
{
    public function store(Request $request) {
        $storeData = $request->all();
        $validate = Validator::make($storeData, [
            'unit_stok' => 'required',
            'jumlah_stok' => 'required',
            'incoming_stok' => 'required',
            'harga_beli' => 'required',
            'id_bahan' => 'required',
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);

        $stokbahan = StokBahan::create($storeData);
        return response([
            'message' => 'Berhasil menambahkan Stok Bahan',
            'data' => $stokbahan,
        ],200);    
    }

    public function show($cari_stokbahan) {
        $stokbahan = StokBahan::find($cari_stokbahan);

        if(!is_null($stokbahan)){
            return response ([
                'message' => 'Retrive bahan By ID Success',
                'data' => $stokbahan
            ],200);
        }

        return response([
            'message' => 'bahan not found',
            'data' => null
        ],404);
    }

    public function update(Request $request, $cari_stokbahan) {
        $stokbahan = StokBahan::find($cari_stokbahan);
        if(is_null($stokbahan)) {
            return response([
                'message' => 'bahan tidak ditemukan',
                'data' =>null
            ],404); 
        }

        $updateData = $request->all();
        $validate = Validator::make($updateData, [
            // 'id_stokbahan' => 'required',
            'unit_stok' => 'required',
            'jumlah_stok' => 'required',
            'incoming_stok' => 'required',
            'harga_beli' => 'required',
            'id_bahan' => 'required',
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);

        $stokbahan ->unit_stok = $updateData['unit_stok'];
        $stokbahan ->jumlah_stok = $updateData['jumlah_stok'];
        $stokbahan ->incoming_stok = $updateData['incoming_stok'];
        $stokbahan ->harga_beli = $updateData['harga_beli'];
        $stokbahan ->id_bahan = $updateData['id_bahan'];
        
        if($stokbahan->save()) {
            return response ([
                'message' => 'Update stok bahan Succes',
                'data' => $stokbahan,
            ],200);

        return response ([
            'message' => 'Update stok Bahan failes',
            'data' => null,
        ],400);    
        }
    }    

    public function index(){
        $stokbahan = StokBahan:: join('bahan_menu', 'stok_bahan.id_bahan', '=' ,'bahan_menu.id_bahan') 
        ->select('stok_bahan.*','bahan_menu.*')->get();
        $stokbahanCount = $stokbahan -> count();
        if(count($stokbahan)>0){
            return response ([
                'count' => $stokbahanCount,
                'message' => 'Retrieve All Success',
                'data' => $stokbahan
            ],200);
        }

        return response([
            'data' => null
        ],404);
    }
    
    public function destroy($cari_stokbahan) {
        $stokbahan = StokBahan::find($cari_stokbahan)->delete();
        if(!is_null($stokbahan)){
            return response ([
                'message' => 'Delete Stok Bahan success',
                'data' => $stokbahan
            ],200);
        }

        return response ([
            'message' => 'Bahan not found',
            'data' => null
        ],404);
    }
}       