<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Arr;
use products\Products;
use User\User;
use Illuminate\Database\Eloquent\SoftDeletes;

class Cart extends Model
{
    use SoftDeletes;

    protected $table = 'cart';
    public $timestamps = true;
    protected $fillabe =array('user_id','product_id','cart_id','quantity') ;

    public function products()
    {
       return $this->belongsToMany(Products::class);
    }
    public function users()
    {
       return $this->belongsToMany(User::class)->withDefault();
    }

}
