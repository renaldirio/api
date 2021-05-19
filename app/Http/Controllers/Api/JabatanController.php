<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Validator;
use App\Jabatan;


class JabatanController extends Controller
{
    public function store(Request $request) {
        $storeData = $request->all();
        $validate = Validator::make($storeData, [
            // 'id_Jabatan' => 'required',
            'nama_jabatan' => 'required',
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);

        $jabatan = Jabatan::create($storeData);
        return response([
            'meesage' => 'Berhasil menambahkan Jabatan karyawan',
            'data' => $jabatan,
        ],200);    
    }

    public function show($cari_jabatan) {
        $jabatan = Jabatan::find($cari_jabatan);
        

        if(!is_null($jabatan)){
            return response ([
                'message' => 'Retrive Jabatan By ID Success',
                'data' => $jabatan
            ],200);
        }

        return response([
            'message' => 'Jabatan not found',
            'data' => null
        ],404);
    }

    public function update(Request $request, $cari_jabatan) {
        $jabatan = Jabatan::find($cari_jabatan);
        if(is_null($jabatan)) {
            return response([
                'message' => 'Jabatan tidak ditemukan',
                'data' =>null
            ],404); 
        }

        $updateData = $request->all();
        $validate = Validator::make($updateData, [
            // 'id_Jabatan' => 'required',
            'nama_jabatan' => 'required',
        ]);

        if($validate->fails())
            return response(['message' => $validate->errors()], 400);

        $jabatan ->nama_jabatan = $updateData['nama_jabatan'];
        
        if($jabatan->save()) {
            return response ([
                'message' => 'Update Jabatan Succes',
                'data' => $jabatan,
            ],200);

        return response ([
            'message' => 'Update Jabatan failes',
            'data' => null,
        ],400);    
        }
    }    

    public function index(){
        $jabatan = Jabatan::all();
        $jabatanCount = $jabatan -> count();
        if(count($jabatan)>0){
            return response ([
                'count' => $jabatanCount,
                'message' => 'Retrieve All Success',
                'data' => $jabatan
            ],200);
        }

        return response([
            'data' => null
        ],404);
    }
    
    public function destroy($cari_jabatan) {
        $jabatan = Jabatan::find($cari_jabatan)->delete();
        if(!is_null($jabatan)){
            return response ([
                'message' => 'Delete Jabatan success',
                'data' => $jabatan
            ],200);
        }

        return response ([
            'message' => 'Jabatan not found',
            'data' => null
        ],404);
    }
}