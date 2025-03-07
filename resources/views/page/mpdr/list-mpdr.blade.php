<x-app-layout>
    @section('title')
        List MPDR
    @endsection

    @push('css')
        <link rel="stylesheet" href="https://cdn.datatables.net/2.2.1/css/dataTables.dataTables.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/3.0.0/css/responsive.bootstrap.min.css">
    @endpush


    <div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
        <div class="card-body px-4 py-3">
            <div class="row align-items-center">
                <div class="col-9">
                    <h4 class="fw-semibold mb-8">List MPDR</h4>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a class="text-muted text-decoration-none" href="{{ route('dashboard') }}">Home</a>
                            </li>
                            <li class="breadcrumb-item" aria-current="page">List MPDR</li>
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

    <div class="d-flex justify-content-end mb-4">
        <a href=" {{ route('mpdr.create') }} " class="btn btn-outline-primary">Create New Form</a>
    </div>

    <div class="card">
        <div class="card-body">
           <div class="table-responsive">
            <table class="table table-striped table-bordered" id="mpdrTable">
                <thead class="header-item">
                    <th>No</th>
                    <th>Project Name</th>
                    <th>Status</th>
                    <th>Action</th>
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
        $('#mpdrTable').DataTable({
            processing: true,
            serverSide: false,
            ajax: {
                url: '{{ route('mpdr.form.list') }}',
                type: 'GET',
                dataSrc: function(response) {
                    return response;
                }
            },
            columns: [
                { data: 'no', name: 'no_reg' },
                { data: 'product_name', name: 'name' },
                { data: 'status', name: 'status',
                    render: function(data, type, row) {
                        if (data === 'Rejected') {
                            return '<span class="text-danger">' + data + '</span>';
                        } else if (data === 'Approved') {
                            return '<span class="text-success">' + data + '</span>';
                        } else if (data === 'In Approval'){
                            return '<span class="text-primary">' + data + '</span>';
                        }
                        return data;
                    }
                },
                { data: null, name: 'action', orderable: false, searchable: false, 
                    render: function(data, type, row) {
                        const route = "{{ route('mpdr.form', ':formId') }}";
                        const url = route.replace(':formId', row.no);
                        return `<a href="${url}" class="btn btn-outline-primary" >View Form</a>`;
                    }
                }
            ]
        });
    </script>
    @endpush
</x-app-layout>
