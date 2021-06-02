<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DetailTransaksi extends Model
{
    protected $table = 'detail_transaksi';
    protected $primaryKey = 'id_detailTransaksi';
    public $timestamps = false;
    protected $fillable = [
        'nama_pesanan', 'jml_item', 'status_pesanan', 'harga_subtotal', 'id_transaksi', 'id_menu'
    ];
}
