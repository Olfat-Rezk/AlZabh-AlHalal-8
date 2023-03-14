<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Admin extends Model
{

    protected $table = 'admins';
    public $timestamps = true;
    protected $guard = 'admin-api';
    protected $fillable = array('name', 'role');

}
