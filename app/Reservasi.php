<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Reservasi extends Model
{
    protected $table = 'reservasi';
    protected $primaryKey='id_reservasi';
    public $timestamps = false;
    protected $fillable = [
        'id_karyawan', 'id_customer', 'id_meja', 'tgl_reservasi', 'jam_reservasi', 'jml_orgReservasi'
    ];

}
