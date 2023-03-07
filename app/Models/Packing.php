<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Orders\Orders;

class packing extends Model
{

    protected $table = 'packing';
    public $timestamps = true;
    protected $fillable = array('name');

    public function order()
    {
        return $this->belongsToMany(Orders::class);
    }

}
