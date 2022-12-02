<!doctype html>
<html lang="en" class="bg-gradient-to-br from-gray-800 to-gray-900 min-h-screen">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<div class=" text-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-5 text-center text-md-left ">
                   
                </div>
                <div class="col-lg-6 col-md-7 text-center text-md-right">
                    <span class="">
                        <div class="btn-group">
                           
                            @auth
                            <a href="{{ route('profile.index') }}" class="@isroute('profile.index') active @endisroute text-uppercase  font-weight-bold  text-light">{{auth()->user()->username}}</a>

                            <div class="">
                                <form class="form-inline mx-3  text-light" action="{{route('auth.signout.post')}}" method="post">
                                    {{csrf_field()}}
                                    <button class="border-0 bg-transparent  text-light" type="submit" style="text-decoration: none;">Sign Out</button>
                                </form>
                            </div>
                        </div>
                    </span>
                    @else
                    <a class="mx-3  text-light" href="{{route('auth.signin')}}">Sign In</a>
                    <a class="mx-3  text-light" href="{{route('auth.signup')}}">Sign Up</a>
                    @endauth
                </div>
            </div>
        </div>
    </div>
    @hasSection('container-fluid')
    <div class="container-fluid">
        @else
        <div class="container">
            @endif
            @include('includes.jswarning')
            <div class="mt-4">
                @yield('content')
            </div>


        </div>

</body>

</html>