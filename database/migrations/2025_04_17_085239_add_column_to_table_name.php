<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{

    public function up()
    {
        Schema::table('room_reservations', function (Blueprint $table) {
            $table->string('room_inventory')->nullable(); // Add room_inventory column
            $table->string('description')->nullable(); // Add room_inventory column
            $table->string('event_type')->nullable(); // Add room_inventory column
            $table->integer('participant_number')->nullable(); // Add participant_number column
        });
    }

    public function down()
    {
        Schema::table('room_reservations', function (Blueprint $table) {
            $table->dropColumn(['room_inventory', 'participant_number']); // Drop the added columns
        });
    }
};
