<x-app-layout>
    @section('title')
        Log Pre MPDR
    @endsection

    @push('css')
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
                    <th>Name</th>
                    <th>Action</th>
                </thead>
                <tbody>
                    @for($i=1; $i < 3; $i++)
                        <tr>
                            <td>{{$i}}</td>
                            <td>Form {{$i}}</td>
                            <td>Edit Form... (4 October)</td>
                        </tr>
                    @endfor
                </tbody>
            </table>
           </div>
        </div>
    </div>
</x-app-layout>
