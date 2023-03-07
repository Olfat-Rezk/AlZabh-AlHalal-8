<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAccountTable extends Migration {

	public function up()
	{
		Schema::create('account', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
            $table->string('photo');
			$table->string('account');
			$table->string('number');
			$table->string('beneficiary');
			$table->bigInteger('iban');
		});
	}

	public function down()
	{
		Schema::drop('account');
	}
}