<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class StokBahan extends Model
{
    protected $table = 'stok_bahan';
    protected $primaryKey='id_stok';
    public $timestamps = false;
    protected $fillable = [
        'unit_stok', 'harga_beli', 'jumlah_stok','incoming_stok','id_bahan'
    ]; 
    
}
