<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('pre_mpdr_market_updates', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('form_id');
            $table->float('potential_volume');
            $table->string('expected_margin');
            $table->string('price_estimate');
            $table->timestamps();
            $table->foreign('form_id')->references('id')->on('pre_mpdr_forms')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pre_mpdr_market_updates');
    }
};
