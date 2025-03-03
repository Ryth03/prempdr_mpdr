<?php

namespace App\Models\PREMPDR;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\PREMPDR\PreMpdrForm;

class PreMpdrApprover extends Model
{
    use HasFactory;

    protected $fillable = [
        'form_id',
        'initiator',
        'sales_manager',
        'marketing_manager',
        'department_head'
    ];
    
    public function form()
    {
        return $this->belongsTo(PreMpdrForm::class);
    }
}
