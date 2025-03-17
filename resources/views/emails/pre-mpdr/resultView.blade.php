<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PreMPDR - Approval Comment</title>
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
            <div id="message">
                <p>Window ini akan tertutup dalam <span id="countdown" class="text-warning">5</span> detik.</p>
            </div> 
        </div>
        
        <div>
            @if($result == 'Success')
                <p class="text-info">Pre-MPDR Form {{$form_no}} successfully {{$status}}!</p>
            @elseif($result == 'Failed')
                <p class="text-danger">Pre-MPDR Form {{$form_no}} failed to {{$status}}.</p>
            @else
                <p class="text-warning">You have already {{$status}} form {{$form_no}} previously.</p>
            @endif
        </div>   
    </div>
    <script>
        window.onload = function() {
            // Set waktu countdown
            var timeLeft = 5;
            var countdownElement = document.getElementById('countdown');
            
            // Update setiap 1 detik
            var interval = setInterval(function() {
                // Kurangi waktu setiap detik
                timeLeft--;

                // Update teks countdown
                countdownElement.textContent = timeLeft;

                // Jika waktu habis (0), tutup jendela
                if (timeLeft < 0) {
                    clearInterval(interval); // Hentikan interval
                    window.close(); // Tutup jendela
                }
            }, 1000); // 1000 ms = 1 detik
        };
    </script>
</body>
</html>
