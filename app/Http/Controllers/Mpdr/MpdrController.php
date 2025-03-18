<?php

namespace App\Http\Controllers\Mpdr;

use App\Http\Controllers\Controller;
use App\Http\Controllers\MPDR\MpdrInitiatorController;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Str;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Models\User;
use App\Models\MPDR\MpdrForm;
use App\Models\MPDR\MpdrApprover;
use App\Models\MPDR\MpdrRevision;

class MpdrController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        confirmDelete();
        return \view('page.mpdr.list-mpdr');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return \view('page.mpdr.create-mpdr');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'form_status' => 'required|string|in:Draft,Submit',
            'no_reg' => 'required|string',
            'productName' => 'required|string|max:255',
            'levelPriority' => 'required',
            'initiator' => 'required',
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
            'targetLaunchText' => 'required'
        ]);

        // Mulai transaction untuk memastikan integritas data
        DB::beginTransaction();

        try {
            $user = Auth::user();
            $revision = MpdrRevision::latest()->first();

            $form = MpdrForm::create([
                'no' => $validated['no_reg'],
                'user_id' => Auth::user()->id,
                'revision_id' => $revision->id,
                'product_name' => $validated['productName'],
                'initiator' => User::where('nik', $validated['initiator'])->first()->name,
                'level_priority' => $validated['levelPriority'],
                'status' => $validated['form_status'] == 'Submit' ? 'In Approval' : $validated['form_status'],
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

            $form->initiatorDetail()->create([
                'form_id' => $form->id,
                'initiator_nik' => $validated['initiator'],
                'initiator_name' => User::where('nik', $validated['initiator'])->first()->name,
                'status' => 'pending',
                'token' => Str::uuid()
            ]);

            if($validated['form_status'] == 'Submit'){
                $approvers = MpdrApprover::where('user_nik', $user->nik)->get();
                foreach($approvers as $index => $approver){
                    $form->approvedDetail()->create([
                        'form_id' => $form->id,
                        'approver_nik' => $approver->approver_nik,
                        'approver_name' => $approver->approver_name,
                        'status' => $approver->approver_status == 'Active' ? 'pending' : 'Vacant',
                        'token' => $approver->approver_status == 'Active' ? Str::uuid() : null
                    ]);
                }
                
                // Kirim email ke initiator
                $MpdrInitiatorController = new MpdrInitiatorController();
                $MpdrInitiatorController->sendMailToInitiator($form->no);
            }

            activity()
            ->performedOn($form)
            ->inLog('mpdr')
            ->event('Create')
            ->causedBy($user)
            ->withProperties(['no' => $validated['no_reg'], 'action' => 'created'])
            ->log('Create Mpdr Form ' . $validated['no_reg'] . ' by ' . $user->name . ' at ' . now());

            // Commit transaksi
            DB::commit();
            Alert::toast('Form and details successfully saved!', 'success');
            return redirect()->route('mpdr.index');
            
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
        return view('page.mpdr.form-mpdr')->with('no_reg', $no_reg);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $no_reg)
    {
        return \view('page.mpdr.edit-mpdr')->with('no_reg', $no_reg);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $no_reg)
    {
        $validated = $request->validate([
            'form_status' => 'required|string|in:Draft,Submit',
            'no_reg' => 'required|string',
            'productName' => 'required|string|max:255',
            'levelPriority' => 'required',
            'initiator' => 'required',
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
            'targetLaunchText' => 'required'
        ]);

        // Mulai transaction untuk memastikan integritas data
        DB::beginTransaction();

        try {
            $user = Auth::user();
            $form = MpdrForm::where('no', $validated['no_reg'])
            ->where('user_id', $user->id)
            ->first();
            
            $form->update([
                'initiator' => User::where('nik', $validated['initiator'])->first()->name,
                'status' => $validated['form_status'] == 'Submit' ? 'In Approval' : $validated['form_status']
            ]);

            // Simpan FormDetail terkait dengan Form
            $form->detail()->update([
                'rational_for_development' => $validated['rationalForDevelopment'],
                'target_launch' => $validated['targetLaunchText']
            ]);
            $form->category()->update([
                'category' => $validated['productCategory'],
                'other' => $validated['productCategoryText']
            ]);
            $form->channel()->update([
                'category' => $validated['channel'],
                'country' => $validated['country']
            ]);
            $form->description()->update([
                'product_description' => $validated['productDescription'],
                'usage_description' => $validated['usageDescription'],
                'storage_temperature' => $validated['storageTemperature'],
                'delivery_temperature' => $validated['deliveryTemperature']
            ]);
            $form->certification()->update([
                'category' => $validated['certification'],
                'other' => $validated['certificationText']
            ]);

            if($request->productName1 || $request->productName2){
                $form->competitor()->delete();
            }
            if($request->productName1){
                $form->competitor()->update([
                    'name' => $validated['productName1'],
                    'size' => $validated['size1'],
                    'packaging' => $validated['packaging1'],
                    'price' => $validated['priceIndication1']
                ]);
            }
            if($request->productName2){
                $form->competitor()->update([
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

            $form->initiatorDetail()->update([
                'initiator_nik' => $validated['initiator'],
                'initiator_name' => User::where('nik', $validated['initiator'])->first()->name,
                'status' => 'pending',
                'token' => Str::uuid()
            ]);

            if($validated['form_status'] == 'Submit'){
                $approvers = MpdrApprover::where('user_nik', $user->nik)->get();
                foreach($approvers as $index => $approver){
                    $form->approvedDetail()->create([
                        'form_id' => $form->id,
                        'approver_nik' => $approver->approver_nik,
                        'approver_name' => $approver->approver_name,
                        'status' => $approver->approver_status == 'Active' ? 'pending' : 'Vacant',
                        'token' => $approver->approver_status == 'Active' ? Str::uuid() : null
                    ]);
                }
                
                // Kirim email ke initiator
                $MpdrInitiatorController = new MpdrInitiatorController();
                $MpdrInitiatorController->sendMailToInitiator($form->no);
            }

            activity()
            ->performedOn($form)
            ->inLog('mpdr')
            ->event('Update')
            ->causedBy($user)
            ->withProperties(['no' => $validated['no_reg'], 'action' => 'updated'])
            ->log('Update Mpdr Form ' . $validated['no_reg'] . ' by ' . $user->name . ' at ' . now());

            // Commit transaksi
            DB::commit();
            Alert::toast('Form and details successfully saved!', 'success');
            return redirect()->route('mpdr.index');
            
        } catch (\Exception $e) {
            // dd($e);
            // Rollback transaksi jika terjadi kesalahan
            DB::rollback();
            Alert::toast('There was an error saving the form.'.$e->getMessage(), 'error');
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
            $form = MpdrForm::where('no', $no)
                    ->where('status', 'Draft')
                    ->first();
            $form->delete();
            DB::commit();

            activity()
            ->performedOn($form)
            ->inLog('mpdr')
            ->event('Delete')
            ->causedBy($user)
            ->withProperties(['no' => $no, 'action' => 'deleted'])
            ->log('Delete Mpdr Form ' . $no . ' by ' . $user->name . ' at ' . now());

            Alert::toast('Form successfully deleted!.', 'success');
            return redirect()->route('mpdr.index');
        } catch (\Exception $e) {
            // Rollback transaksi jika terjadi kesalahan
            DB::rollback();
            Alert::toast('There was an error updating the form.'.$e->getMessage(), 'error');
            return back();
        }
    }

    public function report()
    {
        return view('page.mpdr.report-mpdr');
    }

    public function log()
    {
        return view('page.mpdr.log-mpdr');
    }

    public function viewForm()
    {
        return view('page.mpdr.form-mpdr');
    }
    
    public function print($no_reg)
    {
        return view('page.mpdr.print-mpdr')->with('no_reg', $no_reg);
    }

    public function template()
    {
        return view('page.mpdr.template-form-mpdr');
    }

    public function noReg()
    {
        $year = date('y');
        $prefix = "{$year}MPDR";
        $lastPcr = MpdrForm::where('no', 'like', "{$prefix}%")->orderBy('no', 'desc')->first();

        if ($lastPcr) {
            $lastNo = (int)substr($lastPcr->no_reg, -4);
            $newNo = $lastNo + 1;
        } else {
            $newNo = 1;
        }

        do {
            $newNoReg = $prefix . str_pad($newNo, 4, '0', STR_PAD_LEFT);
            $existingPcr = MpdrForm::where('no', $newNoReg)->first();
            if ($existingPcr) {
                $newNo++;
            }
        } while ($existingPcr);

        return response()->json(['no_reg' => $newNoReg]);
    }

    public function getFormList()
    {
        $forms = MpdrForm::where('user_id', Auth::user()->id)->get();
        if($forms){
            return response()->json($forms);
        }

        return response()->json("Tidak ada Form");
    }

    public function getFormData(Request $request)
    {
        $form = MpdrForm::with('revision', 'detail', 'category', 'channel', 'description', 'certification', 'competitor', 'packaging', 'market', 'approvedDetail', 'initiatorDetail')->where('no', $request->input('no_reg'))->first();
        if($form){
            return response()->json($form);
        }

        return response()->json("Tidak ada Form");
    }
    

    public function getReportData()
    {
        $form = MpdrForm::with('revision', 'detail', 'category', 'channel', 'description', 'certification', 'competitor', 'packaging', 'market','approvedDetail')->where('user_id', Auth::user()->id)->get();
        if($form){
            $form = $form->map(function($item) {  
                /** @var MpdrForm $item */
                $item->new_created_at = $item->created_at->format('j F Y');
                return $item;
            });
            return response()->json($form);
        }

        return response()->json("Tidak ada Form");
    }

    public function getPrintData(Request $request)
    {
        $form = MpdrForm::with('revision', 'detail', 'category', 'channel', 'description', 'certification', 'competitor', 'packaging', 'market', 'approvedDetail')->where('no', $request->input('id'))->first();
        if($form){
            return response()->json($form);
        }

        return response()->json("Tidak ada Form");
    }
}
