<?php

namespace App\Models\MPDR;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\MPDR\MpdrForm;

class MpdrApprover extends Model
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
        return $this->belongsTo(MpdrForm::class);
    }
}
