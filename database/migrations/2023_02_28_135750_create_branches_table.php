<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBranchesTable extends Migration {

	public function up()
	{
		Schema::create('branches', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->decimal('long',11,8);
			$table->decimal('lat',10,8);
            $table->string('name');
		});
	}

	public function down()
	{
		Schema::drop('branches');
	}
}
