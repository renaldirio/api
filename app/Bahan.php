<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class Bahan extends Model
{
    protected $table = 'bahan_menu';
    protected $primaryKey='id_bahan';
    public $timestamps = false;
    protected $fillable = [
        'nama_bahan', 'unit_bahan','jml_bahanTersedia'
    ]; 
    
}
