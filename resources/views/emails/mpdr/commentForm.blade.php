<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mpdr - Approval Comment</title>
    <link rel="stylesheet" href="{{ asset('assets') }}/src/css/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #d7dbe2;
            font-family: 'Arial', sans-serif;
        }
        .container {
            width: 100%;
            max-width: 600px;
            background: #03132b;
            color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .header img {
            width: 120px;
        }
        .header small {
            float: right;
            color: #888;
        }
        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }
        .form-group textarea {
            width: 100%;
            height: 150px;
            padding: 12px 20px;
            box-sizing: border-box;
            border: 2px solid #ccc;
            border-radius: 4px;
            background-color: #f8f8f8;
            resize: none;
        }

    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <a href="javascript:void(0)">
                <img src="{{ asset('assets') }}/images/logos/logohitam.png" alt="Logo" width="200">
            </a>
            <small>{{ now()->format('Y-m-d H:i:s') }}</small>
            @if(isset($form_no))
            <div class="fs-16 mt-5">Mpdr No Registration : {{ $form_no }}</div>
            @endif
        </div>
        <form action="{{ route('mpdr.comment', ['form_no' => $form_no, 'approver_nik' => $approver_nik, 'status' => $status, 'token' => $token]) }}" method="POST" style="margin-top: 20px;">
            @csrf
            <div class="form-group">
                <label for="comment">Comment @if($route_name == 'approveWithReview') Approve With Review @elseif($route_name == 'notApprove') Not Approve @endif :</label>
                <textarea class="text-black" name="comment" id="comment" required></textarea>
            </div>
            <button type="submit" class="btn btn-success" style="float: right; background-color: green; color: white;">Submit</button>
        </form>
    </div>
</body>
</html>
