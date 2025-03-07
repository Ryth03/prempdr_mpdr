<?php

namespace App\Http\Controllers\MPDR;

use App\Http\Controllers\Controller;
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
}
