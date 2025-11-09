<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="{{ asset('favicon.ico')}}" type="image/x-icon">

    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.0/dist/sweetalert2.min.css">


    @vite(['resources/css/app.css', 'resources/js/app.js'])

    <title>SIGEEO- Login</title>
</head>
<body  class="login" style="background: url('../images/fundo.jpeg') no-repeat center center; background-size: cover;">


    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        
                        @yield('content')

                    </div>
                </div>
            </main>
        </div>
    </div>
    
<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>

</html>
