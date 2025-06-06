<x-app-layout>
    @section('title')
        Report PREMPDR
    @endsection

    @push('css')
        <link rel="stylesheet" href="https://cdn.datatables.net/2.2.1/css/dataTables.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/3.0.0/css/responsive.bootstrap.min.css">
        <style>
            @media print {
                
                body {
                    zoom: 0.6; 
                    margin: 0px;
                }
                .no-print, .topbar, .left-sidebar{
                    display: none !important;
                }
                
            }
            #competitorProduct>tbody>tr>th, #competitorProduct>tbody>tr>td, #approver>tbody>tr>th, #approver>tbody>tr>td{
                padding: 8px 10px !important;
            }

            .no-resize{
                resize:none;
            }
        </style>
    @endpush


    <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4 no-print">
        <div class="card-body px-4 py-3">
            <div class="row align-items-center">
                <div class="col-9">
                    <h4 class="fw-semibold mb-8">Report PREMPDR</h4>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a class="text-muted text-decoration-none" href="{{ route('dashboard') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item" aria-current="page">Report PREMPDR</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-3">
                    <div class="text-center mb-n5">
                        <img src="{{ asset('assets') }}/images/breadcrumb/ChatBc.png" alt="modernize-img"
                            class="img-fluid mb-n4">
                    </div>
                </div>
                <div class="col-3">
                    <button onclick="history.back()" class="btn btn-sm btn-primary flex-end">Back</button>
                </div>
            </div>
        </div>
    </div>

    <div class="card overflow-hidden invoice-application">
        <div class="d-flex align-items-center justify-content-between gap-6 m-3 d-lg-none no-print">
            <button class="btn btn-primary d-flex" type="button" data-bs-toggle="offcanvas"
                data-bs-target="#chat-sidebar" aria-controls="chat-sidebar">
                <i class="ti ti-menu-2 fs-5"></i>
            </button>
            <form class="position-relative w-100">
                <input type="text" class="form-control search-chat py-2 ps-5" id="text-srh"
                    placeholder="Search Contact">
                <i class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
            </form>
        </div>
        <div class="d-flex">
            <div class="w-25 d-none d-lg-block border-end user-chat-box no-print">
                <div class="p-3 border-bottom">
                    <form class="position-relative">
                        <input type="search" class="form-control search-invoice ps-5" id="text-srh"
                            placeholder="Search Report">
                        <i
                            class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
                    </form>
                </div>
                <div class="app-invoice">
                    <ul class="overflow-auto invoice-users" data-simplebar="init">
                        <div id="list-form" class="simplebar-content" style="padding: 0px;">
                        </div>
                        <div class="simplebar-track simplebar-horizontal" style="visibility: hidden;">
                            <div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
                        </div>
                        <div class="simplebar-track simplebar-vertical" style="visibility: hidden;">
                            <div class="simplebar-scrollbar" style="height: 0px; display: none;"></div>
                        </div>
                    </ul>
                </div>
            </div>
            <div class="w-75 w-xs-100 chat-container">
                <div class="invoice-inner-part h-100">
                    <div class="invoiceing-box">
                        <div class="invoice-header d-flex align-items-center border-bottom p-3 no-print">
                            <h4 class="mb-0"><span id="title-report">Project Name</span></h4>
                            <div class="ms-auto">
                                <h4 class="invoice-number">#<span id="id-report">---</span></h4>
                            </div>
                        </div>
                        <div id="mpdr-form" class="border border-4 border-black w-100 mb-4">
                            <header id="mpdr-header" class="row">
                                <div class="col-3">
                                    <img src="{{ asset('assets') }}/images/logos/logoputih.png" class="dark-logo img-fluid p-0" alt="Logo-Dark">
                                    <img src="{{ asset('assets') }}/images/logos/logohitam.png" class="light-logo img-fluid p-0" alt="Logo-light">
                                </div>
                                <div class="col-5 fw-bold border-start border-end border-3 border-black text-center d-flex flex-column justify-content-center align-items-center">
                                    <h4>MARKETING</h4>
                                    <h4>PRODUCT DEVELOPMENT REQUEST</h4>
                                </div>
                                <div class="col-3 d-flex flex-column justify-content-around">
                                        <p class="my-auto">No : <span id="revision-no"></span></p>
                                        <p class="my-auto">Revision : <span id="revision-count"></span></p>
                                        <p class="my-auto">Date : <span id="revision-date"></span></p>
                                </div>
                            </header>
                            <main id="mpdr-main" class="d-flex flex-column gap-3 border-top border-4 border-black p-2">
                                <div class="d-flex justify-content-end">
                                    <label for="no_reg" class="form-label">No Reg: <span id="no_reg_text"></span></label>
                                    <input type="hidden" id="no_reg" name="no_reg" value="" readonly>
                                </div>
                                <div class="row">
                                    <div class="col-12 col-md-5">
                                        <label for="productName" class="form-label">Product Name:</label>
                                        <input type="text" class="form-control" id="productName" name="productName" required> 
                                    </div>
                                    <div class="col-12 col-md-2">
                                        <label for="levelPriority" class="form-label">Level Priority:</label>
                                        <input type="text" class="form-control" id="levelPriority" name="levelPriority" required> 
                                    </div>
                                    <div class="col-12 col-md-5">
                                        <label for="initiator" class="form-label">Initiator:</label>
                                        <input type="text" class="form-control" id="initiator" name="initiator" required>
                                    </div>
                                </div>
                                <div id="rational">
                                    <label for="rationalForDevelopment" class="form-label">Rational For Development: </label>
                                    <textarea class="form-control no-resize" name="rationalForDevelopment" id="rationalForDevelopment" rows="2"></textarea>
                                </div>
                                <div class="row">
                                    <div id="productCategory" class="col">
                                        <label class="form-label">Product Category:</label>
                                        <div class="">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="productCategory" id="Margarine">
                                                <label class="form-check-label" for="Margarine">
                                                Margarine
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="productCategory" id="Frying Fats">
                                                <label class="form-check-label" for="Frying Fats">
                                                Frying Fats
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="productCategory" id="Shortening">
                                                <label class="form-check-label" for="Shortening">
                                                Shortening
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="productCategory" id="Pastry">
                                                <label class="form-check-label" for="Pastry">
                                                Pastry
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="productCategory" id="Others">
                                                <label class="form-check-label" for="Others">
                                                    Others
                                                </label>
                                                <input type="text" class="form-control" name="productCategoryText" id="productCategoryText">
                                            </div>
                                        </div>
                                    </div>
                                    <div id="channel" class="col">
                                        <label class="form-label">Channel:</label>
                                        <div class="">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="channel" id="International">
                                                <label class="form-check-label" for="International">
                                                International
                                                </label>
                                                <input type="text" class="form-control" name="country" id="country">
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="channel" id="Regional">
                                                <label class="form-check-label" for="Regional">
                                                Regional
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="channel" id="Industrial">
                                                <label class="form-check-label" for="Industrial">
                                                Industrial
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="channel" id="FSBC-Direct">
                                                <label class="form-check-label" for="FSBC-Direct">
                                                FSBC-Direct
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="channel" id="FSBC-Distributor">
                                                <label class="form-check-label" for="FSBC-Distributor">
                                                FSBC-Distributor
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h5>GENERAL PRODUCT DESCRIPTION AND FUNCTION</h5>
                                <div id="productDescriptionDiv">
                                    <label class="form-label">Product Description <span class="fw-normal">(Form/Color/Flavor brief)</span>: </label>
                                    <div id="productDescription"></div>
                                </div>
                                <div id="usage">
                                    <label class="form-label">Usage Description <span class="fw-normal">(Application in customer)</span>: </label>
                                    <input type="text" class="form-control" id="usageDescription">
                                </div>
                                <div class="row">
                                    <div class="col" id="storage">
                                        <label class="form-label">Storage Temperature: </label>
                                        <input type="text" class="form-control" name="storageTemperature" id="storageTemperature">
                                    </div>
                                    <div class="col" id="delivery">
                                        <label class="form-label">Delivery Temperature: </label>
                                        <input type="text" class="form-control" name="deliveryTemperature" id="deliveryTemperature">
                                    </div>
                                </div>
                                <div id="certification">
                                    <label class="form-label">Certification Requirement:</label>
                                    <div class="">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="certification" id="BPOM">
                                            <label class="form-check-label" for="BPOM">
                                            BPOM
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="certification" id="HALAL">
                                            <label class="form-check-label" for="HALAL">
                                            HALAL
                                            </label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="certification" id="certificationOthers">
                                            <label class="form-check-label" for="certification3">
                                                Others
                                            </label>
                                            <input type="text" class="form-control" id="certificationText" name="certificationText">
                                        </div>
                                    </div>
                                </div>
                                <div id="competitor">
                                    <h5>Competitor's Product to Match or to Beat:</h5>
                                    <table id="competitorProduct" class="table table-striped nowrap">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>PRODUCT NAME</th>
                                                <th>SIZE</th>
                                                <th>PACKAGING</th>
                                                <th>Price Indication</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td><input type="text" class="form-control" name="productName1" id="productName1"></td>
                                                <td><input type="text" class="form-control" name="size1" id="size1"></td>
                                                <td><input type="text" class="form-control" name="packaging1" id="packaging1"></td>
                                                <td><input type="text" class="form-control" name="priceIndication1" id="priceIndication1"></td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td><input type="text" class="form-control" name="productName2" id="productName2"></td>
                                                <td><input type="text" class="form-control" name="size2" id="size2" ></td>
                                                <td><input type="text" class="form-control" name="packaging2" id="packaging2"></td>
                                                <td><input type="text" class="form-control" name="priceIndication2" id="priceIndication2"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="detailedPackaging">
                                    <h5>Detailed Packaging Required:</h5>
                                    <ol>
                                        <li>
                                            <div class="">
                                                <label for="weightProduct" class="form-label">Weight of Product (kg/carton):</label>
                                                <input type="text" class="form-control" name="weightProduct" id="weightProduct"> 
                                            </div>
                                        </li>
                                        <li>
                                            <label class="form-label">Packaging:</label>
                                            <div class="row">
                                                <div class="col form-check">
                                                    <input class="form-check-input" type="radio" name="packaging" id="ExistingPackaging">
                                                    <label class="form-check-label" for="ExistingPackaging">
                                                    Existing
                                                    </label>
                                                    <textarea class="form-control no-resize" name="ExistingPackagingText" id="ExistingPackagingText" rows="2"></textarea>
                                                </div>
                                                <div class="col form-check">
                                                    <input class="form-check-input" type="radio" name="packaging" id="NewPackaging">
                                                    <label class="form-check-label" for="NewPackaging">
                                                    New
                                                    </label>
                                                    <textarea class="form-control no-resize" name="NewPackagingText" id="NewPackagingText" rows="2"></textarea>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div>
                                                <label class="form-label">Product Variation List:</label>
                                                <div>
                                                    <input type="text" class="form-control" name="productVariation" id="productVariation">
                                                </div>
                                            </div>
                                        </li>
                                    </ol>
                                </div>
                                <div id="potential">
                                    <h5>MARKET UPDATE</h5>
                                    <ol>
                                        <li>
                                            <div class="form-chcek">
                                                <label for="potentialVolume" class="form-label">Potential Volume (Mt/Annually):</label>
                                                <input type="text" class="form-control" name="potentialVolume" id="potentialVolume"> 
                                            </div>
                                        </li>
                                        <li>
                                            <label class="form-label">Pricing Strategy</label>
                                            <div class="row">
                                                <div class="col form-check">
                                                    <label for="expectedMargin" class="form-label">Expected Margin (%):</label>
                                                    <input type="text" class="form-control" name="expectedMargin" id="expectedMargin">
                                                </div>
                                                <div class="col form-check">
                                                    <label for="priceEstimate" class="form-label">Price Estimate:</label>
                                                    <input type="text" class="form-control" name="priceEstimate" id="priceEstimate">
                                                </div>
                                            </div>
                                        </li>
                                    </ol>
                                </div>
                                <div class="">
                                    <h5>TARGET LAUNCH (as Initiator request): </h5>
                                    <input type="text" class="form-control" name="targetLaunchText"  id="targetLaunch">
                                </div>
                            </main>
                            <footer id="mpdr-footer" class="p-2 mb-1" style="border-top: 3px solid black ;">
                                <table id="approver" class="table table-striped nowrap">
                                    <thead>
                                        <tr>
                                            <th>Approved by,</th>
                                            <th class="text-center">Approved</th>
                                            <th class="text-center">Approved with Review</th>
                                            <th class="text-center">Not Approved</th>
                                            <th class="text-center">Notes/Comments</th>
                                        </tr>
                                    </thead>
                                    <tbody class="">
                                    </tbody>
                                </table>
                            </footer>
                        </div>
                        <a href="javascript:void(0)" id="print-form" class="btn btn-info no-print w-100 mb-4">Print</a>
                    </div>
                </div>
            </div>
            <div class="offcanvas offcanvas-start user-chat-box no-print" tabindex="-1" id="chat-sidebar"
                aria-labelledby="offcanvasExampleLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasExampleLabel">
                        Invoice
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas"
                        aria-label="Close"></button>
                </div>
                <div class="p-3 border-bottom">
                    <form class="position-relative">
                        <input type="search" class="form-control search-invoice ps-5" id="text-srh"
                            placeholder="Search Invoice">
                        <i
                            class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
                    </form>
                </div>
                <div class="app-invoice overflow-auto">
                    <ul id="list-form2" class="invoice-users">
                    </ul>
                </div>
            </div>
        </div>
    </div>


    @push('scripts')
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/2.2.1/js/dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/3.0.0/js/dataTables.responsive.js"></script>
        <script>
            var approverTable = $('#approver').DataTable({
                responsive: true,
                ordering: false,
                paging: false, 
                searching: false,
                info: false ,
                columnDefs: [
                    { targets: [1,2,3,4], className: 'text-center' }, 
                ]
            });
            var forms = "";
            // Ketika html sudah dimuat
            document.addEventListener('DOMContentLoaded', function() {
                function makeAllReadonly() {
                    // Menjadikan semua elemen input dan textarea readonly
                    var inputs = document.querySelectorAll('#mpdr-form input, #mpdr-form textarea');  // Pilih semua input
                    inputs.forEach(function(input) {
                        if (input.type === 'radio') {
                            if (!input.checked) {
                                input.disabled = true;  // Menonaktifkan radio button jika belum disabled
                            }
                        } else {
                            input.readOnly = true; // Setiap input dan textarea menjadi readonly
                        }
                    
                    });
                }
                makeAllReadonly();

                // fetch data form
                $.ajax({
                    url: '{{ route('mpdr.report.data') }}', // URL ke controller
                    method: 'GET',
                    success: function(response) {
                        forms = response;
                        var listForm = '';
                        response.forEach((form, index) => {
                            listForm +=
                            `<a href="javascript:void(0)"
                                class="p-3 bg-hover-light-black border-bottom d-flex align-items-start invoice-user listing-user"
                                onClick="changeForm(${index})">
                                <div
                                    class="btn btn-primary round rounded-circle d-flex align-items-center justify-content-center px-2">
                                    <i class="ti ti-folder fs-6"></i>
                                </div>
                                <div class="ms-3 d-inline-block w-75">
                                    <h6 class="mb-0 invoice-customer">${form.product_name}</h6>
                                    <span class="fs-3 invoice-id text-truncate text-body-color d-block w-85">
                                        ${form.no}
                                    </span>
                                    <span class="fs-3 invoice-date text-nowrap text-body-color d-block">
                                        ${form.new_created_at}
                                    </span>
                                </div>
                            </a>`;
                        });
                        $('#list-form').html(listForm);
                        $('#list-form2').html(listForm);
                        
                    },
                    error: function() {
                        // Jika gagal, tampilkan pesan error
                        console.log('Error ketika mengambil data form');
                        // $('#formData').html('<p>There was an error fetching the data.</p>');
                    }
                });
            });

            // Fungsi untuk menghapus data dari tampilan form
            function clearForm(){
                approverTable.clear().draw();
                $('#mpdr-form input[type="radio"]').prop('checked', false).prop('disabled', true);
                $('#mpdr-form textarea').text('');
                $('#mpdr-form text').val('');
            }

            // Fungsi untuk mengganti data pada tampilan form
            function changeForm(index){
                clearForm(); 
                var form = forms[index];

                $('#title-report').text(form.product_name);
                $('#id-report').text(form.no);

                $('#no_reg_text').text(form.no);
                    
                // Revision
                $('#revision-no').text(form.revision.no);
                $('#revision-count').text(form.revision.revision);
                $('#revision-date').text(form.revision.date);
                
                $('#productName').val(form.product_name);
                $('#levelPriority').val(form.level_priority);
                $('#initiator').val(form.initiator);

                $('#rationalForDevelopment').text(form.detail.rational_for_development);
                $('#targetLaunch').val(form.detail.target_launch);

                $(`[id="${form.category.category}"]`).prop('checked', true).prop('disabled', false);
                $('#productCategoryText').val(form.category.other);

                $(`#${form.channel.category}`).prop('checked', true).prop('disabled', false);
                $('#country').val(form.channel.country);

                $('#productDescription').html(form.description.product_description);
                $('#usageDescription').val(form.description.usage_description);
                $('#storageTemperature').val(form.description.storage_temperature);
                $('#deliveryTemperature').val(form.description.delivery_temperature);
                
                var category = form.certification.category === 'Others' ? 'certificationOthers' : form.certification.category;
                $(`#${category}`).prop('checked', true).prop('disabled', false);
                $('#certificationText').val(form.certification.other);

                // Competitor's Product
                form.competitor.forEach(function(value, index) {
                    $(`#productName${index+1}`).val(form.competitor[index].name);
                    $(`#size${index+1}`).val(form.competitor[index].size);
                    $(`#packaging${index+1}`).val(form.competitor[index].packaging);
                    $(`#priceIndication${index+1}`).val(form.competitor[index].price);
                });

                // Detailed Packaging
                $('#weightProduct').val(form.packaging.weight);
                $(`#${form.packaging.category}Packaging`).prop('checked', true).prop('disabled', false);
                $(`#${form.packaging.category}PackagingText`).text(form.packaging.detail);
                $('#productVariation').val(form.packaging.product_variation);

                
                $('#potentialVolume').val(form.market.potential_volume);
                $('#expectedMargin').val(form.market.expected_margin);
                $('#priceEstimate').val(form.market.price_estimate);
                
                form.approved_detail.forEach(function(detail, index) {
                    // Memasukan data ke table approver
                    var approvedCell = '';
                    var approvedWithReviewCell  = '';
                    var notApprovedCell = '';
                    var commentsCell = '';
                    if (detail.status !== 'pending' && detail.status !== 'vacant'){
                        var newDiv = `
                            <div class="d-flex flex-column">
                                <div>${detail.status}</div>
                                <div>${detail.approved_date}</div>
                            </div>
                        `;
                        if(detail.status === 'approve'){
                            approvedCell = newDiv;
                        }else if(detail.status === 'approve with review'){
                            approvedWithReviewCell = newDiv;
                            commentsCell = detail.comment;
                        }else if(detail.status === 'not approve'){
                            notApprovedCell = newDiv;
                            commentsCell = detail.comment;
                        }
                    }
                    approverTable.row.add([
                        detail.approver_name,
                        approvedCell ? approvedCell : '',
                        approvedWithReviewCell ? approvedWithReviewCell : '',
                        notApprovedCell ? notApprovedCell : '',
                        commentsCell ? commentsCell : ''
                    ]).draw();
                });

                // Print Button
                $('#print-form').attr('href', "{{ route('mpdr.print', ['no_reg' => '__ID__']) }}".replace('__ID__', form.no));
                $('#print-form').attr('target', '_blank');
            }
        </script>
    @endpush
</x-app-layout>
