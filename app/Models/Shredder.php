<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Orders\Orders;

class shredder extends Model
{

    protected $table = 'shredder';
    public $timestamps = true;
    protected $fillable = array('name');

    public function oreder()
    {
        return $this->belongsToMany(Orders::class);
    }

}
