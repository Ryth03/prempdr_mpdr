<x-app-layout>
    @section('title')
        Approver MPDR
    @endsection

    @push('css')
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <style>
        .sortable-item {
            padding: 10px;
            border: 1px solid #ddd;
            margin-bottom: 5px;
            background: #f4f4f4;
            cursor: pointer;
        }
    </style>
    @endpush

    <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
        <div class="card-body px-4 py-3">
            <div class="row align-items-center">
                <div class="col-9">
                    <h4 class="fw-semibold mb-8">Approver MPDR</h4>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a class="text-muted text-decoration-none" href="{{ route('dashboard') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item" aria-current="page">Approver PREMPDR</li>
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


    <div class="container">
    
        <h2>Drag and Drop Approver</h2>

        <div class="mb-3 d-flex ">
            <div class="me-2">
                <select class="form-select fw-semibold" id="approver-list">
                    @php
                    $names = ["Arief Setiawan", "Maya Sari Dewi", "Rudi Pratama", "Indah Lestari", "Dika Mahendra Putra",
                        "Siti Nurjanah", "Junaidi Firmansyah", "Liana Anggraini", "Wahyu Prasetya Wijaya", "Rina Anggraeni Sari"];
                    @endphp
                    @foreach($names as $name)
                    <option value="{{$name}}">{{$name}}</option>
                    @endforeach
                </select>
            </div>
            <button class="btn btn-outline-success" onClick="addItem()">
                Add
                <i class="ti ti-plus"></i>
            </button>
        </div>

        <ul id="sortable"></ul>
    </div>

    @push('scripts')
    <!-- Sortable.js from CDNJS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.15.0/Sortable.min.js"></script>
    <script>
        function addItem(){
            var div = document.getElementById('sortable');
            var selectElement = document.getElementById('approver');
            var selectedIndex = selectElement.selectedIndex;
            var selectedValue = selectElement.value;
            if(selectedValue<1){
                return;
            }

            var randomProfileNumber = Math.floor(Math.random() * 10) + 1;
            div.innerHTML += `
                <li class="row bg-primary-subtle sortable-item rounded-2"> 
                    <div class="col-sm-9 d-flex align-items-center">
                        <img src="http://127.0.0.1:8000/assets/images/profile/user-${randomProfileNumber}.jpg" class="rounded-circle me-2" width="35" height="35" alt="modernize-img">
                        <h6 class="mb-0">${selectedValue}</h6>
                    </div>
                    <div class="col-sm-3">
                        <div class="d-flex align-items-center justify-content-end ms-auto">
                            <select class="form-select fw-semibold" id="approver">
                                <option value="active" class="text-success">Active</option>
                                <option value="vacant" class="text-danger">Vacant</option>
                            </select>
                            <button aria-label="Remove Approver" class="btn btn-outline-warning" onClick="deleteItem(this,'${selectedValue}')">
                                <i class="ti ti-trash"></i>
                            </button>
                        </div>
                    </div>
                </li>
            `;
            
            if (selectedIndex !== -1) {
                // Menghapus opsi yang dipilih
                selectElement.remove(selectedIndex);
            }
        }

        function deleteItem(button, name){
            var selectElement = document.getElementById('approver');
            var newOption = document.createElement('option');
            newOption.value = name;  // Nilai yang ingin dimasukkan
            newOption.textContent = name;  // Teks yang akan ditampilkan
            selectElement.appendChild(newOption);
            button.parentNode.parentNode.parentNode.remove();
        }

        document.addEventListener('DOMContentLoaded', function () {
            var el = document.getElementById('sortable');
            var sortable = new Sortable(el, {
                animation: 150,
                onEnd(evt) {
                    let order = [];
                    // Ambil urutan baru item setelah di drag-and-drop
                    el.querySelectorAll('.sortable-item').forEach((item, index) => {
                        order.push(item.dataset.id);
                    });
                    // Kirim data urutan item ke server (misalnya dengan AJAX)
                    // updateOrder(order);
                }
            });
            addItem(); addItem(); addItem();
        });

        // function updateOrder(order) {
        //     fetch('/update-order', {
        //         method: 'POST',
        //         headers: {
        //             'Content-Type': 'application/json',
        //             'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
        //         },
        //         body: JSON.stringify({ order: order })
        //     });
        // }

        document.addEventListener('DOMContentLoaded', function() {
            // Mengambil no_reg yang baru
            fetch('{{ route('prempdr.noReg') }}')
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
                url: '{{ route('prempdr.approver.list.data') }}',
                method: 'GET',
                success: function(response) {
                    response.forEach(item => {
                        $('#initiator').append($('<option>', {
                            value: item.nik, 
                            text: item.name  
                        }));
                        $('#salesManager').append($('<option>', {
                            value: item.nik, 
                            text: item.name  
                        }));
                        $('#marketingManager').append($('<option>', {
                            value: item.nik,
                            text: item.name 
                        }));
                        $('#deptHead').append($('<option>', {
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
