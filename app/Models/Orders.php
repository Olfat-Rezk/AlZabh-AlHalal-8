<?php
namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Orders extends Model
{
    use SoftDeletes;

    protected $table = 'orders';
    public $timestamps = true;
    protected $fillable = array(
        'quantity','total-price','discount','product_id','shredder_id'
        ,'packing_id','m3_shalota');

    public function altaqte3()
    {
        return $this->hasMany(shredder::class);
    }

    public function altaghize()
    {
        return $this->hasMany(Altaghize::class);
    }



}
