<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;

use App\Karyawan;

use Illuminate\Support\Facades\Auth;

use Validator;

class KaryawanController extends Controller
{
   
    public function update(Request $request, $cari){
        $karyawan = Karyawan::find($cari);
        if(is_null($karyawan)){
            return response([
                'message' => 'karyawan Not Found',
                'data' => null
            ],404);
        }

        $updateData = $request->all();
        $validate = Validator::make($updateData,[
           'nama_karyawan'  => 'required',
           'jk_karyawan'  => 'required',
           'telp_karyawan' => 'required|digits_between:10,13|numeric|starts_with:08',
           'email_karyawan' => 'required|email:rfc,dns',
           //'password'=> 'required'
           'tgl_bergabung' => 'required|date_format:Y-m-d',
           'status_karyawan' => 'required',
           'id_jabatan' => 'required'         
        ]);

        if($validate->fails())              
            return response(['message' => $validate->errors()],400);
        
        $karyawan ->nama_karyawan = $updateData['nama_karyawan'];
        $karyawan ->jk_karyawan = $updateData['jk_karyawan'];    
        $karyawan ->telp_karyawan = $updateData['telp_karyawan'];
        $karyawan ->email_karyawan = $updateData['email_karyawan'];
        $karyawan ->tgl_bergabung = $updateData['tgl_bergabung'];
        $karyawan ->status_karyawan = $updateData['status_karyawan'];
        $karyawan ->id_jabatan = $updateData['id_jabatan'];

        if($karyawan->save()){
            return response([
                'message' => 'Update karyawan Success',
                'data' => $karyawan,
            ],200);
        }

        return response([
            'message' => 'Update karyawan Failed',
            'data' => null,    
            ],400);
        }
    
    public function index(){
        $karyawan = Karyawan::all();
        // $karyawan = Karyawan::all();
        $karyawan = Karyawan::join('jabatan', 'karyawan.id_jabatan', '=', 'jabatan.id_jabatan')
        ->select('karyawan.id_karyawan','karyawan.nama_karyawan', 'jabatan.nama_jabatan',
        'karyawan.jk_karyawan', 'karyawan.telp_karyawan',
        'karyawan.email_karyawan', 'karyawan.tgl_bergabung',
        'karyawan.status_karyawan', 'karyawan.password')->get();
        $karyawanCount = $karyawan ->count();
        if(count($karyawan)>0){
            return response([
                'count' => $karyawanCount,
                'message' => 'Retrieve All Success',
                'data' => $karyawan
            ],200);
        }

        return response([
            'data' => null
        ],404);

    }
    
    public function show($cari) {
        $karyawan = Karyawan::  join('jabatan', 'karyawan.id_jabatan', '=' ,'jabatan.id_jabatan') -> select('karyawan.*', 'nama_jabatan') ->
                            where('id_jabatan','like',$cari,'or','nama_karyawan','like','%'.$cari.'%')->get();
        //$karyawan = Karyawan::find($id_karyawan);

        if(!is_null($karyawan)) {
            return response([
                'message' => 'Retrive Karyawan Success',
                'data' => $karyawan
            ], 200);
        }

        return response([
            'message' => 'Karyawan tidak ditemukan',
            'data' => null
        ], 404);
    }

    public function store(Request $request){
        $storeData = $request->all();
        $validate = Validator::make($storeData,[
            'nama_karyawan'  => 'required',
            'jk_karyawan'  => 'required',
            'telp_karyawan' => 'required|digits_between:10,13|numeric|starts_with:08',           
            'email_karyawan' => 'required|email:rfc,dns',
            'password' => 'required',
            'tgl_bergabung' => 'required|date_format:Y-m-d',
            'status_karyawan' => 'required',
            'id_jabatan' => 'required',
        ]);

        if($validate->fails())              
            return response(['message' => $validate->errors()],400);

        $storeData['password'] = bcrypt($request->password);

        $karyawan = Karyawan::create($storeData);
        return response([
            'message' => 'Add Karyawan Success',
            'data' => $karyawan,
        ],200);
    }

    // DEACTIVATE ACCOUNT
    public function resign($id){
        $karyawan = Karyawan::find($id);

        if(is_null($karyawan)){
            return response([
                'message' => 'Karyawan Not Found',
                'data' => null
            ], 404);
        }

        $karyawan->status_karyawan = 'Non-Aktif';

        if($karyawan->save()){
            return response([
                'message' => 'Resign Account Success',
                'data' => $karyawan
            ], 200);
        }

        return response([
            'message' => 'Resign Account Failed',
            'data' => null
        ], 400);
    }


}
