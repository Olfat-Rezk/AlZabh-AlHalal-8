<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateContactsTable extends Migration {

	public function up()
	{
		Schema::create('contact', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->string('phone')->nullable();
			$table->string('email');
			
		});
	}

	public function down()
	{
		Schema::drop('contact');
	}
}
