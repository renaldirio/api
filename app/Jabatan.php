<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Jabatan extends Model
{
    protected $table = 'jabatan';
    protected $primaryKey='id_jabatan';
    public $timestamps = false;
    protected $fillable = [
        'id_jabatan', 'nama_jabatan'
    ];

}
