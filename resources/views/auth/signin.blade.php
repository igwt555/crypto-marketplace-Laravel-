@extends('master.main2')

@section('title','Sign in')

@section('content')

<div class="row justify-content-center flex-coulmn ">
    <div class="col-lg-4 ">

        <!-- <h2>Sign In</h2> -->
        <a href="/" >
            <img src="/img/logo.png" width="120" height="120" style="margin: auto;">
            <h5 class="text-center mt-4 archetyplogo_title text-gray-500 logo-title text-2xl">{{ config('app.name', 'New Years Market') }}</h5>
        </a>
            <p class="text-xs leading-relaxed text-center mt-2 font-mono text-gray-500">Welcome to a place dedicated to you.<br>Market. Idea exchange. A place to grow.</p>
        <div class="px-4 py-3 rounded shadow rounded-md bg-gray-800 shadow-md p-6 mt-4">
            <div class="mt-3">
                <style>
                    body {
                        font-size: 14px;
                    }

                    input::placeholder {
                        color: #000 !important;
                    }

                    .form-control,
                    .input-group-text {
                        height: 25px !important;
                    }
                </style>
                <form action="{{ route('auth.signin.post') }}" class="w-75 mx-auto" method="POST">
                    {{ csrf_field() }}

                    <div class="form-group">
                        <div class="flex items-center"> <label class="flex items-center" for="login-name"> <i class="gg-profile ml-1 mr-3 text-gray-600 icon-normal"></i> <span class="text-gray-400 text-sm">Login name</span> </label> <a href="#login-name-info" class="ml-auto"> <i class="gg-info text-gray-600 icon-smaller"></i> </a> </div>
                        <!-- <label for="" class="text-light"><i class=" gg-profile text-gray-600 icon-normal"></i> Login User Name</label> -->
                        <input type="text" class="@error('username',$errors) is-invalid @enderror appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" placeholder="Username" name="username" id="username" autofocus="">
                        @error('username',$errors)
                        <p class="text-danger">{{$errors->first('username')}}</p>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label class="flex items-center" for="password"> <i class="gg-key ml-2 mr-6 text-gray-600"></i> <span class="text-gray-400 text-sm">Password</span> </label>
                        <input type="password" class="@error('password',$errors) is-invalid @enderror appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" placeholder="Password" name="password" id="password">
                        @error('password',$errors)
                        <p class="text-danger">{{$errors->first('password')}}</p>
                        @enderror
                    </div>
                    @include('includes.captcha')

                    
                    <div class="form-group text-center">
                        <div class="my-2 text-gray-500 text-md">
                            Forgot your password?
                            <a href="/forgotpassword" class="text-light" style="text-decoration: none">Reset it here
                            </a>
                        </div>
                        <!-- <div class="">
                            <div class="">
                                <button type="submit" class="btn btn-sm btn-outline-primary btn-block">Sign In</button>
                            </div>
                        </div> -->
                    </div>
                    @include('includes.flash.error')

                    <div class="mt-6"> 
                        <div class="relative flex justify-center mb-3"> 
                            <span class="px-3 bg-gray-800 text-gray-600 text-xs z-10 relative">
                            New user?
                            </span> 
                            <div class="absolute left-0 right-0 transform -translate-y-1/2 top-1/2 h-2px bg-gray-700 z-0 bg-opacity-50"></div> 
                        </div> 
                        <a href="/signup" title="Register at Archetyp"> 
                            <button type="button" class="w-full rounded-md shadow-md text-sm bg-gray-900 px-3 text-gray-400 h-10 border-indigo-400 bg-opacity-50 border-opacity-50 border-2 hover:bg-indigo-400 hover:text-white transition-colors duration-200">
                            Create account
                            </button>
                        </a> 
                    </div>
                </form>
            </div>
        </div>

        <!-- <div class="form-group text-center">
            <a href="{{route('auth.signup')}}" class="text-muted">Does not have an account ?</a>
        </div> -->
    </div>
</div>


@stop