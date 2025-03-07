<?php

namespace App\Http\Controllers\Mpdr;

use App\Http\Controllers\Controller;
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
                'initiator' => User::where('nik', $validated['initiator'])->first()->name,
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

            $form->initiator()->create([
                'form_id' => $form->id,
                'initiator_nik' => $validated['initiator'],
                'initiator_name' => User::where('nik', $validated['initiator'])->first()->name,
                'status' => 'pending',
                'token' => Str::uuid()
            ]);

            $approvers = MpdrApprover::where('user_nik', Auth::user()->nik)->get();
            foreach($approvers as $index => $approver){

                $form->approvedDetail()->create([
                    'form_id' => $form->id,
                    'approver_nik' => $approver->approver_nik,
                    'approver_name' => $approver->approver_name,
                    'status' => $approver->approver_status == 'Active' ? 'Active' : 'Vacant',
                    'token' => $approver->approver_status == 'Active' ? Str::uuid() : null
                ]);
            }

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
        $form = MpdrForm::with('revision', 'detail', 'category', 'channel', 'description', 'certification', 'competitor', 'packaging', 'market', 'approvedDetail')->where('no', $request->input('no_reg'))->first();
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
