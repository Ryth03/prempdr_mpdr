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
        Schema::create('jobSafetyAnalysis', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('form_id');
            $table->string('work_step');
            $table->string('potential_danger');
            $table->string('risk_chance');
            $table->string('danger_control');
            $table->timestamps();  
            $table->foreign('form_id')->references('id')->on('forms')->onDelete('cascade'); 
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('jobSafetyAnalysis');
    }
};
