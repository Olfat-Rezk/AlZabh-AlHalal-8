<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Contact extends Model 
{

    protected $table = 'contact';
    public $timestamps = true;
    protected $fillable = array('phone', 'email', 'web-site');

}