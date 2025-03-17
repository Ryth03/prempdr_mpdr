<?php

namespace App\Http\Controllers\MPDR;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\MPDR\MpdrForm;
use App\Models\MPDR\MpdrApprover;

class MpdrApprovalController extends Controller
{
    public function approval()
    {
        return view('page.mpdr.approval-mpdr');
    }

    public function approver()
    {
        $users = User::role('approver')->get();
        confirmDelete();
        return view('page.mpdr.approver-mpdr');
    }
    public function viewApprovalForm($no_reg)
    {
        confirmDelete();
        return view('page.mpdr.form-approval-mpdr')->with('no_reg', $no_reg);
    }

    public function getApproverListData()
    {
        $approver = User::role('approver')->where('status', 'Active')->get();
        if($approver){
            return response()->json($approver);
        }

        return response()->json("Tidak ada data");
    }    
    
    public function getSelectedApproverList()
    {
        $user_nik = Auth::user()->nik;
        $approverList = MpdrApprover::select('approver_nik', 'approver_name', 'approver_status')->where('user_nik', $user_nik)->get()->toArray();
        if($approverList){
            return response()->json($approverList);
        }
        return response()->json("Tidak ada data");
    }
    
    public function updateApproverOrder(Request $request)
    {
        $user_nik = Auth::user()->nik;
        
        // Mulai transaction untuk memastikan integritas data
        DB::beginTransaction();
        try {

            MpdrApprover::where('user_nik', $user_nik)->delete();

            $approver_niks = $request->input('nik');
            $approver_names = $request->input('name');
            $approver_statuses = $request->input('status');
            foreach($approver_niks as $index => $approver_nik){
                MpdrApprover::create([
                    'user_nik' => $user_nik,
                    'approver_nik' => $approver_niks[$index],
                    'approver_name' => $approver_names[$index],
                    'approver_status' => $approver_statuses[$index]
                ]);
            }
            DB::commit();
            return response()->json([
                'status' => 'success',
                'message' => 'Approver saved successfully!'
            ]);
        } catch (\Exception $e) {
            dd($e);
            // Rollback transaksi jika terjadi kesalahan
            DB::rollback();
            
            return response()->json([
                'status' => 'error',
                'message' => 'There was an error saving approver.'.$e->getMessage()
            ]);
        }
    }

    public function getApprovalListData()
    {
        $user = Auth::user();
        $nik = $user->nik;
        $forms = null;
        
        $forms = MpdrForm::where('status', 'In Approval')
        ->whereHas('initiatorDetail', function ($query) use($nik){
            $query->where('initiator_nik', $nik)->where('status', 'pending');
        })
        ->get();
        
        /** @var User $user */
        if($user->hasRole('gm'))
        {
            $additionalForms = MpdrForm::with('initiatorDetail')->where('status', 'In Approval')
            ->whereHas('initiatorDetail', function ($query) use($nik){
                $query->whereIn('status', ['approve', 'approve with review']);
            })
            ->whereDoesntHave('approvedDetail', function ($query) use($nik){
                $query->where('approver_nik', '!=', $nik)
                    ->where('status', 'pending');
            })->whereHas('approvedDetail', function ($query) use($nik){
                $query->where('approver_nik', '=', $nik)
                    ->where('status', 'pending');
            })
            ->get();
            
            $allForms = $forms->merge($additionalForms);

            if($allForms){
                return response()->json($allForms);
            }
        }
        else if($user->hasRole('approver'))
        {
            $additionalForms = MpdrForm::where('status', 'In Approval')
            ->whereHas('initiatorDetail', function ($query) use($nik){
                $query->whereIn('status', ['approve', 'approve with review']);
            })
            ->whereHas('approvedDetail', function ($query) use($nik){
                $query->where('approver_nik', $nik)->where('status', 'pending');
            })
            ->get();
            
            $allForms = $forms->merge($additionalForms);

            if($allForms){
                return response()->json($allForms);
            }
        }
        
        if($forms){
            return response()->json($forms);
        }

        return response()->json("Tidak ada Form");
    }

    public function approveForm(Request $request, $no_reg)
    {
        
        DB::beginTransaction();
        try {
            
            /** @var User $user */
            $user = Auth::user();
            $nik = $user->nik;

            // Mengambil form
            $form = MpdrForm::with('initiatorDetail')
            ->where('no', $no_reg)
            ->where('status', 'In Approval')
            ->first();

            if(!$form){
                DB::rollback();
                Alert::toast("Form is not found.", 'error');
                return back();
            }

            // Cek apakah status initiator pending
            if($form->initiatorDetail->status == 'pending'){
                // Cek apakah yang login initiator
                if($form->initiatorDetail->initiator_nik == $nik){
                    $form->initiatorDetail->status = $request->input('action');
                    $form->initiatorDetail->approved_date = now();
                    if($request->input('action') !== 'approve'){
                        $form->initiatorDetail->comment = $request->input('comment');
                    }
                    $form->initiatorDetail->token = null;
                    $form->initiatorDetail->save();
                    if($request->input('action') !== 'approve' && $request->input('action') !== 'approve with review'){
                        $form->status = 'Rejected';
                        $form->save();
                    }
                }else{
                    DB::rollback();
                    Alert::toast("User is not allowed to approve.", 'error');
                    return back();
                }
            }else{
                // Cek apakah yang login punya role approver
                if($user->hasRole('approver')){
                    $form = MpdrForm::with('initiatorDetail')
                    ->where('no', $no_reg)
                    ->where('status', 'In Approval')
                    ->first();

                    // Cari nik yang sesuai
                    foreach($form->approvedDetail as $detail){
                        if($detail->approver_nik === $nik){
                            // Jika status vacant maka tidak bisa approve
                            if($detail->status === 'vacant'){
                                DB::rollback();
                                Alert::toast("User status is vacant.", 'error');
                                return back();
                            }
                            $detail->status = $request->input('action');
                            $detail->approved_date = now();
                            if($request->input('action') !== 'approve'){
                                $detail->comment = $request->input('comment');
                            }
                            $detail->token = null;
                            $detail->save();
                            break;
                        }
                    }

                    // Cek apakah yang approve adalah gm
                    if($user->hasRole('gm'))
                    {
                        foreach($form->approvedDetail as $detail){
                            if($detail->status === 'vacant'){
                                $detail->status = $request->input('action');
                                $detail->approved_date = now();
                                if($request->input('action') === 'approve' || $request->input('action') === 'approve with review'){
                                    $detail->comment = "Approve by GM";
                                }else if($request->input('action') === 'not approve'){
                                    $detail->comment = "Not approve by GM";
                                }
                                $detail->token = null;
                                $detail->save();
                            }
                        }
                    }

                    // Cek apakah form status approve atau reject
                    if($request->input('action') === 'approve' || $request->input('action') === 'approve with review'){
                        $notNull = True;
                        foreach($form->approvedDetail as $detail){
                            if($detail->status == 'pending' || $detail->status == 'not approve'){
                                $notNull = False;
                                break;
                            }
                        }
                        // Status form Approved jika tidak ada yang pending / not approve
                        if($notNull){
                            $form->status = 'Approved';
                        }
                    }else{
                        $form->status = 'Rejected';
                    }
                    $form->save();
                }else{
                    DB::rollback();
                    Alert::toast("User is not allowed to approve.", 'error');
                    return redirect()->route('mpdr.approval');
                }
                
            }
            
            activity()
            ->performedOn($form)
            ->inLog('mpdr')
            ->event('Approve')
            ->causedBy($user)
            ->withProperties(['no' => $no_reg, 'action' => 'approved'])
            ->log('Approve Mpdr Form ' . $no_reg . ' by ' . $user->name . ' at ' . now());
            
            DB::commit();
            Alert::toast('Form successfully ' . $request->input('action') . '!', 'success');
            return redirect()->route('mpdr.approval');
        } catch (\Exception $e) {
            // Rollback transaksi jika terjadi kesalahan
            // dd($e);
            DB::rollback();
            Alert::toast('There was an error saving the form.'.$e->getMessage(), 'error');
            return back();
        }
        
    }
}
