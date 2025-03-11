<?php

namespace App\Http\Controllers\Master;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Spatie\Activitylog\Models\Activity;

class LogController extends Controller
{
    public function getLogsData(Request $request){
        $logs = Activity::where('log_name', $request->input('form'))
        ->orderBy('created_at', 'desc')
        ->get();
        if($logs){
            return response()->json($logs);
        }

        return response()->json("Tidak ada Log");
    }
}
