<?php

namespace App\Http\Controllers\PreMpdr;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Str;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\PREMPDR\PreMpdrForm;
use App\Models\PREMPDR\PreMpdrRevision;

class PreMpdrApprovalController extends Controller
{
    

    public function viewApprovalForm($no_reg)
    {
        confirmDelete();
        return view('page.pre-mpdr.form-approval-prempdr')->with('no_reg', $no_reg);
    }

    public function approveForm(Request $request, $no_reg)
    {
        $validated = $request->validate([
            'action' => 'required|string|in:approve,approve with review,not approve',
        ]);
        DB::beginTransaction();
        try {
            $user = Auth::user();
            $nik = $user->nik;
            $form = PreMpdrForm::with('approvedDetail')->where('no', $no_reg)->first();
            
            foreach($form->approvedDetail as $detail){
                if($detail->approver === $nik){
                    $detail->status = $validated['action'];
                    $detail->approved_date = now();
                    if($validated['action'] !== 'approve'){
                        $detail->comment = $request->input('comment');
                    }
                    $detail->save();
                    break;
                }
            }
            if($validated['action'] === 'approve' || $validated['action'] === 'approve with review'){
                $notNull = True;
                foreach($form->approvedDetail as $detail){
                    if(!$detail->status){
                        $notNull = False;
                        $form->route_to = $detail->name;
                        break;
                    }
                }
                if($notNull){
                    $form->status = 'Approved';
                    $form->route_to = null;
                }
            }else{
                $form->status = 'Rejected';
                $form->route_to = null;
            }
            $form->save();

            activity()
            ->performedOn($form)
            ->inLog('prempdr')
            ->event(ucfirst($validated['action']))
            ->causedBy($user)
            ->withProperties(['no' => $no_reg, 'action' => $validated['action']])
            ->log(ucfirst($validated['action']) . ' PreMpdr Form ' . $no_reg . ' by ' . $user->name . ' at ' . now());

            DB::commit();
            Alert::toast('Form successfully ' . $request->input('action') . '!', 'success');
            return redirect()->route('prempdr.approval');
        } catch (\Exception $e) {
            // Rollback transaksi jika terjadi kesalahan
            dd($e);
            DB::rollback();
            Alert::toast('There was an error saving the form.'.$e->getMessage(), 'error');
            return back();
        }
        
    }

    public function getApproverListData()
    {
        $approver = User::role('approver')->where('status', 'Active')->get();
        if($approver){
            return response()->json($approver);
        }

        return response()->json("Tidak ada data");
    }

    public function getApprovalListData()
    {
        /** @var User $user */
        $user = Auth::user();
        $nik = $user->nik;

        if(!$user->hasRole('approver')){
            return response()->json();
        }
        
        $form = PreMpdrForm::where('status', 'In Approval')
        ->whereExists(function ($query) use($nik) {
            $query->select(DB::raw('1')) 
                ->from('pre_mpdr_approved_details')
                ->whereRaw('pre_mpdr_forms.id = pre_mpdr_approved_details.form_id')
                ->whereNull('pre_mpdr_approved_details.status')
                ->where('pre_mpdr_approved_details.approver', $nik)
                ->where('level', DB::raw('(SELECT COUNT(status) + 1 FROM pre_mpdr_approved_details where pre_mpdr_forms.id = pre_mpdr_approved_details.form_id)'));
        })
        ->get();
        
        if($form){
            return response()->json($form);
        }

        return response()->json("Tidak ada Form");
    }

    public function getApprovalFormData($no_reg)
    {
        return view('page.pre-mpdr.form-approval-prempdr')->with('no_reg', $no_reg);
    }
}
