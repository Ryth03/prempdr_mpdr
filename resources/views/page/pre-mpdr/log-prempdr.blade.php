<x-app-layout>
    @section('title')
        Log Pre MPDR
    @endsection

    @push('css')
        <link rel="stylesheet" href="https://cdn.datatables.net/2.2.1/css/dataTables.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/3.0.0/css/responsive.bootstrap.min.css">
    @endpush


    <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
        <div class="card-body px-4 py-3">
            <div class="row align-items-center">
                <div class="col-9">
                    <h4 class="fw-semibold mb-8">Log Pre MPDR</h4>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a class="text-muted text-decoration-none" href="{{ route('dashboard') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item" aria-current="page">Log Pre MPDR</li>
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

    <div class="card">
        <div class="card-body">
           <div class="table-responsive">
            <table class="table table-striped table-bordered" id="prempdrTable">
                <thead class="header-item">
                    <th>No</th>
                    <th>Form</th>
                    <th>Action</th>
                    <th>Description</th>
                </thead>
                <tbody>
                </tbody>
            </table>
           </div>
        </div>
    </div>

    @push('scripts')
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.datatables.net/2.2.1/js/dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/responsive/3.0.0/js/dataTables.responsive.js"></script>
        <script>
            $('#prempdrTable').DataTable({
                processing: true,
                serverSide: false,
                ajax: {
                    url: '{{ route('logs.data') }}',
                    type: 'GET',
                    data : {
                        form: 'prempdr'
                    },
                    dataSrc: function(response) {
                        return response;
                    }
                },
                columns: [
                    { data: null, name: 'no' ,
                        render: function(data, type, row, meta) {
                            return meta.row +1;
                        }
                    },
                    { data: null, name: 'form' ,
                        render: function(data, type, row) {
                            // console.log();
                            return row.properties.no;
                        }
                    },
                    { data: 'event', name: 'action'},
                    { data: 'description', name: 'description'}
                ]
            });
        </script>
    @endpush
</x-app-layout>
