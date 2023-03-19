<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCartsTable extends Migration {

	public function up()
	{
		Schema::create('cart', function(Blueprint $table) {
			$table->increments('id');
            $table->uuid('cart_id');
			$table->timestamps();
			$table->foreignId('product_id');
			$table->foreignId('user_id');
            $table->integer('quantity');
            //$table->unique(['cart_id','product_id']);
            $table->softDeletes();
		});
	}

	public function down()
	{
		Schema::drop('cart');
	}
}
