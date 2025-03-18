<?php

namespace App\Http\Controllers\MPDR;

use App\Http\Controllers\Controller;
use App\Jobs\Mpdr\ProcessApproval;
use App\Jobs\Mpdr\sendResultToUser;
use App\Jobs\Mpdr\sendUpdateToAdmin;
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

            // Cek apakah status initiator pending dan token tidak null
            if($form->initiatorDetail->status == 'pending' && $form->initiatorDetail->token !== null){
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

                        // Jika form di reject maka kirim email ke admin saja
                        $this->sendMailToAdmin($no_reg, $user);

                    }else{
                        // Jika form di approve oleh initiator maka kirim email ke semua approver kecuali gm dan ke admin
                        $this->sendMailToApproversExceptGM($no_reg);
                        $this->sendMailToAdmin($no_reg, $user);
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

                            // Cek apakah form status masih in approval
                            $this->checkFormInApprovalStatus($no_reg);
                            // Kirim email update ke admin
                            $this->sendMailToAdmin($no_reg, $user);
                            break;
                        }
                    }

                    // Cek apakah yang approve adalah gm
                    if($user->hasRole('gm'))
                    {
                        foreach($form->approvedDetail as $detail){
                            if($detail->status === 'vacant'){
                                $detail->approved_date = now();
                                if($request->input('action') === 'approve' || $request->input('action') === 'approve with review'){
                                    $detail->status = 'approve with review';
                                    $detail->comment = "Approve by GM";
                                }else if($request->input('action') === 'not approve'){
                                    $detail->status = $request->input('action');
                                    $detail->comment = "Not approve by GM";
                                }
                                $detail->token = null;
                                $detail->save();
                            }
                        }
                    }

                    $this->sendMailToUser($no_reg); // Kirim email berdasarkan status form
                    
                    
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
            DB::rollback();
            Alert::toast('There was an error saving the form.'.$e->getMessage(), 'error');
            return back();
        }
        
    }

    private function sendMailToAdmin($no_reg, $approver)
    {
        $form = MpdrForm::with('revision', 'detail', 'category', 'channel', 'description', 'certification', 'competitor', 'packaging', 'market', 'approvedDetail', 'initiatorDetail')
        ->where('no', $no_reg)->first();

        $admins = User::whereHas('roles', function($query) {
            $query->where('name', 'super-admin');
        })->get(); // Ambil semua super admin 
        
        foreach($admins as $admin){ // Foreach semua admin
            sendUpdateToAdmin::dispatch($admin, $form, $approver); // send email ke admin
        }
    }
    
    private function sendMailToApproversExceptGM($no_reg)
    {
        // Kirim form ke semua approver kecuali gm
        $form = MpdrForm::with('revision', 'detail', 'category', 'channel', 'description', 'certification', 'competitor', 'packaging', 'market', 'initiatorDetail', 'approvedDetail')
        ->where('no', $no_reg)->first();
        
        if($form->status == 'In Approval'){ // Cek jika status form masih In Approval
            foreach($form->approvedDetail as $detail){ // send email ke semua approver kecuali gm
                $user = User::where('nik', $detail->approver_nik)->first(); 
                if(!$user->hasRole('gm') && $detail->status == 'pending'){
                    ProcessApproval::dispatch($user, $form, $detail); 
                }
            }
        }
    }

    private function sendMailToUser($no_reg)
    {
        $form = MpdrForm::with('revision', 'detail', 'category', 'channel', 'description', 'certification', 'competitor', 'packaging', 'market', 'initiatorDetail', 'approvedDetail')
        ->where('no', $no_reg)->first();

        if($form->status == 'Approved') // Kirim ke semuanya jika form status Approved
        { 
            $allApproverNik = $form->approvedDetail()->pluck('approver_nik'); // Semua nik approver yang dituju
            $allApprover = User::whereIn('nik', $allApproverNik)->get(); // Ambil usernya
            $allAdmin = User::whereHas('roles', function($query) {
                $query->where('name', 'super-admin');
            })->get(); // Semua super admin 
            $allUser = $allApprover->merge($allAdmin)->unique('id');

            foreach($allUser as $user){ // Foreach semua user
                sendResultToUser::dispatch($user,  $form); // send email
            }
        }
        else if($form->status == 'Rejected') // Kirim ke initiator dan admin jika form status rejected
        { 
            $initiator = User::where('nik', $form->initiatorDetail->initiator_nik)->first();
            $allAdmin = User::whereHas('roles', function($query) {
                $query->where('name', 'super-admin');
            })->get(); // Semua super admin 
            $allUser = $allAdmin->push($initiator)->unique('id'); // Gabung initiator dan admin

            //foreach initiator dan admin
            foreach($allUser as $user){
                sendResultToUser::dispatch($user, $form); // send email
            }

        }
        else if($form->status == 'In Approval') // Jika form in approval cek dan kirim ke gm
        {
            $this->sendMailToGM($no_reg);
        }
    }

    public function sendMailToGM($no_reg)
    {
        $form = MpdrForm::with('revision', 'detail', 'category', 'channel', 'description', 'certification', 'competitor', 'packaging', 'market', 'approvedDetail', 'initiatorDetail')
        ->where('no', $no_reg)->first();
        if($form->status == 'In Approval') // cek jika status masih In Approval
        {
            // cek apakah semua approver kecuali gm sudah approve
            $approveStatus = True;
            $gm = null;
            $gm_detail = null;
            foreach($form->approvedDetail as $detail){
                $user = User::where('nik', $detail->approver_nik)->first();
                if(!$user->hasRole('gm'))
                {
                    if($detail->status == 'not approve' || $detail->status == 'pending')
                    {
                        $approveStatus = False;
                        break;
                    }
                } 
                else if ($user->hasRole('gm'))
                {
                    $gm = $user;
                    $gm_detail = $detail;
                    if($detail->status !== 'pending' && $detail->token == null ) // Cek jika gm sudah approve dan token null
                    {
                        $approveStatus = False;
                        break;
                    }
                }
            }

            if($approveStatus){
                ProcessApproval::dispatch($gm, $form, $gm_detail); 
            }
        }
    }

    private function checkFormInApprovalStatus($no_reg)
    {
        $form = MpdrForm::with('approvedDetail')
        ->where('status', 'In Approval')
        ->where('no', $no_reg)->first();
        if($form){
            $approved = True;
            foreach($form->approvedDetail as $detail){
                if($detail->status === 'not approve'){
                    $form->status = 'Rejected';
                    $form->route_to = null;
                    $approved = False;
                    $form->save();
                    break;
                }else if($detail->status == 'pending'){
                    $approved = False;
                }
            }
            
            if($approved){
                $form->status = 'Approved';
                $form->save();
            }
            
            if($form->status === 'In Approval'){
                return True;
            }else{
                return False;
            }
        }

        return False;
    }


    public function approveNotReview(Request $request)
    {
        $form_no = $request->query('form_no');
        $approver_nik = $request->query('approver_nik');
        $status = $request->query('status');
        $token = $request->query('token');
        $approver = User::where('nik', $approver_nik)->first();
        $result = '';
        DB::beginTransaction();
        try {
            $form = MpdrForm::where('no', $form_no)->first();

            // Cek apakah status initiator pending dan token tidak null
            if($form->initiatorDetail->status == 'pending' && $form->initiatorDetail->token !== null){
                // Cek apakah yang login initiator
                if($form->initiatorDetail->initiator_nik == $approver_nik){
                    $form->initiatorDetail->status = $status;
                    $form->initiatorDetail->approved_date = now();
                    $form->initiatorDetail->token = null;
                    $form->initiatorDetail->save();
                    if($status !== 'approve' && $status !== 'approve with review'){
                        $form->status = 'Rejected'; 
                        $form->save();

                        // Jika form di reject maka kirim email ke admin saja
                        $this->sendMailToAdmin($form_no, $approver);

                    }else{
                        // kirim update ke admin
                        $this->sendMailToAdmin($form_no, $approver);
                        // Jika form di approve oleh initiator maka kirim email ke semua approver kecuali gm dan ke admin
                        $this->sendMailToApproversExceptGM($form_no);
                    }
                    $result = 'Success';
                }
                else
                {
                    DB::rollback();
                    $result = 'Initiator must approve first.';
                    $status = $status;
                }
            }
            else
            {
                $approverDetail = $form->approvedDetail->where('approver_nik', $approver_nik)->first();
                if($approverDetail->status === 'pending' && $approverDetail->token === $token){
                    $approverDetail->status = $status;
                    $approverDetail->token = null;
                    $approverDetail->approved_date = now();
                    $approverDetail->save();
                    $result = 'Success';
    
                    activity()
                        ->performedOn($form)
                        ->inLog('mpdr')
                        ->event('Approve')
                        ->causedBy($approver)
                        ->withProperties(['no' => $form_no, 'action' => 'approve'])
                        ->log('Approve Mpdr Form ' . $form_no . ' by ' . $approver->name . ' at ' . now());
                        
                    
                    if($approver->hasRole('gm'))
                    {
                        foreach($form->approvedDetail as $detail){
                            if($detail->status === 'Vacant'){
                                $detail->approved_date = now();
                                if($status === 'approve' || $status === 'approve with review'){
                                    $detail->status = 'approve with review';
                                    $detail->comment = "Approve by GM";
                                }else if($status === 'not approve'){
                                    $detail->status = $status;
                                    $detail->comment = "Not approve by GM";
                                }
                                $detail->token = null;
                                $detail->save();
                            }
                        }
                    }
                }else{
                    DB::rollback();
                    $result = 'Failed';
                    $status = $approverDetail->status;
                }
            }

            DB::commit();
            $this->checkFormInApprovalStatus($form_no); // Cek jika status form
            $this->sendMailToAdmin($form_no, $approver); // Kirim update ke admin
            $this->sendMailToUser($form_no); // Kirim email sesuai status form
            return view('emails.mpdr.resultView', compact('form_no', 'result', 'status'));
        } catch (\Exception $e) {
            // Rollback transaksi jika terjadi kesalahan
            DB::rollback();
            $result = 'Failed';
            return view('emails.mpdr.resultView', compact('form_no', 'result', 'status'));
        }
    }

    public function approveWithReview(Request $request)
    {
        $form_no = $request->query('form_no');
        $approver_nik = $request->query('approver_nik');
        $status = $request->query('status');
        $token = $request->query('token');
        $route_name = 'approveWithReview';
        return view('emails.mpdr.commentForm', compact('form_no', 'approver_nik', 'status', 'token', 'route_name'));
    }

    public function notApprove(Request $request)
    {
        $form_no = $request->query('form_no');
        $approver_nik = $request->query('approver_nik');
        $status = $request->query('status');
        $token = $request->query('token');
        $route_name = 'notApprove';
        return view('emails.mpdr.commentForm', compact('form_no', 'approver_nik', 'status', 'token', 'route_name'));
    }

    public function mailComment(Request $request)
    {
        $form_no = $request->query('form_no');
        $approver_nik = $request->query('approver_nik');
        $status = $request->query('status');
        $token = $request->query('token');
        $comment = $request->input('comment');
        $approver = User::where('nik', $approver_nik)->first();
        $result = '';
        DB::beginTransaction();

        try {
            $form = MpdrForm::where('no', $form_no)->first();

            // Cek apakah status initiator pending dan token tidak null
            if($form->initiatorDetail->status == 'pending' && $form->initiatorDetail->token !== null){
                // Cek apakah yang login initiator
                
                if($form->initiatorDetail->initiator_nik == $approver_nik){
                    $form->initiatorDetail->status = $status;
                    $form->initiatorDetail->approved_date = now();
                    if($request->input('action') !== 'approve'){
                        $form->initiatorDetail->comment = $comment;
                    }
                    $form->initiatorDetail->token = null;
                    $form->initiatorDetail->save();
                    $form->save();
                    if($status !== 'approve' && $status !== 'approve with review'){
                        $form->status = 'Rejected'; 
                        $form->save();

                        // Jika form di reject maka kirim email ke admin saja
                        $this->sendMailToAdmin($form_no, $approver);

                    }else{
                        // Jika form di approve oleh initiator maka kirim email ke semua approver kecuali gm dan ke admin
                        $this->sendMailToAdmin($form_no, $approver);
                        $this->sendMailToApproversExceptGM($form_no);
                    }
                    
                    $result = 'Success';
                }
                else
                {
                    DB::rollback();
                    $result = 'Initiator must approve first.';
                    $status = $status;
                }
            }
            else
            {
                $approverDetail = $form->approvedDetail->where('approver_nik', $approver_nik)->first();
                if($approverDetail->token === $token){
                    $approverDetail->status = $status;
                    $approverDetail->comment = $comment;
                    $approverDetail->token = null;
                    $approverDetail->approved_date = now();
                    $approverDetail->save();
                    $result = 'Success';

                    activity()
                        ->performedOn($form)
                        ->inLog('mpdr')
                        ->event('Approve')
                        ->causedBy($approver)
                        ->withProperties(['no' => $form_no, 'action' => 'approve'])
                        ->log('Approve Mpdr Form ' . $form_no . ' by ' . $approver->name . ' at ' . now());
                        
                }else{
                    
                    DB::rollback();
                    $result = 'You have already approved this form previously.';
                    $status = $approverDetail->status;
                }
            }

            DB::commit();
            $this->checkFormInApprovalStatus($form_no); // Cek jika status form
            $this->sendMailToAdmin($form_no, $approver); // Kirim update ke admin
            $this->sendMailToUser($form_no); // Kirim email sesuai status form
            return view('emails.mpdr.resultView', compact('form_no', 'result', 'status'));
        } catch (\Exception $e) {
            // Rollback transaksi jika terjadi kesalahan
            DB::rollback();
            $result = 'Failed';
            return view('emails.mpdr.resultView', compact('form_no', 'result', 'status'));
        }
    }

    
}
