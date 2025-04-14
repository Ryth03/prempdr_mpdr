<x-app-layout>
    @section('title')
        Dashboard
    @endsection

    @push('css')
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/apexcharts@3.35.3/dist/apexcharts.min.css">
        <style>
          .text-custom-orange{
            color: orange;
          }
          .text-custom-orange:hover{
            color: blue;
          }
        </style>
    @endpush

    <!-- Breadcrumb -->
    <div class="row">
        <div class="col-lg-8 d-flex align-items-stretch">
        <div class="card w-100 bg-primary-subtle overflow-hidden shadow-none">
            <div class="card-body position-relative">
                <div class="row">
              <div class="col-sm-7">
                <div class="d-flex align-items-center mb-7">
                  <div class="rounded-circle overflow-hidden me-6">
                    @if (Auth::user()->avatar)
                        <img src="{{ asset('storage/uploads/user_avatars/' . Auth::user()->avatar) }}" alt="modernize-img" width="40" height="40">
                    @else
                        <img src="{{ asset('assets/images/profile/user-1.jpg') }}" alt="modernize-img" width="40" height="40">
                    @endif
                  </div>
                  <h5 class="fw-semibold mb-0 fs-5">Welcome,  {{ Auth::user()->name }}!</h5>
                </div>
                <div class="d-flex align-items-center">
                  <div class="border-end pe-4 border-muted border-opacity-10">
                    <h3 id="prempdr-total" class="mb-1 fw-semibold fs-8 d-flex align-content-center">0<i class="ti ti-arrow-up-right fs-5 lh-base text-success"></i>
                    </h3>
                    <p class="mb-0 text-dark">Total Pre-MPDR</p>
                  </div>
                  <div class="ps-4">
                    <h3 id="mpdr-total" class="mb-1 fw-semibold fs-8 d-flex align-content-center">0<i class="ti ti-arrow-up-right fs-5 lh-base text-success"></i>
                    </h3>
                    <p class="mb-0 text-dark">Total MPDR</p>
                  </div>
                </div>
              </div>
              <div class="col-sm-5">
                <div class="welcome-bg-img mb-n7 text-end">
                  <img src="{{ asset('assets/images/backgrounds/welcome-bg.svg') }}" alt="modernize-img" class="img-fluid">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      {{-- Ongoing Pre-MPDR --}}
      <div class="col-sm-6 col-lg-2 d-flex align-items-stretch">
        <div class="card w-100">
          <div class="card-body p-4">
            <h4 class="fw-semibold">Pre-MPDR</h4>
            <p class="mb-2 fs-3">Pending Requests</p>
            <div id="prempdr-pending"></div>
          </div>
        </div>
      </div>

      {{-- Ongoing MPDR --}}
      <div class="col-sm-6 col-lg-2 d-flex align-items-stretch">
        <div class="card w-100">
          <div class="card-body p-4">
            <h4 class="fw-semibold">MPDR</h4>
            <p class="mb-1 fs-3">Pending Requests</p>
            <div id="mpdr-pending"></div>
          </div>
        </div>
      </div>
      
      {{-- Pre mpdr & mpdr logs --}}
      <div class="row">
        {{-- Pre Mpdr Logs--}}
        <div class="col-md-6 col-lg-4 order-md-0 order-0 d-flex align-items-stretch">
          <div class="card w-100">
            <div class="card-body">
              <div class="d-sm-flex d-block align-items-center justify-content-between mb-3">
                <div class="mb-4">
                  <h4 class="card-title fw-semibold">Pre-MPDR Logs</h4>
                  <p class="card-subtitle">Track Recent Pre-MPDR Activity Logs</p>
                </div>
                <div>
                  <select class="form-select fw-semibold" id="prempdr-select-logs">
                    <option value="" disabled>Select Form</option>
                    <option value="all" selected>All</option>
                  </select>
                </div>
              </div>
              <ul id="prempdr-logs" class="timeline-widget mb-0 position-relative mb-n4 overflow-y-scroll" style="height: 300px;">
              </ul>
            </div>
          </div>
        </div>
        {{-- Mpdr Logs --}}
        <div class="col-md-6 col-lg-4 order-lg-2 order-1 d-flex align-items-stretch">
          <div class="card w-100">
            <div class="card-body">
              <div class="d-sm-flex d-block align-items-center justify-content-between mb-3">
                <div class="mb-4">
                  <h4 class="card-title fw-semibold">MPDR Logs</h4>
                  <p class="card-subtitle">Track Recent MPDR Activity Logs</p>
                </div>
                <div>
                  <select class="form-select fw-semibold" id="mpdr-select-logs">
                    <option value="" disabled>Select Form</option>
                    <option value="all" selected>All</option>
                  </select>
                </div>
              </div>
              <ul id="mpdr-logs" class="timeline-widget mb-0 position-relative mb-n4 overflow-y-scroll" style="height: 300px;">
              </ul>
            </div>
          </div>
        </div>
        {{-- Pre Mpdr chart --}}
        <div class="col-md-12 col-lg-8 order-lg-1 order-2 d-flex align-items-stretch">
          <div class="card w-100">
            <div class="card-body">
              <div class="d-sm-flex d-block align-items-center justify-content-between mb-3">
                <div class="mb-3 mb-sm-0">
                  <h4 class="card-title fw-semibold">Pre-MPDR Projects Performances</h4>
                  <p class="card-subtitle">Pre-MPDR Projects</p>
                </div>
                <div>
                  <select class="form-select fw-semibold" id="prempdr-year">
                    <option value="" disabled>Select Year</option>
                  </select>
                </div>
              </div>
              <div id="prempdr-chart"></div>
            </div>
          </div>
        </div>
        {{-- Mpdr chart --}}
        <div class="col-md-12 col-lg-8 order-3 d-flex align-items-stretch">
          <div class="card w-100">
            <div class="card-body">
              <div class="d-sm-flex d-block align-items-center justify-content-between mb-3">
                <div class="mb-3 mb-sm-0">
                  <h4 class="card-title fw-semibold">MPDR Project Performances</h4>
                  <p class="card-subtitle">MPDR Projects</p>
                </div>
                <div>
                  <select class="form-select fw-semibold" id="mpdr-year">
                    <option value="" disabled>Select Year</option>
                  </select>
                </div>
              </div>
              <div id="mpdr-chart"></div>
            </div>
          </div>
        </div>
      </div>

    </div>

    @push('scripts')
      <script src="{{ asset('assets') }}/libs/apexcharts/dist/apexcharts.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <script>
        //get total prempdr
        $.ajax({
          url: '{{ route('dashboard.prempdr.total') }}', // URL ke controller
          method: 'GET',
          success: function(response) {
            var totalDiv = document.getElementById('prempdr-total');
            totalDiv.innerText = response;
          },
          error: function() {
              // Jika gagal, tampilkan pesan error
              console.log('Error ketika mengambil mpdr total');
              // $('#formData').html('<p>There was an error fetching the data.</p>');
          }
        });
        //get total mpdr
        $.ajax({
          url: '{{ route('dashboard.mpdr.total') }}', // URL ke controller
          method: 'GET',
          success: function(response) {
            var totalDiv = document.getElementById('mpdr-total');
            totalDiv.innerText = response;
          },
          error: function() {
              // Jika gagal, tampilkan pesan error
              console.log('Error ketika mengambil mpdr total');
              // $('#formData').html('<p>There was an error fetching the data.</p>');
          }
        });

        //get pending prempdr
        $.ajax({
          url: '{{ route('dashboard.prempdr.pending') }}', // URL ke controller
          method: 'GET',
          success: function(response) {
            var totalDiv = document.getElementById('prempdr-pending');
            if(response.length != 0){
              var ul = document.createElement('ul');
              ul.classList.add('text-warning');
              // Iterasi melalui response dan buat elemen <li> untuk setiap item
              response.forEach(function(item) {
                  const route = "{{ route('prempdr.form', ':formId') }}".replace(':formId', item);
                  var li = document.createElement('li'); // Membuat elemen <li>
                  li.innerHTML= `<a href="${route}" class="text-custom-orange">${item}</a>`; // Menambahkan teks ke dalam <li>
                  ul.appendChild(li); // Menambahkan <li> ke dalam <ul>

                  // Menambahkan ke dropdown prempdr logs
                  var selectLogs = document.getElementById('prempdr-select-logs');
                  var option = document.createElement('option');
                  option.value = item;  
                  option.textContent = item;  
                  selectLogs.appendChild(option);  
              });

              // Menambahkan <ul> ke dalam div totalDiv
              totalDiv.innerHTML = ''; // Membersihkan konten sebelumnya di totalDiv
              totalDiv.appendChild(ul); // Menambahkan <ul> yang berisi <li> ke dalam div
            }else{
              totalDiv.innerHTML = `<span class="text-dark">None</span>`;
            }

            //Menjalankan fungsi logs
            changeLogs('prempdr');
          },
          error: function() {
              // Jika gagal, tampilkan pesan error
              console.log('Error ketika mengambil pending pre-mpdr');
              // $('#formData').html('<p>There was an error fetching the data.</p>');
          }
        });
        //get pending mpdr
        $.ajax({
          url: '{{ route('dashboard.mpdr.pending') }}', // URL ke controller
          method: 'GET',
          success: function(response) {
            var totalDiv = document.getElementById('mpdr-pending');
            if(response.length != 0){
              var ul = document.createElement('ul');
              ul.classList.add('text-warning');
              // Iterasi melalui response dan buat elemen <li> untuk setiap item
              response.forEach(function(item) {
                  const route = "{{ route('mpdr.form', ':formId') }}".replace(':formId', item);
                  var li = document.createElement('li'); // Membuat elemen <li>
                  li.innerHTML= `<a href="${route}" class="text-custom-orange">${item}</a>`; // Menambahkan teks ke dalam <li>
                  ul.appendChild(li); // Menambahkan <li> ke dalam <ul>

                  // Menambahkan ke dropdown mpdr logs
                  var selectLogs = document.getElementById('mpdr-select-logs');
                  var option = document.createElement('option');
                  option.value = item;  
                  option.textContent = item;  
                  selectLogs.appendChild(option); 
              });

              // Menambahkan <ul> ke dalam div totalDiv
              totalDiv.innerHTML = ''; // Membersihkan konten sebelumnya di totalDiv
              totalDiv.appendChild(ul); // Menambahkan <ul> yang berisi <li> ke dalam div
            }else{
              totalDiv.innerHTML = `<span class="text-dark">None</span>`;
            }
            
            //Menjalankan fungsi logs
            changeLogs('mpdr');
          },
          error: function() {
              // Jika gagal, tampilkan pesan error
              console.log('Error ketika mengambil pending mpdr');
              // $('#formData').html('<p>There was an error fetching the data.</p>');
          }
        });

        // Mengubah data logs sesuai yang dipilih
        document.getElementById('prempdr-select-logs').addEventListener('change', function() {
            changeLogs('prempdr');
        });
        document.getElementById('mpdr-select-logs').addEventListener('change', function() {
            changeLogs('mpdr');
        });

        // Fungsi untuk mengubah logs sesuai dropdown
        function changeLogs(formType)
        {
          // ambil value dari select
          var selectForm = document.getElementById(`${formType}-select-logs`).value;
          console.log(selectForm);
          // get logs data
          $.ajax({
              url: '{{ route('dashboard.logs') }}', // URL ke controller
              method: 'GET',
              data: {
                  formType: formType,
                  form: selectForm
              },
              success: function(response) {
                  console.log(response);
                  var logs = document.getElementById(`${formType}-logs`);
                  logs.innerHTML = '';
                  if(response.length > 0)
                  {
                    response.forEach(item => {
                      var log = item;
                      var date = new Date(log.created_at)
                      var formattedDay = date.toLocaleDateString('id-ID', {
                          month: 'short',      // Nama bulan (contoh: Januari, Februari, dll)
                          day: 'numeric',     // Tanggal (contoh: 19)
                      });
                      var formattedTime = date.toLocaleTimeString('id-ID', {
                          hour: 'numeric',    // Jam
                          minute: 'numeric',  // Menit
                          hour12: false       // Format waktu 24 jam
                      });
                      var action = log.properties.action;
                      var borderColor = action == 'approve' ? 'border-success' : 
                                        action == 'approve with review' ? 'border-warning' : 
                                        action == 'not approve' ? 'border-danger' : 
                                        action == 'created' ? 'border-primary' : 
                                        action == 'updated' ? 'border-primary-subtle' : 
                                        action == 'deleted' ? 'border-black' : 
                                        ''
                                        ;
                      var div = `
                      <li class="timeline-item d-flex position-relative overflow-hidden w-100">
                        <div class="col-4 timeline-time text-dark flex-shrink-0 text-end">${formattedDay}, ${formattedTime}</div>
                        <div class="col-1 timeline-badge-wrap d-flex flex-column align-items-center">
                          <span class="timeline-badge flex-shrink-0 my-8 border-2 border ${borderColor}"></span>
                          <span class="timeline-badge-border d-block flex-shrink-0"></span>
                        </div>
                        <div class="col-7 timeline-desc fs-3 text-dark mt-n1 fw-semibold">${log.properties.no} ${action} by ${item.user.name}</div>
                      </li>
                      `;
                      logs.innerHTML += div;
                    });
                  }
                  
                  
              },
              error: function() {
                  // Jika gagal, tampilkan pesan error
                  console.log('Error ketika mengambil prempdr logs');
                  // $('#formData').html('<p>There was an error fetching the data.</p>');
              }
          });
        }
        

        // get PreMpdr Year
        $.ajax({
            url: '{{ route('dashboard.prempdr.year') }}', // URL ke controller
            method: 'GET',
            success: function(response) {
                var selectYear = document.getElementById('prempdr-year');
                response.forEach(year => {
                  var option = document.createElement('option');
                  option.value = year;  // Nilai opsi adalah tahun
                  option.textContent = year;  // Teks yang ditampilkan adalah tahun
                  selectYear.appendChild(option);  // Menambahkan opsi ke dalam select
                });
                updatePreMpdrChartData();
            },
            error: function() {
                // Jika gagal, tampilkan pesan error
                console.log('Error ketika mengambil prempdr year');
                // $('#formData').html('<p>There was an error fetching the data.</p>');
            }
        });

        // get Mpdr Year
        $.ajax({
            url: '{{ route('dashboard.mpdr.year') }}', // URL ke controller
            method: 'GET',
            success: function(response) {
                var selectYear = document.getElementById('mpdr-year');
                response.forEach(year => {
                  var option = document.createElement('option');
                  option.value = year;  // Nilai opsi adalah tahun
                  option.textContent = year;  // Teks yang ditampilkan adalah tahun
                  selectYear.appendChild(option);  // Menambahkan opsi ke dalam select
                });
                updateMpdrChartData()
            },
            error: function() {
                // Jika gagal, tampilkan pesan error
                console.log('Error ketika mengambil mpdr year');
                // $('#formData').html('<p>There was an error fetching the data.</p>');
            }
        });


        var options = {
            chart: {
                type: 'bar',
                height: 300
            },
            series: [{
                name: "Tahun",
                data: [] // Data kosong pada awalnya
            }],
            xaxis: {
                categories: [] // Kategori kosong pada awalnya
            }
        };

        // Membuat grafik dengan data kosong
        var prempdrChart = new ApexCharts(document.getElementById("prempdr-chart"), options);
        var mpdrChart = new ApexCharts(document.getElementById("mpdr-chart"), options);
        // Menampilkan grafik
        prempdrChart.render(); 
        mpdrChart.render();
        
        // Mengubah data chart sesuai tahun yang dipilih
        document.getElementById('prempdr-year').addEventListener('change', updatePreMpdrChartData);
        document.getElementById('mpdr-year').addEventListener('change', updateMpdrChartData);

        function updatePreMpdrChartData() 
        {
            var selectedYear = document.getElementById('prempdr-year').value;
            $.ajax({
              url: '{{ route('dashboard.prempdr.chart') }}', // URL ke controller
              method: 'GET',
              data: {
                selectedYear: selectedYear
              },
              success: function(response) {
                prempdrChart.updateOptions({
                    xaxis: {
                        categories: response.categories // Mengupdate kategori (misalnya tahun)
                    }
                });
                prempdrChart.updateSeries([
                  { name: 'Created', data: response.created },
                  { name: 'Approved', data: response.approved },
                  { name: 'Rejected', data: response.rejected }
                ]);
              },
              error: function() {
                  // Jika gagal, tampilkan pesan error
                  console.log('Error ketika mengambil mpdr year');
                  // $('#formData').html('<p>There was an error fetching the data.</p>');
              }
            });
        }

        function updateMpdrChartData()
        {
            var selectedYear = document.getElementById('mpdr-year').value;
            $.ajax({
              url: '{{ route('dashboard.mpdr.chart') }}', // URL ke controller
              method: 'GET',
              data: {
                selectedYear: selectedYear
              },
              success: function(response) {
                mpdrChart.updateOptions({
                    xaxis: {
                        categories: response.categories // Mengupdate kategori (misalnya tahun)
                    }
                });
                mpdrChart.updateSeries([
                  { name: 'Created', data: response.created },
                  { name: 'Approved', data: response.approved },
                  { name: 'Rejected', data: response.rejected }
                ]);
              },
              error: function() {
                  // Jika gagal, tampilkan pesan error
                  console.log('Error ketika mengambil mpdr year');
                  // $('#formData').html('<p>There was an error fetching the data.</p>');
              }
            });
        }
      </script>
    @endpush

</x-app-layout>
