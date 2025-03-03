<?php

namespace App\Models\PREMPDR;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\PREMPDR\PreMpdrFormDetail;
use App\Models\PREMPDR\PreMpdrProductCategory;
use App\Models\PREMPDR\PreMpdrChannel;
use App\Models\PREMPDR\PreMpdrProductDescription;
use App\Models\PREMPDR\PreMpdrCertificationRequirement;
use App\Models\PREMPDR\PreMpdrCompetitorProduct;
use App\Models\PREMPDR\PreMpdrDetailedPackaging;
use App\Models\PREMPDR\PreMpdrMarketUpdate;
use App\Models\PREMPDR\PreMpdrApprover;
use App\Models\PREMPDR\PreMpdrApprovedDetail;
use App\Models\PREMPDR\PreMpdrRevision;

class PreMpdrForm extends Model
{
    use HasFactory;
    
    protected $fillable = [
        'no',
        'user_id',
        'revision_id',
        'project_name',
        'brand_name',
        'level_priority',
        'status'
    ];

    public function revision()
    {
        return $this->belongsTo(PreMpdrRevision::class);
    }

    public function detail()
    {
        return $this->hasOne(PreMpdrFormDetail::class, 'form_id');
    }
    
    public function category()
    {
        return $this->hasOne(PreMpdrProductCategory::class, 'form_id');
    }
    
    public function channel()
    {
        return $this->hasOne(PreMpdrChannel::class, 'form_id');
    }
    
    public function description()
    {
        return $this->hasOne(PreMpdrProductDescription::class, 'form_id');
    }

    public function certification()
    {
        return $this->hasOne(PreMpdrCertificationRequirement::class, 'form_id');
    }
    
    public function competitor()
    {
        return $this->hasMany(PreMpdrCompetitorProduct::class, 'form_id');
    }
    
    public function packaging()
    {
        return $this->hasOne(PreMpdrDetailedPackaging::class, 'form_id');
    }
    
    public function market()
    {
        return $this->hasOne(PreMpdrMarketUpdate::class, 'form_id');
    }
    
    public function approver()
    {
        return $this->hasOne(PreMpdrApprover::class, 'form_id');
    }

    public function approvedDetail()
    {
        return $this->hasMany(PreMpdrApprovedDetail::class, 'form_id');
    }
}
