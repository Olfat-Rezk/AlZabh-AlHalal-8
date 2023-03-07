<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOrdersTable extends Migration {

	public function up()
	{
		Schema::create('orders', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();

			$table->integer('quantity');
			$table->float('total-price');
			$table->float('discount');
            $table->foreignId('product_id');
			$table->foreignId('packing_id');
			$table->foreignId('shredder_id');
			$table->enum('m3_shalota', array(''));
			$table->text('notes')->nullable();
			$table->enum('payment_on_recieve', array(''));
            $table->softDeletes();


		});
	}

	public function down()
	{
		Schema::drop('orders');
	}
}
