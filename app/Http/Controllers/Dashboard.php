<?php

namespace App\Http\Controllers;

use App\Models\Idea\standardData;
use App\Models\MPDR\MpdrForm;
use App\Models\PREMPDR\PreMpdrForm;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use Spatie\Activitylog\Models\Activity;

class Dashboard extends Controller
{
    public function index()
    {
        return view('dashboard');
    }

    public function getPreMpdrTotal()
    {
        $total = PreMpdrForm::count();
        return response()->json($total);
    }

    public function getMpdrTotal()
    {
        $total = MpdrForm::count();
        return response()->json($total);
    }

    public function getPreMpdrPending()
    {
        $pending = PreMpdrForm::where('status', 'In Approval')->pluck('no');
        return response()->json($pending);
    }

    public function getMpdrPending(Request $request)
    {
        $pending = MpdrForm::where('status', 'In Approval')->pluck('no');
        return response()->json($pending);
    }

    public function getDashboardLogs(Request $request)
    {   
        $query = Activity::with('user')->where('log_name', $request->formType)
        ->orderBy('created_at', 'desc');
        if($request->form == 'all')
        {
            $logs = $query->get();
            if($logs){
                return response()->json($logs);
            }
        }
        else
        {
            $logs = $query->whereJsonContains('properties->no', $request->form)
                    ->get();
            if($logs){
                return response()->json($logs);
            }
        }

        return response()->json("Tidak ada Log");
    }

    public function getPreMpdrYear()
    {
        $year = PreMpdrForm::selectRaw('YEAR(created_at) as year')
        ->distinct()
        ->orderBy('year', 'desc')
        ->pluck('year');
        return response()->json($year);
    }

    public function getPreMpdrChart(Request $request)
    {
        // Ambil data berdasarkan tahun yang dipilih
        $year = $request->selectedYear;
        
        // Ambil data berdasarkan status "created"
        $createdData = PreMpdrForm::whereYear('created_at', $year)
                                    ->get()
                                    ->groupBy(function($date) {
                                        return $date->created_at->month; // Kelompokkan berdasarkan bulan
                                    });

        // Ambil data berdasarkan status "approved" untuk seluruh tahun
        $approvedData = PreMpdrForm::whereYear('created_at', $year)
                                    ->where('status', 'Approved')
                                    ->get()
                                    ->groupBy(function($date) {
                                        return $date->created_at->month; // Kelompokkan berdasarkan bulan
                                    });

        // Ambil data berdasarkan status "rejected" hanya untuk bulan Juni
        $rejectedData = PreMpdrForm::whereYear('created_at', $year)
                                    ->where('status', 'Rejected')
                                    ->get()
                                    ->groupBy(function($date) {
                                        return $date->created_at->month; // Kelompokkan berdasarkan bulan
                                    });

        // Mengatur data untuk kategori bulan Januari sampai Desember
        $categories = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

        // Menyiapkan data untuk grafik
        $createdMonthlyData = [];
        $approvedMonthlyData = [];
        $rejectedMonthlyData = [];

        // Isi data untuk grafik, jika bulan tidak ada data, set ke 0
        foreach (range(1, 12) as $month) {
            $createdMonthlyData[] = isset($createdData[$month]) ? $createdData[$month]->count() : 0;
            $approvedMonthlyData[] = isset($approvedData[$month]) ? $approvedData[$month]->count() : 0;
            $rejectedMonthlyData[] = isset($rejectedData[$month]) ? $rejectedData[$month]->count() : 0;
        }

        return response()->json([
            'created' => $createdMonthlyData,
            'approved' => $approvedMonthlyData,
            'rejected' => $rejectedMonthlyData,
            'categories' => $categories
        ]);
    }

    public function getMpdrYear()
    {
        $year = MpdrForm::selectRaw('YEAR(created_at) as year')
        ->distinct()
        ->orderBy('year', 'desc')
        ->pluck('year');
        return response()->json($year);
    }

    public function getMpdrChart(Request $request)
    {
        // Ambil data berdasarkan tahun yang dipilih
        $year = $request->selectedYear;
        
        // Ambil data berdasarkan status "created"
        $createdData = MpdrForm::whereYear('created_at', $year)
                                    ->get()
                                    ->groupBy(function($date) {
                                        return $date->created_at->month; // Kelompokkan berdasarkan bulan
                                    });

        // Ambil data berdasarkan status "approved" untuk seluruh tahun
        $approvedData = MpdrForm::whereYear('created_at', $year)
                                    ->where('status', 'Approved')
                                    ->get()
                                    ->groupBy(function($date) {
                                        return $date->created_at->month; // Kelompokkan berdasarkan bulan
                                    });

        // Ambil data berdasarkan status "rejected" hanya untuk bulan Juni
        $rejectedData = MpdrForm::whereYear('created_at', $year)
                                    ->where('status', 'Rejected')
                                    ->get()
                                    ->groupBy(function($date) {
                                        return $date->created_at->month; // Kelompokkan berdasarkan bulan
                                    });

        // Mengatur data untuk kategori bulan Januari sampai Desember
        $categories = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

        // Menyiapkan data untuk grafik
        $createdMonthlyData = [];
        $approvedMonthlyData = [];
        $rejectedMonthlyData = [];

        // Isi data untuk grafik, jika bulan tidak ada data, set ke 0
        foreach (range(1, 12) as $month) {
            $createdMonthlyData[] = isset($createdData[$month]) ? $createdData[$month]->count() : 0;
            $approvedMonthlyData[] = isset($approvedData[$month]) ? $approvedData[$month]->count() : 0;
            $rejectedMonthlyData[] = isset($rejectedData[$month]) ? $rejectedData[$month]->count() : 0;
        }

        return response()->json([
            'created' => $createdMonthlyData,
            'approved' => $approvedMonthlyData,
            'rejected' => $rejectedMonthlyData,
            'categories' => $categories
        ]);
    }
}
