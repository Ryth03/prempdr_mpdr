<x-app-layout>
    @section('title')
        Users
    @endsection

    @push('css')
        <link rel="stylesheet" href="{{ asset('assets/libs/select2/dist/css/select2.min.css') }}">
        <link rel="stylesheet" href="{{ asset('assets') }}/libs/datatables.net-bs5/css/dataTables.bootstrap5.min.css">

        <style>
            .select2-container {
                z-index: 9999 !important;
            }
        </style>
    @endpush
    <div class="font-weight-medium shadow-none position-relative overflow-hidden mb-7">
        <div class="card-body px-0">
            <div class="d-flex justify-content-between align-items-center">
                    <h1 class="font-weight-medium mb-0 ml-3">List Users</h1>
                    <nav aria-label="breadcrumb mr-3">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a class="text-muted text-decoration-none" href="{{ route('dashboard') }}">Home
                                </a>
                            </li>
                            <li class="breadcrumb-item text-muted" aria-current="page">Users</li>
                        </ol>
                    </nav>
            </div>
        </div>
    </div>

    <div class="">
            <div class="row">
                <div
                    class="col-md-12 col-xl-12 text-end d-flex justify-content-md-end justify-content-center mt-3 mt-md-0 mb-3">
                    <button type="button" class="btn mb-1 bg-primary text-white px-4 fs-4 hover:bg-primary-dark"
                        data-bs-toggle="modal" data-bs-target="#addContactModal">
                        <i class="ti ti-users text-white me-1 fs-5"></i> Add User
                    </button>
                </div>
            </div>

        <div class="card">
            <div class="card-body">
               <div class="table-responsive overflow-hidden">
                <table class="table table-striped table-bordered" id="userTable">
                    <thead class="header-item">
                        <th>No</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Position</th>
                        <th>Section</th>
                        <th>Status</th>
                        <th>Role</th>
                        <th>Action</th>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
               </div>
            </div>
        </div>
    </div>

    <!-- Modal Add User -->
    <div class="modal fade" id="addContactModal" tabindex="-1" role="dialog" aria-labelledby="addContactModalTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable modal-lg">
            <div class="modal-content">
                <div class="modal-header modal-colored-header bg-primary text-white">
                    <h5 class="modal-title text-white">Add User</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="{{ route('users.store') }}" method="POST">
                        @csrf
                        <div class="box">
                            <div class="content">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="tb-fname"
                                                    placeholder="Enter Name here" name="name" required>
                                                <label for="tb-fname">Name</label>
                                            </div>
                                            <span class="validation-text text-danger"></span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <div class="form-floating mb-3">
                                                <input type="email" class="form-control" id="tb-email"
                                                    placeholder="Email" name="email" autocomplete="on" required>
                                                <label for="tb-email">Email</label>
                                            </div>
                                            <span class="validation-text text-danger"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <div class="form-floating mb-3">
                                                <input type="text" class="form-control" id="tb-nik"
                                                    placeholder="NIK" name="nik" autocomplete="on" maxlength="6" required>
                                                <label for="tb-nik">NIK</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <select id="add_user_department" name="department_id" class="form-select" required>
                                                <option value="" disabled selected>Select Department</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <select id="add_user_position" name="position_id" class="form-select" required>
                                                <option value="" disabled selected>Select Position</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <select id="add_user_section" name="section_id" class="form-select" required>
                                                <option value="" disabled selected>Select Section</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <input type="password" name="password" class="form-control"
                                                placeholder="Password" minlength="8" maxlength="20" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <select id="add_user_role" name="roles[]" class="form-select select2" multiple required>
                                                <option value="" disabled>Select Role</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3 contact-status">
                                            <select name="status" class="form-select" required>
                                                <option value="" disabled selected>Select Status</option>
                                                @foreach (["Active", "Vacant"] as $status)
                                                    <option value="{{ $status }}">{{ $status }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                            <div class="d-flex gap-6 m-0">
                                <button type="submit" class="btn btn-success">Add</button>
                                <button class="btn bg-danger-subtle text-danger" data-bs-dismiss="modal"> Close
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Edit User -->
    <div id="editModalDiv">
    </div>

    @push('scripts')
    <script src="{{ asset('assets/libs/select2/dist/js/select2.full.min.js') }}"></script>
    <script src="{{ asset('assets/libs/select2/dist/js/select2.min.js') }}"></script>
    <script src="{{ asset('assets') }}/libs/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="{{ asset('assets') }}/js/datatable/datatable-basic.init.js"></script>
    <script>
        var departments;
        var positions;
        var sections;
        var roles;
        var users;
        document.addEventListener('DOMContentLoaded', function() {
            $('.select2').select2(); 
            // Initialize DataTable dengan ajax
            var table = $('#userTable').DataTable({
                dom: 'Bfrtip',
                buttons: [
                    'copy', 'csv', 'excel', 'pdf', 'print'
                ],
                ajax: {
                    url: '{{ route('get.users.data') }}',
                    type: 'GET',
                    dataSrc: function(response) {
                        departments = response.departments;
                        positions = response.positions;
                        sections = response.sections;
                        roles = response.roles;
                        users = response.users;
                        response.departments.forEach(function(department) {
                            $('#add_user_department').append(
                                `<option value="${department.id}">${department.name}</option>`
                            );
                        });
                        response.positions.forEach(function(position) {
                            $('#add_user_position').append(
                                `<option value="${position.id}">${position.name}</option>`
                            );
                        });
                        response.roles.forEach(function(role) {
                            $('#add_user_role').append(
                                `<option value="${role}">${role}</option>`
                            );
                        });
                        response.sections.forEach(function(section) {
                            $('#add_user_section').append(
                                `<option value="${section.id}">${section.name}</option>`
                            );
                        });
                        return response.users;
                    }
                },
                columns: [
                    { 
                        data: null,
                        render: function(data, type, row, meta) {
                            // Menambahkan nomor urut
                            return meta.row + 1; // meta.row berisi index baris
                        }
                    },
                    { data: 'name', name: 'name' },
                    { data: 'email', name: 'email' },
                    { data: 'department.name', name: 'department' },
                    { data: 'position.name', name: 'position' },
                    { data: 'section.name', name: 'section' },
                    { data: 'status', name: 'status' },
                    { data: 'roles', name: 'role',
                        render: function(data, type, row) {
                            var roleHtml = '';
                            // Iterasi melalui data roles
                            data.forEach(function(role) {
                                roleHtml += '<h6 class="badge bg-primary">' + role.name + '</h6>';
                            });
                            return roleHtml;
                        }
                    },
                    { data: 'action', name: 'action', orderable: false, searchable: false,
                        render: function(data, type, row, meta) {
                            var id = row.id;
                            var deleteUrl = "{{ route('users.destroy', ':id') }}".replace(':id', id); 
                            return `
                            <div class="d-flex action-btn">
                                <a href="javascript:void(0)" class="text-primary edit" onClick="openEditModal(${meta.row})">
                                    <i class="ti ti-eye fs-5"></i>
                                </a>
                                <form id="delete-form-${id}" action="${deleteUrl}" method="POST" style="display: inline;">
                                    @csrf
                                    @method('DELETE')
                                    <a href="javascript:void(0)" class="text-dark delete ms-2"
                                        data-user-id="${id}" onClick="confirmUserDelete(this)">
                                        <i class="ti ti-trash fs-5"></i>
                                    </a>
                                </form>
                            </div>
                            `;  
                        }
                    }
                ]
            });
        });


        // Function to initialize modal event listeners
        function initializeModalListeners() {
            document.querySelectorAll('.delete').forEach(function(element) {
                element.addEventListener('click', function() {
                    var userId = this.getAttribute('data-user-id');
                    Swal.fire({
                        title: 'Are you sure?',
                        text: "You won't be able to revert this!",
                        icon: 'warning',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Yes, delete it!'
                    }).then((result) => {
                        if (result.isConfirmed) {
                            document.getElementById('delete-form-' + userId).submit();
                        }
                    });
                });
            });
        }

        // Function untuk buat/buka modal
        function openEditModal(id){
            var modal = document.getElementById(`editContactModal${id}`);
            if (modal){
                modalBootstrap = new bootstrap.Modal(modal);
                modalBootstrap.show();
                return;
            }
            var modalDiv = document.getElementById('editModalDiv');
            var newEditModal = '';
            var user = users[id];
                var updateUrl = "{{ route('users.update', ':id') }}".replace(':id', user.id); 
                newEditModal += `
                    <div class="modal fade" id="editContactModal${id}" tabindex="-1" role="dialog"
                        aria-labelledby="editContactModalTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-scrollable modal-lg">
                            <div class="modal-content">
                                <div class="modal-header modal-colored-header bg-primary text-white">
                                    <h5 class="modal-title text-white">Edit User</h5>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="${updateUrl}" method="POST">
                                    @csrf
                                    @method('PUT')
                                        <div class="add-contact-box">
                                            <div class="add-contact-content">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="mb-3 contact-name">
                                                            <input type="text" name="name" class="form-control"
                                                                placeholder="Name" value="${user.name}">
                                                            <span class="validation-text text-danger"></span>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3 contact-email">
                                                            <input type="email" name="email" class="form-control"
                                                                placeholder="Email" value="${user.email}">
                                                            <span class="validation-text text-danger"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="mb-3 contact-nik">
                                                            <input type="text" name="nik" class="form-control"
                                                                placeholder="NIK" value="${user.nik}">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3 contact-department">
                                                            <select name="department_id" class="form-control">
                                                                <option value="">Select Department</option>
                                                                `;
                                                                departments.forEach(function(department){
                                                                    newEditModal +=`
                                                                    <option value="${department.id}" ${user.department_id == department.id ? 'selected' : ''}>
                                                                        ${department.name}
                                                                    </option>
                                                                    `;
                                                                });
                                                                newEditModal += `
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="mb-3 contact-position">
                                                            <select name="position_id" class="form-control">
                                                                <option value="">Select Position</option>
                                                                `;
                                                                positions.forEach(function(position){
                                                                    newEditModal +=`
                                                                    <option value="${position.id}" ${user.position_id == position.id ? 'selected' : ''}>
                                                                        ${position.name}
                                                                    </option>
                                                                    `;
                                                                });
                                                                newEditModal += `
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3 contact-section">
                                                            <select name="section_id" class="form-select">
                                                                <option value="">Select Section</option>
                                                                `;
                                                                sections.forEach(function(section){
                                                                    newEditModal +=`
                                                                    <option value="${section.id}" ${user.section_id == section.id ? 'selected' : ''}>
                                                                        ${section.name}
                                                                    </option>
                                                                    `;
                                                                });
                                                                newEditModal += `
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3 contact-password">
                                                            <input type="password" name="password" class="form-control"
                                                                placeholder="Password">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3 contact-role">
                                                            <select name="roles[]" class="form-select select2" multiple required>
                                                                <option value="">Select Role</option>
                                                                `;
                                                                roles.forEach(function(role){
                                                                    const isSelected = user.roles.some(function(userRole) {
                                                                        return userRole.name === role; // Cek apakah nama role cocok dengan role user
                                                                    });
                                                                    newEditModal += `
                                                                        <option value="${role}" ${isSelected ? 'selected' : ''}>
                                                                            ${role}
                                                                        </option>
                                                                    `;
                                                                });
                                                                newEditModal += `
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="mb-3 contact-status">
                                                            <select name="status" class="form-select">
                                                                <option value="" disabled selected>Select Status</option>
                                                                `;
                                                                ["Active", "Vacant"].forEach(function(status){
                                                                    newEditModal += `
                                                                        <option value="${status}" ${user.status == status ? 'selected' : ''}>
                                                                            ${status}
                                                                        </option>
                                                                    `;
                                                                });
                                                                newEditModal += `
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <div class="d-flex gap-6 m-0">
                                                <button type="submit" class="btn btn-success">Update</button>
                                                <button class="btn bg-danger-subtle text-danger" data-bs-dismiss="modal"> Close
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                `;

                modalDiv.innerHTML += newEditModal;
                $('.select2').select2();
                modal = document.getElementById(`editContactModal${id}`);
                modalBootstrap = new bootstrap.Modal(modal);
                modalBootstrap.show();
        }

        // Function untuk konfirmasi delete user
        function confirmUserDelete(button){
            var userId = button.getAttribute('data-user-id');
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    document.getElementById('delete-form-' + userId).submit();
                }
            });
        }
    </script>
@endpush
</x-app-layout>
