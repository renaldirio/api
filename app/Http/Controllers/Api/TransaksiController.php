<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Transaksi;
use Illuminate\Support\Facades\Validator;

use Illuminate\Support\Facades\DB;

class TransaksiController extends Controller
{
    //method untuk add transaksi
    public function store(Request $request)
    {
        $storeData = $request->all();

        $transaksi = Transaksi::create($storeData);

        return response([
            'message' => 'Transaksi berhasil ditambahkan!',
            'data' => $transaksi,
        ], 200);
    }

    //method untuk show all
    public function index()
    {
        $transaksi = DB::table('transaksi')
            ->select('menu.nama_menu', 'customer.nama_customer', 'karyawan.nama_karyawan', 'meja.no_meja', 'detail_transaksi.id_detailTransaksi', 'detail_transaksi.jml_item', 'detail_transaksi.harga_subtotal', 'detail_transaksi.status_pesanan')
            ->join('menu', 'detail_transaksi.id_menu', 'menu.id_menu')
            ->join('transaksi', 'detail_transaksi.id_transaksi', 'transaksi.id_transaksi')
            ->join('karyawan', 'transaksi.id_karyawan', 'karyawan.id_karyawan')
            ->join('reservasi', 'transaksi.id_reservasi', 'reservasi.id_reservasi')
            ->join('meja', 'reservasi.id_meja', 'meja.id_meja')
            ->join('customer', 'reservasi.id_customer', 'customer.id_customer')
            ->get();

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

    // public function update(Request $request, $id){

    //     $transaksi = Transaksi::find($id);

    //     if(is_null($transaksi)){
    //         return response([
    //             'message' => 'Data gagal diubah!',
    //             'data' => null
    //         ],404);
    //     }

    //     $updateData = $request->all();

    //     $validate = Validator::make($updateData, [

    //     ]);

    //     $transaksi->id_karyawan= $updateData['id_karyawan'];
    //     $transaksi->total_transaksi = $updateData['total_transaksi'];
    //     $transaksi->tgl_transaksi= $updateData['tgl_reservasi'];
    //     $transaksi->metode_pembayaran = $updateData['metode_pembayaran'];
    //     $transaksi->stsTransaksi = 'Lunas';

    //     if($transaksi->metode_pembayaran == 'cash'){
    //         $transaksi->kode_edc = NULL;
    //     }
    //     else
    //     {
    //         $kartu = $updateData['no_kartu'];
    //         $id_kartu = Info_kartu::where('no_kartu',$kartu)->first();
    //         $transaksi->id_kartu = $id_kartu->id;
    //         $transaksi->kode_edc = $updateData['kode_edc'];
    //     }

    //     if($validate->fails())
    //         return response(['message' => $validate->errors()],400);

    //     if($transaksi->save()){
    //          return response([
    //              'message' => 'Transaksi Berhasil!',
    //              'data' => $transaksi,
    //              ],200);
    //     }

    //     return response([
    //      'message' => 'Reservasi Gagal!',
    //      'data' => null,
    //      ],400);
    // }
}
