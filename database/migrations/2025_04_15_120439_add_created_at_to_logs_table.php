<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{

    public function up()
    {
        Schema::table('logs', function (Blueprint $table) {
            $table->timestamp('created_at')->nullable(); // Add created_at column
        });
    }

    public function down()
    {
        Schema::table('logs', function (Blueprint $table) {
            $table->dropColumn('created_at'); // Drop created_at column if needed
        });
    }
};
