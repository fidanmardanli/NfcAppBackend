<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::table('room_reservations', function (Blueprint $table) {
            $table->string('description')->nullable(); // Add room_inventory column
            $table->string('event_type')->nullable(); // Add room_inventory column
        });
    }

    public function down()
    {

    }
};
