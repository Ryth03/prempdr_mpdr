<?php

namespace App\Http\Controllers\MPDR;

use App\Http\Controllers\Controller;
use App\Jobs\Mpdr\ProcessApproval;
use App\Models\MPDR\MpdrForm;
use Illuminate\Http\Request;
use App\Models\User;

class MpdrInitiatorController extends Controller
{
    public function getInitiatorList()
    {
        $initiatorList = User::where('status', 'Active')->get(); //role('approver')->
        if($initiatorList){
            return response()->json($initiatorList);
        }
        return response()->json("Tidak ada data");
    }

    public function sendMailToInitiator($no_reg)
    {
        $form = MpdrForm::with('revision', 'detail', 'category', 'channel', 'description', 'certification', 'competitor', 'packaging', 'market', 'approvedDetail', 'initiatorDetail')
        ->where('no', $no_reg)->first();
        if($form->status == 'In Approval')
        {
            if($form->initiatorDetail->status == 'pending' && $form->initiatorDetail->token !== null)
            {
                $initiator = User::where('nik', $form->initiatorDetail->initiator_nik)->first();
                ProcessApproval::dispatch($initiator, $form, $form->initiatorDetail); // send email to initiator
                return;
            }
        }
    }
}
