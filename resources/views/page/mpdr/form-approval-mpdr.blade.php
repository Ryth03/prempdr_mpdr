<x-app-layout>
    @section('title')
        Form Approval MPDR
    @endsection

    @push('css')
        <link rel="stylesheet" href="https://cdn.datatables.net/2.2.1/css/dataTables.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/3.0.0/css/responsive.bootstrap.min.css">
        <style>
            @media print {
                body {
                    zoom: 0.6; /* Mengubah skala menjadi 80% */
                    margin: 0px;
                }
                .no-print{
                    display: none;
                }
            }

        </style>
    @endpush


    <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
        <div class="card-body px-4 py-3">
            <div class="row align-items-center">
                <div class="col-9">
                    <h4 class="fw-semibold mb-8">Form Approval MPDR</h4>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a class="text-muted text-decoration-none" href="{{ route('dashboard') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item" aria-current="page">Form Approval MPDR</li>
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

    <div id="content" class="border border-4 border-black w-100">
        <header class="row">
            <div class="col-3">
                <img src="{{ asset('assets') }}/images/logos/logoputih.png" class="dark-logo img-fluid p-0" alt="Logo-Dark">
                <img src="{{ asset('assets') }}/images/logos/logohitam.png" class="light-logo img-fluid p-0" alt="Logo-light">
            </div>
            <div class="col-5 fw-bold border-start border-end border-3 border-black text-center d-flex flex-column justify-content-center align-items-center">
                <h4>MARKETING</h4>
                <h4>PRODUCT DEVELOPMENT REQUEST</h4>
            </div>
            <div class="col-3 d-flex flex-column justify-content-between">
                    <p>No : F/S.1.4-01</p>
                    <p>Revision : 1</p>
                    <p>Date : 29 September 2015</p>
            </div>
        </header>

        <main class="d-flex flex-column gap-3 border-top border-4 border-black p-2">
            <div class="">
                <label for="productName" class="form-label">Product Name (complete):</label>
                <input type="text" class="form-control" name="productName"> 
            </div>
            <div class="">
                <label for="levelPriority" class="form-label">Level Priority:</label>
                <input type="text" class="form-control" name="levelPriority"> 
            </div>
            <div class="">
                <label for="initiator" class="form-label">Initiator:</label>
                <input type="text" class="form-control" name="initiator"> 
            </div>
            <div id="type" class="" >
                <label class="form-label">Type of Request: </label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="typeOfRequest" id="typeOfRequest1" checked>
                    <label class="form-check-label" for="typeOfRequest1">
                    NEW PRODUCT
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="typeOfRequest" id="typeOfRequest2">
                    <label class="form-check-label" for="typeOfRequest2">
                    EXISTING PRODUCT
                    </label>
                </div>
            </div>
            <div id="rational">
                <label class="form-label">Rational For Development: </label>
                <div class="text-decoration-underline link-offset-3">Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur eum maiores officiis quo voluptatem deleniti beatae modi optio consequuntur, voluptatum ratione dolore esse neque adipisci reiciendis sed, ipsum distinctio delectus!</div>
            </div>
            <div id="productCategory">
                <label class="form-label">Product Category:</label>
                <div class="">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="productCategory" id="productCategory1" checked>
                        <label class="form-check-label" for="productCategory1">
                        Margarine
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="productCategory" id="productCategory2">
                        <label class="form-check-label" for="productCategory2">
                        Frying Fats
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="productCategory" id="productCategory3">
                        <label class="form-check-label" for="productCategory3">
                        Shortening
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="productCategory" id="productCategory4">
                        <label class="form-check-label" for="productCategory4">
                        Pastry
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="productCategory" id="productCategory5">
                        <label class="form-check-label" for="productCategory5">
                            Others
                        </label>
                        <input type="text" class="form-control" name="productCategoryText" placeholder="(Others)">
                    </div>
                </div>
            </div>
            <div id="channel">
                <label class="form-label">Channel Destination:</label>
                <div class="">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="channel" id="channel1" checked>
                        <label class="form-check-label" for="channel1">
                        International
                        </label>
                        <input type="text" class="form-control" name="country" placeholder="Country">
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="channel" id="channel2">
                        <label class="form-check-label" for="channel2">
                        Regional
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="channel" id="channel3">
                        <label class="form-check-label" for="channel3">
                        Industrial
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="channel" id="channel4">
                        <label class="form-check-label" for="channel4">
                        FSBC-Direct
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="channel" id="channel5">
                        <label class="form-check-label" for="channel5">
                        FSBC-Distributor
                        </label>
                    </div>
                </div>
            </div>
            <h5>GENERAL PRODUCT DESCRIPTION AND FUNCTION</h5>
            <div id="productDescription">
                <label class="form-label">Product Description <span class="fw-normal">(Form/Color/Flavor/Packaging brief brief)</span>: </label>
                <div class="text-decoration-underline link-offset-3">Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur eum maiores officiis quo voluptatem deleniti beatae modi optio consequuntur, voluptatum ratione dolore esse neque adipisci reiciendis sed, ipsum distinctio delectus!</div>
            </div>
            <div class="">
                <label for="storageTemperature" class="form-label">Storage Temperature:</label>
                <input type="text" class="form-control ms-2" name="storageTemperature"> 
            </div>
            <div class="">
                <label for="deliveryTemperature" class="form-label">Delivery Temperature:</label>
                <input type="text" class="form-control ms-2" name="deliveryTemperature"> 
            </div>
            <div id="usage">
                <label class="form-label">Usage Description <span class="fw-normal">(Application in customer)</span>: </label>
                <div class="text-decoration-underline link-offset-3">Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequatur eum maiores officiis quo voluptatem deleniti beatae modi optio consequuntur, voluptatum ratione dolore esse neque adipisci reiciendis sed, ipsum distinctio delectus!</div>
            </div>
            <div id="certification">
                <label class="form-label">Certification Requirement:</label>
                <div class="">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="certification" id="certification1"  checked>
                        <label class="form-check-label" for="certification1">
                        BPOM
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="certification" id="certification2">
                        <label class="form-check-label" for="certification2">
                        HALAL
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="certification" id="certification3">
                        <label class="form-check-label" for="certification3">
                            Others
                        </label>
                        <input type="text" class="form-control" name="certificationText" placeholder="(Others)">
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
                            <td><input type="text" class="form-control" name="productName1" id="" placeholder="Product Name"></td>
                            <td><input type="text" class="form-control" name="size1" id=""></td>
                            <td><input type="text" class="form-control" name="packaging1" id=""></td>
                            <td><input type="text" class="form-control" name="priceIndication1" id=""></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><input type="text" class="form-control" name="productName2" id="" placeholder="Product Name"></td>
                            <td><input type="text" class="form-control" name="size2" id="" ></td>
                            <td><input type="text" class="form-control" name="packaging2" id=""></td>
                            <td><input type="text" class="form-control" name="priceIndication2" id=""></td>
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
                            <input type="text" class="form-control" name="weightProduct"> 
                        </div>
                    </li>
                    <li>
                        <label class="form-label">Inner Packaging:</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="packaging" id="existingPackaging" checked>
                            <label class="form-check-label" for="existing">
                            Existing
                            </label>
                            <input type="text" class="form-control" name="existingPackagingText" placeholder="Details">
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="packaging" id="newPackaging">
                            <label class="form-check-label" for="newPackaging">
                            New
                            </label>
                            <input type="text" class="form-control" name="newPackagingText" placeholder="Details">
                        </div>
                    </li>
                    <li>
                        <div>
                            <label class="form-label">Product Variation List:</label>
                            <div>
                                <input type="text" class="form-control" name="productVariation" id="">
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
                            <input type="text" class="form-control" name="potentialVolume"> 
                        </div>
                    </li>
                    <li>
                        <label class="form-label">Pricing Strategy</label>
                        <div class="form-check">
                            <label for="expectedMargin" class="form-label">Expected Margin (%):</label>
                            <input type="text" class="form-control" name="expectedMargin">
                        </div>
                        <div class="form-check">
                            <label for="priceEstimate" class="form-label">Price Estimate:</label>
                            <input type="text" class="form-control" name="priceEstimate">
                        </div>
                    </li>
                </ol>
            </div>
            <div class="">
                <h5>TARGET LAUNCH: </h5>
                <input type="text" class="form-control" name="targetLaunchText"  placeholder="End wk of January - ETD Shipment (for first trial 1 FCL-2 FCL)">
            </div>
        </main>

        <footer class="border-top border-3 border-black mt-2">
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
                    <tr>
                        <td>Ass. Product Manager</td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                    </tr>
                    <tr>
                        <td>Marketing Manager</td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                    </tr>
                    <tr>
                        <td>S&amp;M Dept. Head</td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                    </tr>
                    <tr>
                        <td>R&amp;D Manager</td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                    </tr>
                    <tr>
                        <td>QMHSE Dept. Head</td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                    </tr>
                    <tr>
                        <td>Halal Coordinator</td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                    </tr>
                    <tr>
                        <td>Mfg Dept. Head</td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                    </tr>
                    <tr>
                        <td>Purchasing Manager</td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                    </tr>
                    <tr>
                        <td>PPIC Manager</td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                    </tr>
                    <tr>
                        <td>SCM Dept. Head</td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                    </tr>
                    <tr>
                        <td>F &amp; A Dept. Head</td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                    </tr>
                    <tr>
                        <td>General Manager [as Mfg Dept. Head]</td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                    </tr>
                </tbody>
            </table>
        </footer>

        <form id="form" method="POST" class="w-full">
            <div id="aprove/reject" class="d-flex flex-column align-items-center">
                <input type="hidden" name="formId" value="">
                <textarea name="comment" id="comment" class="m-2 form-control rounded-lg w-100 border border-3" style="max-width:450px; resize: none;" rows="5" placeholder="Tulis komentar disini..."></textarea>
                <div id="textarea-warning" class="d-none fw-bold text-danger">Tolong isi kolom komentar.</div>
                <div class="w-full flex" style="justify-content: space-evenly;">
                    <div class="flex sm:!flex-row flex-col mt-2">
                        <input type="hidden" name="action" id="action" value="">
                        <button type="button" name="action" value="approve" class="m-2 px-4 py-2 btn btn-outline-success" onclick="submitForm('approve')">
                            Approve
                        </button>
                        <button type="button" name="action" value="approve" class="m-2 px-4 py-2 btn btn-outline-warning" onclick="validateForm('approve')">
                            Approve with Review
                        </button>
                        <button type="button" name="action" value="reject" class="m-2 px-4 py-2 btn btn-outline-danger" onclick="validateForm('reject')">
                            Not Approved
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>

@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/2.2.1/js/dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/3.0.0/js/dataTables.responsive.js"></script>
    <script>
        var table = $('#competitorProduct').DataTable({
            responsive: true,
            ordering: false,
            paging: false, 
            searching: false,
            info: false 
        });
        
        var table = $('#approver').DataTable({
            responsive: true,
            ordering: false,
            paging: false, 
            searching: false,
            info: false 
        });

        function submitForm(value) {
            // SweetAlert2 confirmation dialog for submit action
            const input = document.getElementById('action')
            input.value = value;
            Swal.fire({
                title: value === 'approve' ? "Do you want to approve?" : "Do you want to reject?",
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#26D639',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes!',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    $("#form").submit();
                }
            });
        }

        function validateForm(type) {
            var comment = document.getElementById('comment').value.trim();
            var warning = document.getElementById('textarea-warning');
            if (comment === '') {
                warning.classList.remove('d-none'); 
            }else{
                warning.classList.add('d-none'); 
                // submitForm(type);
            }
        }

        function makeAllReadonly() {
            // Menjadikan semua elemen input dan textarea readonly
            var inputs = document.querySelectorAll('input');  // Pilih semua input
            console.log('test', inputs);
            inputs.forEach(function(input) {
                if (input.type === 'radio') {
                    if (!input.checked) {
                        console.log('Menonaktifkan radio button:', input);
                        input.disabled = true;  // Menonaktifkan radio button jika belum disabled
                    }
                } else {
                    input.readOnly = true; // Setiap input dan textarea menjadi readonly
                }
            
            });
        }
        makeAllReadonly();
    </script>
@endpush

</x-app-layout>