<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOffersTable extends Migration {

	public function up()
	{
		Schema::create('offers', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->decimal('percent');
			$table->string('name');
			$table->date('expirationn_date');
		});
	}

	public function down()
	{
		Schema::drop('offers');
	}
}
