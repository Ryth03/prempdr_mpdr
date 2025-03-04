<?php

namespace App\Http\Controllers\Mpdr;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;
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
        // dd($request, Auth::user()->id);
        $validated = $request->validate([
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
            $revision = MpdrRevision::latest()->first();

            $form = MpdrForm::create([
                'no' => $validated['no_reg'],
                'user_id' => Auth::user()->id,
                'revision_id' => $revision->id,
                'product_name' => $validated['productName'],
                'initiator' => $validated['initiator'],
                'level_priority' => $validated['levelPriority'],
                'status' => 'In Approval'
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

            // Commit transaksi
            DB::commit();
            Alert::toast('Form and details saved successfully!', 'success');
            return redirect()->route('mpdr.index');
            
        } catch (\Exception $e) {
            dd($e);
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
    public function edit(string $id)
    {
        return \view('page.mpdr.edit-mpdr');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function report()
    {
        return view('page.mpdr.report-mpdr');
    }

    public function approval()
    {
        return view('page.mpdr.approval-mpdr');
    }

    public function log()
    {
        return view('page.mpdr.log-mpdr');
    }

    public function approver()
    {
        $users = User::role('approver')->get();
        confirmDelete();
        return view('page.mpdr.approver-mpdr');
    }

    public function viewForm()
    {
        return view('page.mpdr.form-mpdr');
    }
    
    public function print()
    {
        return view('page.mpdr.print-mpdr');
    }

    public function viewFormApproval()
    {
        return view('page.mpdr.form-approval-mpdr');
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
        $form = MpdrForm::with('revision', 'detail', 'category', 'channel', 'description', 'certification', 'competitor', 'packaging', 'market')->where('no', $request->input('no_reg'))->first();
        if($form){
            return response()->json($form);
        }

        return response()->json("Tidak ada Form");
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
}
