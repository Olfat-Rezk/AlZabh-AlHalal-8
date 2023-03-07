<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Account extends Model 
{

    protected $table = 'account';
    public $timestamps = true;
    protected $fillable = array('account', 'number', 'beneficiary', 'iban','photo');

}