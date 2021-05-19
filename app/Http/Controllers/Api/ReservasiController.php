<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB;
use Validator;
use App\Reservasi;
use App\Customer;
use App\Meja;
use App\Karyawan;

class ReservasiController extends Controller
{
    //index
    public function index() {
        $reservasi = Reservasi::  join('customer','customer.id_customer', '=', 'reservasi.id_customer')
        ->join('meja','meja.id_meja','=','reservasi.id_meja')
        ->join('karyawan','karyawan.id_karyawan','=','reservasi.id_karyawan')

        ->select('id_reservasi','meja.no_meja','customer.nama_customer','reservasi.tgl_reservasi','reservasi.jam_reservasi','reservasi.jml_orgReservasi','karyawan.nama_karyawan')
        ->get();

        $reservasiHitung = $reservasi->count();
        if(count($reservasi) > 0) {
            return response([
                'count' => $reservasiHitung,
                'message' => 'Retrieve All Success',
                'data' => $reservasi
            ], 200);
        }

        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    //method untuk menampilkan semua data product (read)
    public function show($cari_reservasi) {
        $reservasi = Reservasi:: find($cari_reservasi);
        $reservasi = Reservasi::  join('customer','customer.id_customer', '=', 'reservasi.id_customer')
        ->join('meja','meja.id_meja','=','reservasi.id_meja')
        ->join('karyawan','karyawan.id_karyawan','=','reservasi.id_karyawan')

        ->select('meja.no_meja','customer.nama_customer','reservasi.tgl_reservasi','reservasi.jam_reservasi','reservasi.jml_orgReservasi')
        ->where('reservasi.id_reservasi','=', $cari_reservasi)->get();

        if(count($reservasi) > 0) {
            return response([
                'message' => 'Retrieve All Success',
                'data' => $reservasi
            ], 200);
        }

        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    public function store(Request $request){
        $storeData = $request->all();
        $validate = Validator::make($storeData,[
            'id_karyawan'  => 'required',
            'tgl_reservasi' => 'required|date_format:Y-m-d',
            'jam_reservasi' => 'required',
            'jml_orgReservasi' => 'required',
            'id_meja' => 'required|numeric',
            'id_customer' => 'required|numeric',
        ]);
        
        $reservasi = Reservasi::create([
            'tgl_reservasi' => $storeData['tgl_reservasi'],
            'jam_reservasi' => $storeData['jam_reservasi'],
            'id_karyawan'  => $storeData['id_karyawan'],
            'jml_orgReservasi' => $storeData['jml_orgReservasi'],
            'id_meja' => $storeData['id_meja'],
            'id_customer' => $storeData['id_customer'],
        ]);
        return response([
            'message' => 'Add Reservasi Success',
            'data' => $reservasi,
        ],200);
    }

    //update
    public function update(Request $request,$cari_reservasi){
        $reservasi = Reservasi::find($cari_reservasi);
        if(is_null($reservasi)) {
            return response([
                'message' => 'Reservasi Not Found',
                'data' => null
            ], 404);
        }        

        $updateData = $request->all();
        // print_r($updateData['id_meja']);exit;
        $validate = Validator::make($updateData,[
            'tgl_reservasi' => 'required|date_format:Y-m-d',
            'jam_reservasi' => 'required',
            'jml_orgReservasi' => 'required',
            'id_meja' => 'required|numeric',
            'id_customer' => 'required|numeric',
        ]);
        
        if ($reservasi->id_meja != $request->input('id_meja')){
            $status_baru = 'Tidak Tersedia';
            $status_lama = 'Tersedia';
            // update meja lama
            // $meja_lama = Meja::where('id_meja', $reservasi->id_meja)->first();
            // $meja_lama->status_meja = $status_lama;
            // $meja_lama->save();
            // update meja baru
            $meja_baru = Meja::where('id_meja', $updateData['id_meja'])->first();

            // var_dump($updateData['id_meja']);
            $meja_baru->status_meja = $status_baru;
            $meja_baru->save();
        }

        if($validate->fails())              
            return response(['message' => $validate->errors()],400);
        
        $reservasi->tgl_reservasi = $updateData['tgl_reservasi'];
        $reservasi->jam_reservasi = $updateData['jam_reservasi'];
        $reservasi->jml_orgReservasi = $updateData['jml_orgReservasi'];
        $reservasi->id_meja = $updateData['id_meja'];
        $reservasi->id_customer = $updateData['id_customer'];


        if($reservasi->save()) {
            return response([
                'message' => 'Update reservasi Success',
                'data' => $reservasi
            ], 200);
        }
        return response([
            'message' => 'Update reservasi Failed',
            'data' => null
        ], 400);
    }
    public function destroy($cari_reservasi) {
        $reservasi = Reservasi::find($cari_reservasi);

        $meja = Meja::find($reservasi->id_meja);
        $meja->status_meja = 'Tersedia'; 
        $meja->save();

        $reservasi->delete();
        if(!is_null($reservasi)){
            return response ([
                'message' => 'Delete reservasi success',
                'data' => $reservasi
            ],200);
        }

        return response ([
            'message' => 'Reservasi not found',
            'data' => null
        ],404);
    }
}