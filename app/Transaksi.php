<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    protected $table = 'transaksi';
    protected $primaryKey = 'id_transaksi';
    public $timestamps = false;
    protected $fillable = [
        'no_transaksi', 'tgl_transaksi', 'jenis_bayar', 'status_pembayaran', 'jml_seluruhPesanan', 'harga_total', 'id_karyawan', 'id_reservasi', 'no_kartu'
    ];
}
