<!doctype html>
<html lang="en" class="bg-gradient-to-br from-gray-800 to-gray-900 min-h-screen">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/css/app.css">
    <link rel="stylesheet" href="/css/main.css">
    <link rel="stylesheet" href="/css/style.css">
    <style>
        @media screen and (max-width: 426px) {
        .nav a{
            width: 100% !important;
            margin: 10px 0;
        }
    }
    </style>
    @hasSection('title')
    <title>{{config('app.name')}} - @yield('title')</title>
    @else
    <title>{{config('app.name')}}</title>
    @endif

</head>
<body class="pb-4">
    @include('master.navbar')

    @hasSection('container-fluid')
    <div class="container-fluid">
    @else
    <div class="container">
    @endif
        @include('includes.jswarning')
        <div class="mt-2">
            @yield('content')
        </div>
    </div>

    @hasSection('javascript')
    <script
      src="https://code.jquery.com/jquery-3.6.0.min.js"
      integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
      crossorigin="anonymous"></script>
    @yield('javascript')
    @endif
</body>
</html>
