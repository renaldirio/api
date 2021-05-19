<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Karyawan extends Model
{
    protected $table = 'karyawan';
    protected $primaryKey='id_karyawan';
    public $timestamps = false;
    protected $fillable = [
        'nama_karyawan', 'jk_karyawan','telp_karyawan', 'email_karyawan', 'password', 'tgl_bergabung','status_karyawan','id_jabatan'
    ];

}
