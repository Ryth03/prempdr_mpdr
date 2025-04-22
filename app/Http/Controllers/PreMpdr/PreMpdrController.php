<?php

namespace App\Http\Controllers\PreMpdr;

use App\Http\Controllers\Controller;
use App\Jobs\PreMpdr\ProcessApproval;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Str;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\PREMPDR\PreMpdrForm;
use App\Models\PREMPDR\PreMpdrRevision;
use App\Notifications\MpdrNotification;

class PreMpdrController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        confirmDelete();
        return view('page.pre-mpdr.list-prempdr');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        // confirmDelete();
        return view('page.pre-mpdr.create-prempdr');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // dd($request, Auth::user()->id);
        $validated = $request->validate([
            'form_status' => 'required|string|in:Draft,Submit',
            'no_reg' => 'required|string',
            'projectName' => 'required|string|max:255',
            'levelPriority' => 'required',
            'brandName' => 'required',
            'rationalForDevelopment' => 'required',
            'productCategory' => 'required',
            'productCategoryText' => '',
            'channel' => 'required',
            'country' => '',
            'productDescription' => 'required',
            'usageDescription' => 'required|string',
            'storageTemperature' => 'required|string',
            'deliveryTemperature' => 'required|string',
            'certification' => 'required',
            'certificationText' => '',
            'productName1' => '',
            'size1' => '',
            'packaging1' => '',
            'priceIndication1' => '',
            'productName2' => '',
            'size2' => '',
            'packaging2' => '',
            'priceIndication2' => '',
            'weightProduct' => 'required',
            'packaging' => 'required',
            'ExistingPackagingText' => '',
            'NewPackagingText' => '',
            'productVariation' => 'required',
            'potentialVolume' => 'required',
            'expectedMargin' => 'required',
            'priceEstimate' => 'required',
            'targetLaunchText' => 'required',
            'initiator' => 'required|string',
            'salesManager' => 'required|string',
            'marketingManager' => 'required|string',
            'deptHead' => 'required|string',
        ]);

        // Mulai transaction untuk memastikan integritas data
        DB::beginTransaction();

        try {
            $revision = PreMpdrRevision::latest()->first();
            $user = Auth::user();
            $form = PreMpdrForm::create([
                'no' => $validated['no_reg'],
                'user_id' => $user->id,
                'revision_id' => $revision->id,
                'project_name' => $validated['projectName'],
                'brand_name' => $validated['brandName'],
                'level_priority' => $validated['levelPriority'],
                'status' => $validated['form_status'] == 'Submit' ? 'In Approval' : $validated['form_status'],
                'route_to' => $validated['form_status'] == 'Submit' ? User::where('nik', $validated['initiator'])->first()->name : null
            ]);
            // Simpan FormDetail terkait dengan Form
            $form->detail()->create([
                'form_id' => $form->id,
                'rational_for_development' => $validated['rationalForDevelopment'],
                'target_launch' => $validated['targetLaunchText']
            ]);
            $form->category()->create([
                'form_id' => $form->id,
                'category' => $validated['productCategory'],
                'other' => $validated['productCategoryText']
            ]);
            $form->channel()->create([
                'form_id' => $form->id,
                'category' => $validated['channel'],
                'country' => $validated['country']
            ]);
            $form->description()->create([
                'form_id' => $form->id,
                'product_description' => $validated['productDescription'],
                'usage_description' => $validated['usageDescription'],
                'storage_temperature' => $validated['storageTemperature'],
                'delivery_temperature' => $validated['deliveryTemperature']
            ]);
            $form->certification()->create([
                'form_id' => $form->id,
                'category' => $validated['certification'],
                'other' => $validated['certificationText']
            ]);
            if($request->productName1){
                $form->competitor()->create([
                    'form_id' => $form->id,
                    'name' => $validated['productName1'],
                    'size' => $validated['size1'],
                    'packaging' => $validated['packaging1'],
                    'price' => $validated['priceIndication1']
                ]);
            }
            if($request->productName2){
                $form->competitor()->create([
                    'form_id' => $form->id,
                    'name' => $validated['productName2'],
                    'size' => $validated['size2'],
                    'packaging' => $validated['packaging2'],
                    'price' => $validated['priceIndication2']
                ]);
            }
            $form->packaging()->create([
                'form_id' => $form->id,
                'weight' => $validated['weightProduct'],
                'category' => $validated['packaging'],
                'detail' => $validated[$validated['packaging'].'PackagingText'],
                'product_variation' => $validated['productVariation']
            ]);
            $form->market()->create([
                'form_id' => $form->id,
                'potential_volume' => $validated['potentialVolume'],
                'expected_margin' => $validated['expectedMargin'],
                'price_estimate' => $validated['priceEstimate']
            ]);

            $form->approver()->create([
                'form_id' => $form->id,
                'initiator' => $validated['initiator'],
                'sales_manager' => $validated['salesManager'],
                'marketing_manager' => $validated['marketingManager'],
                'department_head' => $validated['deptHead']
            ]);

            $approvers = ['initiator', 'salesManager', 'marketingManager', 'deptHead'];

            foreach($approvers as $index => $approver){
                $form->approvedDetail()->create([
                    'form_id' => $form->id,
                    'approver' => $validated[$approver],
                    'name' => User::where('nik', $validated[$approver])->first()->name,
                    'level' => $index+1,
                    'token' => Str::uuid()
                ]);
            }

            if($validated['form_status'] == 'Submit'){
                $this->sendMailToApprover($validated['no_reg']);
            }

            activity()
            ->performedOn($form)
            ->inLog('mpdr')
            ->event('Create')
            ->causedBy($user)
            ->withProperties(['no' => $validated['no_reg'], 'action' => 'created'])
            ->log('Create PreMpdr Form ' . $validated['no_reg'] . ' by ' . $user->name . ' at ' . now());

            // Commit transaksi
            DB::commit();
            Alert::toast('Form and details successfully saved!', 'success');
            return redirect()->route('prempdr.index');
            
        } catch (\Exception $e) {
            // dd($e);
            // Rollback transaksi jika terjadi kesalahan
            DB::rollback();
            Alert::toast('There was an error saving the form.'.$e->getMessage(), 'error');
            return back();
        }
    }

    /**
     * Display the specified resource.
     */
    public function show($no_reg)
    {
        return view('page.pre-mpdr.form-prempdr')->with('no_reg', $no_reg);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $no_reg)
    {
        confirmDelete();
        return view('page.pre-mpdr.edit-prempdr')->with('no_reg', $no_reg);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $no_reg)
    {
        $validated = $request->validate([
            'form_status' => 'required|string|in:Draft,Submit',
            'no_reg' => 'required|string',
            'projectName' => 'required|string|max:255',
            'levelPriority' => 'required',
            'brandName' => 'required',
            'rationalForDevelopment' => 'required',
            'productCategory' => 'required',
            'productCategoryText' => '',
            'channel' => 'required',
            'country' => '',
            'productDescription' => 'required',
            'usageDescription' => 'required|string',
            'storageTemperature' => 'required|string',
            'deliveryTemperature' => 'required|string',
            'certification' => 'required',
            'certificationText' => '',
            'productName1' => '',
            'size1' => '',
            'packaging1' => '',
            'priceIndication1' => '',
            'productName2' => '',
            'size2' => '',
            'packaging2' => '',
            'priceIndication2' => '',
            'weightProduct' => 'required',
            'packaging' => 'required',
            'ExistingPackagingText' => '',
            'NewPackagingText' => '',
            'productVariation' => 'required',
            'potentialVolume' => 'required',
            'expectedMargin' => 'required',
            'priceEstimate' => 'required',
            'targetLaunchText' => 'required',
            'initiator' => 'required|string',
            'salesManager' => 'required|string',
            'marketingManager' => 'required|string',
            'deptHead' => 'required|string',
        ]);

        // Mulai transaction untuk memastikan integritas data
        DB::beginTransaction();

        try {
            $user = Auth::user();
            $form = PreMpdrForm::where('no', $validated['no_reg'])
            ->where('user_id', $user->id)
            ->first();
            
            $form->update([
                'status' => $validated['form_status'] == 'Submit' ? 'In Approval' : $validated['form_status'],
                'route_to' => $validated['form_status'] == 'Submit' ? User::where('nik', $validated['initiator'])->first()->name : null
            ]);

            // Simpan FormDetail terkait dengan Form
            $form->detail()->update([
                'rational_for_development' => $validated['rationalForDevelopment'],
                'target_launch' => $validated['targetLaunchText']
            ]);
            $form->category()->update([
                'category' => $validated['productCategory'],
                'other' => $validated['productCategory'] == 'Others' ? $validated['productCategoryText'] : null
            ]);
            $form->channel()->update([
                'category' => $validated['channel'],
                'country' => $validated['channel'] == 'International' ? $validated['country'] : null
            ]);
            $form->description()->update(
                [
                'product_description' => $validated['productDescription'],
                'usage_description' => $validated['usageDescription'],
                'storage_temperature' => $validated['storageTemperature'],
                'delivery_temperature' => $validated['deliveryTemperature']
                ]
            );
            $form->certification()->update([
                'category' => $validated['certification'],
                'other' => $validated['certification'] == 'Others' ? $validated['certificationText'] : null
            ]);

            if($request->productName1 || $request->productName2){
                $form->competitor()->delete();
            }

            if($request->productName1){
                $form->competitor()->create([
                    'form_id' => $form->id,
                    'name' => $validated['productName1'],
                    'size' => $validated['size1'],
                    'packaging' => $validated['packaging1'],
                    'price' => $validated['priceIndication1']
                ]);
            }
            if($request->productName2){
                $form->competitor()->update([
                    'form_id' => $form->id,
                    'name' => $validated['productName2'],
                    'size' => $validated['size2'],
                    'packaging' => $validated['packaging2'],
                    'price' => $validated['priceIndication2']
                ]);
            }
            $form->packaging()->update([
                'weight' => $validated['weightProduct'],
                'category' => $validated['packaging'],
                'detail' => $validated[$validated['packaging'].'PackagingText'],
                'product_variation' => $validated['productVariation']
            ]);
            $form->market()->update([
                'potential_volume' => $validated['potentialVolume'],
                'expected_margin' => $validated['expectedMargin'],
                'price_estimate' => $validated['priceEstimate']
            ]);

            $form->approver()->update([
                'initiator' => $validated['initiator'],
                'sales_manager' => $validated['salesManager'],
                'marketing_manager' => $validated['marketingManager'],
                'department_head' => $validated['deptHead']
            ]);

            $approvers = ['initiator', 'salesManager', 'marketingManager', 'deptHead'];

            foreach($approvers as $index => $approver){
                $form->approvedDetail()->where('level', $index+1)->update([
                    'approver' => $validated[$approver],
                    'name' => User::where('nik', $validated[$approver])->first()->name,
                    'token' => Str::uuid()
                ]);
            }

            if($validated['form_status'] == 'Submit'){
                $this->sendMailToApprover($validated['no_reg']);
            }

            activity()
            ->performedOn($form)
            ->inLog('prempdr')
            ->event('Update')
            ->causedBy($user)
            ->withProperties(['no' => $validated['no_reg'], 'action' => 'updated'])
            ->log('Update PreMpdr Form ' . $validated['no_reg'] . ' by ' . $user->name . ' at ' . now());

            // Commit transaksi
            DB::commit();
            Alert::toast('Form successfully updated!', 'success');
            return redirect()->route('prempdr.index');
            
        } catch (\Exception $e) {
            // dd($e);
            // Rollback transaksi jika terjadi kesalahan
            DB::rollback();
            Alert::toast('There was an error updating the form.'.$e->getMessage(), 'error');
            return back();
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $no)
    {
        $user = Auth::user();
        DB::beginTransaction();

        try {
            $form = PrempdrForm::where('no', $no)
                    ->where('status', 'Draft')
                    ->first();
            $form->delete();
            DB::commit();

            activity()
            ->performedOn($form)
            ->inLog('prempdr')
            ->event('Delete')
            ->causedBy($user)
            ->withProperties(['no' => $no, 'action' => 'deleted'])
            ->log('Delete PreMpdr Form ' . $no . ' by ' . $user->name . ' at ' . now());

            Alert::toast('Form successfully deleted!.', 'success');
            return redirect()->route('prempdr.index');
        } catch (\Exception $e) {
            // Rollback transaksi jika terjadi kesalahan
            DB::rollback();
            Alert::toast('There was an error updating the form.'.$e->getMessage(), 'error');
            return back();
        }
    }

    public function report()
    {
        return view('page.pre-mpdr.report-prempdr');
    }

    public function approval()
    {
        return view('page.pre-mpdr.approval-prempdr');
    }

    public function log()
    {
        return view('page.pre-mpdr.log-prempdr');
    }
    
    public function print($no_reg)
    {
        return view('page.pre-mpdr.print-prempdr')->with('no_reg', $no_reg);
    }
    
    public function noReg()
    {
        $year = date('y');
        $prefix = "{$year}PREMPDR";
        $lastPcr = PreMpdrForm::where('no', 'like', "{$prefix}%")->orderBy('no', 'desc')->first();

        if ($lastPcr) {
            $lastNo = (int)substr($lastPcr->no_reg, -4);
            $newNo = $lastNo + 1;
        } else {
            $newNo = 1;
        }

        do {
            $newNoReg = $prefix . str_pad($newNo, 4, '0', STR_PAD_LEFT);
            $existingPcr = PreMpdrForm::where('no', $newNoReg)->first();
            if ($existingPcr) {
                $newNo++;
            }
        } while ($existingPcr);

        return response()->json(['no_reg' => $newNoReg]);
    }

    public function getFormData(Request $request)
    {
        $form = PreMpdrForm::with('revision', 'detail', 'category', 'channel', 'description', 'certification', 'competitor', 'packaging', 'market', 'approver', 'approvedDetail')->where('no', $request->input('no_reg'))->first();
        if($form){
            return response()->json($form);
        }

        return response()->json("Tidak ada Form");
    }

    public function getReportData()
    {
        $form = PreMpdrForm::with('revision', 'detail', 'category', 'channel', 'description', 'certification', 'competitor', 'packaging', 'market', 'approver', 'approvedDetail')->where('user_id', Auth::user()->id)->get();
        if($form){
            $form = $form->map(function($item) {
                /** @var PreMpdrForm $item */
                $item->new_created_at = $item->created_at->format('j F Y');
                return $item;
            });
            return response()->json($form);
        }

        return response()->json("Tidak ada Form");
    }

    public function template()
    {
        return view('page.pre-mpdr.template-form-prempdr');
    }

    public function showDraftForm($no_reg){
        confirmDelete();
        return view('page.pre-mpdr.draft-prempdr')->with('no_reg', $no_reg);
    }

    public function getFormList()
    {
        $forms = PreMpdrForm::where('user_id', Auth::user()->id)
        ->with(['approvedDetail' => function ($query) {
            $query->select(DB::raw("form_id, count(*) as total, sum(case when status is not null then 1 else 0 end) as approved_count"))->groupBy('form_id');
        }])
        ->get();
        if($forms){
            return response()->json($forms);
        }

        return response()->json("Tidak ada Form");
    }

    private function sendMailToApprover($no_reg)
    {
        $form = PreMpdrForm::with('revision', 'detail', 'category', 'channel', 'description', 'certification', 'competitor', 'packaging', 'market', 'approver', 'approvedDetail')
        ->where('no', $no_reg)->first();
        if($form->route_to){
            $approved_detail = $form->approvedDetail->where('name', $form->route_to)->first();
            $approver = User::where('nik', $approved_detail->approver)->first(); // Approver yang dituju
            
            ProcessApproval::dispatch($approver, $form, $approved_detail); // send email

            // kirim notif app 
            $data = [
                'title' => 'New Pre-MPDR for Approval',
                'message' => $form->no . ' needs your approval.',
                'user_id' => $form->user_id,
            ];
            $notificationType = 'approval_request'; // Tipe notifikasi yang sesuai
            $approver->notify(new MpdrNotification($data, $notificationType));
        }
    }
}
