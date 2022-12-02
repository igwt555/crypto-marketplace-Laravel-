@extends('master.main2')


@section('title','Sign Up')

@section('content')
<div class="row justify-content-center flex-coulmn">
    <div class="col-lg-4">

        <!-- <h2>Sign In</h2> -->
        <a href="/" >
            <img src="/img/logo.png" width="120" height="120" style="margin: auto;">
            <h5 class="text-center mt-4 archetyplogo_title text-gray-500 logo-title text-2xl">{{ config('app.name', 'New Years Market') }}</h5>
        </a>
        <p class="text-xs leading-relaxed text-center mt-2 font-mono text-gray-500">Welcome to a place dedicated to you.<br>Market. Idea exchange. A place to grow.</p>
        <div class="px-4 py-3 rounded shadow rounded-md bg-gray-800 shadow-md p-6 mt-4">
            <h3 class="text-gray-500 text-2xl text-center">Sign Up</h3>
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
                <form action="{{route('auth.signup.post')}}" method="post" class="w-75 mx-auto">
                    {{csrf_field()}}

                    <div class="form-group ">
                        <div class="flex items-center"> <label class="flex items-center" for="login-name"> <i class="gg-profile ml-1 mr-3 text-gray-600 icon-normal"></i> <span class="text-gray-400 text-sm">Enter User Name</span> </label> <a href="#login-name-info" class="ml-auto"> <i class="gg-info text-gray-600 icon-smaller"></i> </a> </div>
                        <!-- <label for="" class="text-light"><i class="fas fa-user-tie"></i> Enter User Name</label> -->
                        <input type="text" class="@if($errors->has('username')) is-invalid @endif  appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer  border-indigo-400 border-opacity-50 focus:border-2" placeholder="Username" name="username" id="username">
                        @if($errors->has('username'))
                        <p class="text-danger">{{$errors->first('username')}}</p>
                        @endif
                    </div>
                    <div class="">
                        <div class="my-1">
                            <label class="flex items-center" for="password"> <i class="gg-key ml-2 mr-6 text-gray-600"></i> <span class="text-gray-400 text-sm">Enter User Password</span> </label>
                            <!-- <label for="" class="text-light"><i class="fas fa-key"></i> Enter User Password</label> -->
                            <input type="password" class="@if($errors->has('username')) is-invalid @endif appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer border-indigo-400 border-opacity-50 focus:border-2" placeholder="Password" name="password" id="password">
                        </div>
                        <div class="my-1 mt-3">
                            <label class="flex items-center mt-2" for=""> <i class="gg-key ml-2 mr-6 text-gray-600"></i> <span class="text-gray-400 text-sm"> Enter User Confirm Password</span> </label>
                            <!-- <label for="" class="text-light"><i class="fas fa-key"></i></label> -->
                            <input type="password" class="@if($errors->has('username')) is-invalid @endif appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer  border-indigo-400 border-opacity-50 focus:border-2" placeholder="Confirm Password" name="password_confirmation" id="password_confirm">
                        </div>

                    </div>
                    @if($errors->has('password'))
                    <p class="text-danger">{{$errors->first('password')}}</p>
                    @endif
                    <!-- <div class="form-group mt-1">
                        <small class="text-muted">
                            Your private key for decrypting messages will be protected with your password. Please make
                            sure that you choose a strong one
                        </small>
                    </div> -->
                    <!-- <div class="form-group">
                        <label for="" class="text-light">Enter User Referral Code</label>
                        <div class="input-group mb-2">
                            <div class="input-group-prepend">
                                <div class="input-group-text">Referral Code</div>
                            </div>
                            <input type="text" name="refid" value="{{$refid}}" class="form-control" @if($refid !=='' ) readonly @endif>
                        </div>

                    </div> -->
                    @include('includes.captcha')
                    @if($errors->has('captcha'))
                    <p class="text-danger">{{$errors->first('captcha')}}</p>
                    @endif
                    @include('includes.flash.error')
                    
                    <!-- <div class="form-group text-center">
                        <div class="">
                            <div class="">
                                <button type="submit" class="btn btn-sm btn-outline-primary btn-block">Sign Up</button>
                            </div>
                        </div>
                    </div> -->
                    <div class="form-group text-center">
                        <h6 class="text-light text-center">or</h6>
                        <a href="{{route('auth.signin')}}" class="btn btn-sm btn-outline-light btn-block">Sign In</a>
                        <!-- <a href="{{route('auth.signin')}}" class="text-muted">Already have an account ?</a> -->
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

@stop