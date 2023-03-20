<?php

namespace App\Models;

use Cart\Cart;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;


class User extends Model
{
    use HasApiTokens,HasFactory,Notifiable;


    protected $table = 'users';
    protected $guard = 'user-api';
    public $timestamps = true;
    protected $fillable = array('name', 'phone', 'email', 'district', 'city','password');

    public function cart()
    {
       return $this->hasMany(Cart::class);
    }

}
