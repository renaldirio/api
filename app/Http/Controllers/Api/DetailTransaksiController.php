<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\DetailTransaksi;

class DetailTransaksiController extends Controller
{
    public function store(Request $request)
    {
        $storeData = $request->all();

        $detail_transaksi = DetailTransaksi::create($storeData);

        return response([
            'message' => 'Transaksi berhasil ditambahkan!',
            'data' => $detail_transaksi,
        ], 200);
    }

    public function show()
    {
        $detail_transaksi = DetailTransaksi::all();

        if (count($detail_transaksi) > 0) {
            return response([
                'message' => 'Retrieve All Success',
                'data' => $detail_transaksi
            ], 200);
        }

        return response([
            'message' => 'Empty',
            'data' => null
        ], 404);
    }

    public function index()
    {
        $detail_transaksi = DB::table('detail_transaksi')
        ->select('menu.nama_menu','customer.nama_customer','karyawan.nama_karyawan','meja.no_meja','detail_transaksi.id_detailTransaksi','detail_transaksi.jml_item','detail_transaksi.harga_subtotal','detail_transaksi.status_pesanan')
        ->join('menu','detail_transaksi.id_menu','menu.id_menu')
        ->join('transaksi','detail_transaksi.id_transaksi','transaksi.id_transaksi')
        ->join('karyawan','transaksi.id_karyawan','karyawan.id_karyawan')
        ->join('reservasi','transaksi.id_reservasi','reservasi.id_reservasi')
        ->join('meja','reservasi.id_meja','meja.id_meja')
        ->join('customer','reservasi.id_customer','customer.id_customer')
        ->get();

        if(count($detail_transaksi) > 0){
            return response([
                'message' => 'Retrieve All Success',
                'data' => $detail_transaksi
            ],200);
        }

        return response([
            'message' => 'Empty',
            'data' => null
        ],404);
    }
}
