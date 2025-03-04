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

class PreMpdrController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // dd(Auth::user()->id);
        return view('page.pre-mpdr.list-prempdr');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('page.pre-mpdr.create-prempdr');

    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // dd($request, Auth::user()->id);
        $validated = $request->validate([
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
            
            $form = PreMpdrForm::create([
                'no' => $validated['no_reg'],
                'user_id' => Auth::user()->id,
                'revision_id' => $revision->id,
                'project_name' => $validated['projectName'],
                'brand_name' => $validated['brandName'],
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

            // Commit transaksi
            DB::commit();
            Alert::toast('Form and details saved successfully!', 'success');
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
    public function edit(string $id)
    {
        return view('page.pre-mpdr.edit-prempdr');

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

    public function viewApprovalForm($no_reg)
    {
        confirmDelete();
        return view('page.pre-mpdr.form-approval-prempdr')->with('no_reg', $no_reg);
    }

    public function approveForm(Request $request, $no_reg)
    {
        
        DB::beginTransaction();
        try {
            $nik = Auth::user()->nik;
            $form = PreMpdrForm::with('approvedDetail')->where('no', $no_reg)->first();
            
            foreach($form->approvedDetail as $detail){
                if($detail->approver === $nik){
                    $detail->status = $request->input('action');
                    $detail->approved_date = now();
                    if($request->input('action') !== 'approve'){
                        $detail->comment = $request->input('comment');
                    }
                    $detail->save();
                    break;
                }
            }
            if($request->input('action') === 'approve' || $request->input('action') === 'approve with review'){
                $notNull = True;
                foreach($form->approvedDetail as $detail){
                    if(!$detail->status){
                        $notNull = False;
                        break;
                    }
                }
                if($notNull){
                    $form->status = 'Approved';
                }
            }else{
                $form->status = 'Rejected';
            }
            $form->save();
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

    public function getPrintData(Request $request)
    {
        $form = PreMpdrForm::with('revision', 'detail', 'category', 'channel', 'description', 'certification', 'competitor', 'packaging', 'market', 'approver')->where('no', $request->input('id'))->first();
        if($form){
            return response()->json($form);
        }

        return response()->json("Tidak ada Form");
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
        if(!Auth::user()->hasRole('approver')){
            return response()->json();
        }

        $nik = Auth::user()->nik;
        
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

    public function getFormList()
    {
        $forms = PreMpdrForm::where('user_id', Auth::user()->id)->get();
        if($forms){
            return response()->json($forms);
        }

        return response()->json("Tidak ada Form");
    }
}
