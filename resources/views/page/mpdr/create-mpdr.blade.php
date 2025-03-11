<x-app-layout>
    @section('title')
        Create MPDR
    @endsection

    @push('css')
        <link rel="stylesheet" href="https://cdn.datatables.net/2.2.1/css/dataTables.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/quill@2.0.3/dist/quill.snow.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/3.0.0/css/responsive.bootstrap.min.css">
        <style>
            .no-resize{
                resize:none;
            }
        </style>
    @endpush


    <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
        <div class="card-body px-4 py-3">
            <div class="row align-items-center">
                <div class="col-9">
                    <h4 class="fw-semibold mb-8">Create MPDR</h4>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a class="text-muted text-decoration-none" href="{{ route('dashboard') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item" aria-current="page">Create MPDR</li>
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

    <div id="content" class="w-100">
        <form id="form" action="{{ route('mpdr.store') }}" method="POST">
            @csrf
            <main id="mpdr-main" class="d-flex flex-column gap-3 p-2">
                <div class="d-flex justify-content-end">
                    <label for="projectName" class="form-label">No Reg: <span id="no_reg_text"></span></label>
                    <input type="hidden" id="no_reg" name="no_reg" value="" readonly>
                </div>
                <div class="row">
                    <div class="col-12 col-md-5">
                        <label for="productName" class="form-label">Product Name:</label>
                        <input type="text" class="form-control" name="productName" required> 
                    </div>
                    <div class="col-12 col-md-2">
                        <label for="levelPriority" class="form-label">Level Priority:</label>
                        <select class="form-select" name="levelPriority" required>
                            <option value="A">A</option>
                            <option value="B">B</option>
                            <option value="C">C</option>
                        </select>
                    </div>
                    <div class="col-12 col-md-5">
                        <label for="initiator" class="form-label">Initiator:</label>
                        <select id="initiator" name="initiator" class="form-select" required>
                            <option selected disabled value="">Select</option>
                        </select>
                    </div>
                </div>
                <div id="rational">
                    <label class="form-label">Rational For Development: </label>
                    <textarea class="form-control no-resize" name="rationalForDevelopment" id="rationalForDevelopment" rows="2" required></textarea>
                </div>
                <div class="row">
                    <div id="productCategory" class="col">
                        <label class="form-label">Product Category:</label>
                        <div class="">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="productCategory" id="productCategory1" value="Margarine" required>
                                <label class="form-check-label" for="productCategory1">
                                Margarine
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="productCategory" id="productCategory2" value="Frying Fats">
                                <label class="form-check-label" for="productCategory2">
                                Frying Fats
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="productCategory" id="productCategory3" value="Shortening">
                                <label class="form-check-label" for="productCategory3">
                                Shortening
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="productCategory" id="productCategory4" value="Pastry">
                                <label class="form-check-label" for="productCategory4">
                                Pastry
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="productCategory" id="productCategory5" value="Others">
                                <label class="form-check-label" for="productCategory5">
                                    Others
                                </label>
                                <input type="text" class="form-control" name="productCategoryText" placeholder="(Others)">
                            </div>
                        </div>
                    </div>
                    <div id="channel" class="col">
                        <label class="form-label">Channel:</label>
                        <div class="">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="channel" id="channel1" value="International" required>
                                <label class="form-check-label" for="channel1">
                                International
                                </label>
                                <input type="text" class="form-control" name="country" placeholder="Country">
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="channel" id="channel2" value="Regional">
                                <label class="form-check-label" for="channel2">
                                Regional
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="channel" id="channel3" value="Industrial">
                                <label class="form-check-label" for="channel3">
                                Industrial
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="channel" id="channel4" value="FSBC-Direct">
                                <label class="form-check-label" for="channel4">
                                FSBC-Direct
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="channel" id="channel5" value="FSBC-Distributor">
                                <label class="form-check-label" for="channel5">
                                FSBC-Distributor
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <h5>GENERAL PRODUCT DESCRIPTION AND FUNCTION</h5>
                <div id="productDescriptionDiv">
                    <label class="form-label">Product Description <span class="fw-normal">(Form/Color/Flavor brief)</span>: </label>
                    <textarea name="productDescription" id="productDescription" required></textarea>
                </div>
                <div id="usage">
                    <label class="form-label">Usage Description <span class="fw-normal">(Application in customer)</span>: </label>
                    <input type="text" class="form-control" name="usageDescription" id="usageDescription" required>
                </div>
                <div class="row">
                    <div class="col" id="storage">
                        <label class="form-label">Storage Temperature: </label>
                        <input type="text" class="form-control" name="storageTemperature" id="storageTemperature" required>
                    </div>
                    <div class="col" id="delivery">
                        <label class="form-label">Delivery Temperature: </label>
                        <input type="text" class="form-control" name="deliveryTemperature" id="deliveryTemperature" required>
                    </div>
                </div>
                <div id="certification">
                    <label class="form-label">Certification Requirement:</label>
                    <div class="">
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="certification" id="certification1" value="BPOM" required>
                            <label class="form-check-label" for="certification1">
                            BPOM
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="certification" id="certification2" value="HALAL">
                            <label class="form-check-label" for="certification2">
                            HALAL
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="certification" id="certification3" value="Others">
                            <label class="form-check-label" for="certification3">
                                Others
                            </label>
                            <input type="text" class="form-control" name="certificationText" placeholder="(Others)">
                        </div>
                    </div>
                </div>
                <div id="competitor">
                    <h5>Competitor's Product to Match or to Beat:</h5>
                    <table id="competitorProduct" class="table table-striped nowrap" style="width:100%">
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
                                <input type="number" class="form-control" name="weightProduct" id="weightProduct" required> 
                            </div>
                        </li>
                        <li>
                            <label class="form-label">Packaging:</label>
                            <div class="row">
                                <div class="form-check col">
                                    <input class="form-check-input" type="radio" name="packaging" id="existingPackaging" value="Existing" required>
                                    <label class="form-check-label" for="existingPackaging">
                                    Existing
                                    </label>
                                    <textarea class="form-control no-resize" name="ExistingPackagingText" placeholder="Details" rows="2"></textarea>
                                </div>
                                <div class="form-check col">
                                    <input class="form-check-input" type="radio" name="packaging" id="newPackaging" value="New">
                                    <label class="form-check-label" for="newPackaging">
                                    New
                                    </label>
                                    <textarea class="form-control no-resize" name="NewPackagingText" placeholder="Details" rows="2"></textarea>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div>
                                <label class="form-label">Product Variation List:</label>
                                <div>
                                    <input type="text" class="form-control" name="productVariation" id="" required>
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
                                <input type="number" class="form-control" name="potentialVolume" required> 
                            </div>
                        </li>
                        <li>
                            <label class="form-label">Pricing Strategy</label>
                            <div class="row">
                                <div class="form-check col">
                                    <label for="expectedMargin" class="form-label">Expected Margin (%):</label>
                                    <input type="text" class="form-control" name="expectedMargin" required>
                                </div>
                                <div class="form-check col">
                                    <label for="priceEstimate" class="form-label">Price Estimate:</label>
                                    <input type="text" class="form-control" name="priceEstimate" required>
                                </div>
                            </div>
                        </li>
                    </ol>
                </div>
                <div class="">
                    <h5>TARGET LAUNCH (as Initiator request): </h5>
                    <input type="text" class="form-control" name="targetLaunchText"  placeholder="End wk of January - ETD Shipment (for first trial 1 FCL-2 FCL)" required>
                </div>
            </main>

            <div class="w-100 d-flex align-items-center justify-content-center mb-5">
                <button type="submit" name="form_status" value="Draft" class="btn btn-primary me-3">Save as Draft</button>
                <button type="submit" name="form_status" value="Submit" class="btn btn-success">Submit</button>
            </div>
        </form>
    </div>

    
@push('scripts')
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tinymce/7.6.0/tinymce.min.js" integrity="sha512-/4EpSbZW47rO/cUIb0AMRs/xWwE8pyOLf8eiDWQ6sQash5RP1Cl8Zi2aqa4QEufjeqnzTK8CLZWX7J5ZjLcc1Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/2.2.1/js/dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/3.0.0/js/dataTables.responsive.js"></script>
    <script>
        // ini text editor tinymce
        tinymce.init({
            selector: '#productDescription',  // Menentukan elemen yang ingin diubah menjadi editor
            menubar: false,  // Menghilangkan menu bar jika tidak diperlukan
            plugins: 'lists link image', // Menambahkan plugin untuk daftar, tautan, dan gambar
            toolbar: 'undo redo | bold italic | alignleft aligncenter alignright | numlist bullist | link image', // Tombol toolbar yang ditampilkan
            setup: function (editor) {
                editor.on('change', function () {
                    editor.save(); // Ensure the textarea value is updated
                });
            }  
        });

        // membuat table menjadi responsive
        var table = $('#competitorProduct').DataTable({
            responsive: true,
            ordering: false,
            paging: false, 
            searching: false,
            info: false 
        });

        document.addEventListener('DOMContentLoaded', function() {
            // Mengambil no_reg yang baru
            fetch('{{ route('mpdr.noReg') }}')
                    .then(response => response.json())
                    .then(data => {
                        document.getElementById('no_reg_text').innerHTML = data.no_reg;
                        document.getElementById('no_reg').value = data.no_reg;
                    })
                    .catch(error => {
                        console.error('Error fetching no_reg:', error);
                    });
            // mengambil list approver
            $.ajax({
                url: '{{ route('mpdr.initiator.list.data') }}',
                method: 'GET',
                success: function(response) {
                    response.forEach(item => {
                        $('#initiator').append($('<option>', {
                            value: item.nik, 
                            text: item.name  
                        }));
                    });
                },
                error: function() {
                    // Jika gagal, tampilkan pesan error
                    console.log('Error ketika mengambil approver list');
                    // $('#formData').html('<p>There was an error fetching the data.</p>');
                }
            });
        });
    </script>
@endpush
</x-app-layout>
