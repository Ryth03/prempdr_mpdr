<!DOCTYPE html>
<html lang="en">
<head>
    <title>Form detail</title>
    <style>
        .header-style{
            background-color: yellow;
            padding: 5px;
            padding-left: 15px;
        }
        .tr-odd{
            background-color: rgb(238, 238, 238);
        }
        td, th{
            padding: 0.3rem 0.5rem;
        }
    </style>
</head>

<body>
    <table style="border: 1px solid black; width:100%; max-width:1000px; margin:auto;">
        <thead>
            <tr class="header-style">
                <td colspan="2">
                    <h2>Pre-MPDR</h2>
                    <h5>PT Sinar Meadow International Indonesia</h5>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    @if($form->status == 'Approved')
                        <p>Dear <strong>All</strong>,</p>
                        <p>Form Pre-MPDR {{$form->no}} has been <span style="color: green;">Approved</span>.</p>
                    @elseif($form->status == 'Rejected')
                        <p>Dear <strong>initiator</strong> & <strong>super-admin</strong>,</p>
                        <p>Form Pre-MPDR {{$form->no}} has been <span style="color: red;">Rejected</span> by {{$form->approvedDetail->where('status', 'not approve')->first()->name}}.</p>
                    @elseif($form->status == 'In Approval')
                        <p>Dear <strong>super-admin</strong>,</p>
                        <p>Form Pre-MPDR {{$form->no}} has been <span style="color: green;">Approved</span> by {{$form->approvedDetail->whereIn('status', ['approve', 'approve with review'])->last()->name}}.</p>
                    @endif
                </td>
            </tr>
        </thead>
        <tbody>
                <tr>
                    <th colspan="2">
                        <h5 class="text-center">Pre-MARKETING PRODUCT DEVELOPMENT REQUEST</h5>
                    </th>
                </tr>
                <tr class="tr-odd">
                    <td width="40%">No Reg:</td>
                    <td width="60">{{$form->no}}</td>
                </tr>
                <tr>
                    <td>Project Name:</td>
                    <td>{{$form->project_name ?? ''}}</td>
                </tr>
                <tr class="tr-odd">
                    <td>Level Priority:</td>
                    <td>{{$form->level_priority ?? ''}}</td>
                </tr>
                <tr>
                    <td>Proposed BRAND Name:</td>
                    <td>{{$form->brand_name ?? ''}}</td>
                </tr>
                <tr class="tr-odd">
                    <td>Rational For Development:</td>
                    <td>{{$form->detail->rational_for_development ?? ''}}</td>
                </tr>
                <tr>
                    <td>Product Category:</td>
                    <td>{{$form->category->category ?? ''}} {{$form->category->other ?? ''}}</td>
                </tr>
                <tr class="tr-odd">
                    <td>Channel:</td>
                    <td>{{$form->channel->category ?? ''}} {{$form->channel->country ?? ''}}</td>
                </tr>
                <tr>
                    <th>GENERAL PRODUCT DESCRIPTION AND FUNCTION</th>
                    <td></td>
                </tr>
                <tr class="tr-odd">
                    <td>Product Description (Form/Color/Flavor brief):</td>
                    <td>{!! $form->description->product_description ?? '' !!}</td>
                </tr>
                <tr>
                    <td>Usage Description (Application in customer):</td>
                    <td>{!! $form->description->usage_description ?? '' !!}</td>
                </tr>
                <tr class="tr-odd">
                    <td>Storage Temperature:</td>
                    <td>{{ $form->description->storage_temperature ?? '' }}</td>
                </tr>
                <tr>
                    <td>Delivery Temperature:</td>
                    <td>{{ $form->description->delivery_temperature ?? '' }}</td>
                </tr>
                <tr class="tr-odd">
                    <td>Certification Requirement:</td>
                    <td>{{ $form->certification->category ?? '' }} {{ $form->certification->other ?? '' }}</td>
                </tr>
                <tr>
                    <th>Competitor's Product to Match or to Beat</th>
                    <td></td>
                </tr>
                @if(isset($form->competitor))
                    @foreach($form->competitor as $index => $competitor)
                    <tr class="tr-odd">
                        <td>Product Name {{$index+1}}</td>
                        <td>{{$competitor->name ?? ''}}</td>
                    </tr>
                    <tr>
                        <td>Size {{$index+1}}</td>
                        <td>{{$competitor->size ?? ''}}</td>
                    </tr>
                    <tr class="tr-odd">
                        <td>Packaging {{$index+1}}</td>
                        <td>{{$competitor->packaging ?? ''}}</td>
                    </tr>
                    <tr>
                        <td>Price Indication {{$index+1}}</td>
                        <td>{{$competitor->price ?? ''}}</td>
                    </tr>
                    @endforeach
                @endif
                <tr class="tr-odd">
                    <th>Detailed Packaging Required</th>
                    <td></td>
                </tr>
                <tr>
                    <td>Weight of Product (kg/carton):</td>
                    <td>{{ $form->packaging->weight ?? '' }}</td>
                </tr>
                <tr class="tr-odd">
                    <td>Packaging:</td>
                    <td>{{ $form->packaging->category ?? '' }} {{ $form->packaging->detail ?? '' }}</td>
                </tr>
                <tr>
                    <td>Product Variation List:</td>
                    <td>{{ $form->packaging->product_variation ?? '' }}</td>
                </tr>
                <tr class="tr-odd">
                    <th>MARKET UPDATE</th>
                    <td></td>
                </tr>
                <tr>
                    <td>Potential Volume (Mt/Annually):</td>
                    <td>{{ $form->market->potential_volume ?? '' }}</td>
                </tr>
                <tr class="tr-odd">
                    <td><b>Pricing Strategy</b></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Expected Margin (%):</td>
                    <td>{{ $form->market->expected_margin ?? '' }}</td>
                </tr>
                <tr class="tr-odd">
                    <td>Price Estimate:</td>
                    <td>{{ $form->market->price_estimate ?? '' }}</td>
                </tr>
                <tr>
                    <td>TARGET LAUNCH (as Initiator request):</td>
                    <td>{{ $form->detail->target_launch ?? '' }}</td>
                </tr>
                
                @if($form->status !== 'Approved')
                    <tr class="tr-odd">
                        <th>Approved by,</th>
                        <td></td>
                    </tr>
                    
                    @foreach($form->approvedDetail as $index => $approvedDetail)
                    <tr  class="{{ $index % 2 != 0 ? 'tr-odd' : '' }}">
                        <td>{{ $approvedDetail->name }}</td>
                        <td>
                            <p style="{{$approvedDetail->status == 'approve' ? 'color: green;' : ($approvedDetail->status == 'approve with review' ? 'color: orange;' : 'color: red;')}}">{{ $approvedDetail->status }} {{$approvedDetail->approved_date !== null ? '('.$approvedDetail->approved_date.')' : ''}}</p>
                            <p>{{$approvedDetail->comment}}</p>
                        </td>
                    </tr>
                    @endforeach
                @endif

                <tr>
                    <td colspan="2">
                        @if($form->status == 'Approved')
                            <p style="text-align: center;">Thank you for your cooperation, and we wish you a safe and successful completion of your tasks.</p>
                            <p style="text-align: center;">Please use the following link to download the approved document:</p>
                            <p style="text-align: center;"><a href="{{$downloadLink}}" target="_blank">Download Approved Form</a></p>
                        @elseif($form->status == 'Rejected')
                            <p style="text-align: center;">We appreciate your understanding and look forward to your revised submission.</p>
                        @endif
                        <br>
                        <p style="text-align: center;">Best regards,</p>
                        <p style="text-align: center;">PT Sinar Meadow International Indonesia</p>
                    </td>
                </tr>
        </tbody>
    </table>
</body>
</html>