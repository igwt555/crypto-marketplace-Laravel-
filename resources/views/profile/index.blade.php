@extends('master.profile')

@section('page_title', 'Settings')
@section('profile-content')
@include('includes.flash.error')
@include('includes.flash.success')


<!-- <h2 class="my-3 text-3xl"><i class="fas fa-lock"></i> Settings</h2>
<hr> -->
<div class="mainOwnDiv">
    <div class="row">
        <div class="col-md-6 rounded-md bg-gray-900 px-3 py-2">
            <h3 class="mt-4"><i class="fas fa-lock"></i> Change password</h3>
            <div class="">
                <hr>
                <form action="{{ route('profile.password.change') }}" method="POST" class="justify-content-between">
                    {{ csrf_field() }}
                    <div class="my-2">
                        <label for="old_password" class="col-form-label">Old password:</label>
                        <input type="password"
                            class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2"
                            id="old_password" name="old_password" placeholder="Type the old password">
                    </div>
                    <div class="my-2">
                        <label for="new_password" class="col-form-label ">New password:</label>
                        <input type="password"
                            class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2 @error('new_password', $errors) is-invalid @enderror"
                            id="new_password" name="new_password" placeholder="Type new password">
                    </div>
                    <div class="my-2">
                        <label for="cn_password" class="col-form-label ">Confirm password:</label>
                        <input type="password"
                            class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2 @error('new_password', $errors) is-invalid @enderror"
                            id="cn_password" name="new_password_confirmation" placeholder="Confirm new password">
                    </div>
                    <div class="text-right justify-content-between">
                        <div class="col-md-9 text-left">
                            @error('new_password', $errors)
                            <p class="invalid-feedback d-block">{{ $errors -> first('new_password') }}</p>
                            @enderror
                        </div>
                    </div>
                    <div class="my-2 mt-4">
                        <button
                            class="w-full rounded-md shadow-md text-sm bg-gray-900 px-3 text-gray-400 h-10 border-indigo-400 bg-opacity-50 border-opacity-50 border-2 hover:bg-indigo-400 hover:text-white transition-colors duration-200"
                            type="submit">Change password</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-6 space-around">
            @if(\App\Marketplace\Utility\CurrencyConverter::isEnabled())
            @include('multicurrency::changeform')
            @endif
            <div class="mt-3 rounded-md bg-gray-900 px-3 py-2 pb-3">
                <h3 class="mt-4"><i class="mr-2 fa fa-key"></i>Two Factor Authentication</h3>
                <hr>
                <div class="row">
                    <div class="col-md-6">
                        <label>2-Factor Authentication:</label>
                    </div>
                    <div class="col-md-6 text-right">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <a href="{{ route('profile.2fa.change', true) }}"
                                class="btn @if(auth() -> user() -> login_2fa == true) btn-success @else btn-outline-success @endif">On</a>
                            <a href="{{ route('profile.2fa.change', 0) }}"
                                class="btn @if(auth() -> user() -> login_2fa == false) btn-danger @else btn-outline-danger @endif">Off</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row pt-3 pr-3 ">
    <div class="col-md-12 rounded-md bg-gray-900 px-3 pb-3">
        <h3 class="mt-4"><i class="mr-2 fa fa-link"></i>Referral link</h3>
        <hr>
        <input type="url" readonly
            class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2 disabled"
            value="{{ route('auth.signup', auth() -> user() -> referral_code) }}">
        <p class="text-muted">Paste this address to other users who wants to sign up on the market!</p>
    </div>
</div>

<div class="row pt-3 pr-3 ">
    <div class="col-md-12 rounded-md bg-gray-900 px-3 pb-3">
        <h3 class="mt-4"><i class="fas fa-coins mr-2"></i>Payment Addresses</h3>
        <hr>

        <div class="row">
            <div class="col-md-12">
                <form action="{{ route('profile.vendor.address') }}" method="POST">
                    {{ csrf_field() }}
                    <div class="form-row ">
                        <div class="col-md-6">
                            <input type="password"
                                class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2 appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2-lg d-flex"
                                name="address" id="address" placeholder="Place your new address(pubkey) here">
                        </div>
                        <div class="col-md-2 ">
                            <select name="coin" id="coin"
                                class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2 appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2-lg d-flex">
                                <option>Coin</option>
                                @foreach(config('coins.coin_list') as $supportedCoin => $instance)
                                <option value="{{ $supportedCoin }}">
                                    {{ \App\Address::label($supportedCoin) }}
                                </option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-4 my-2">
                            <button
                                class="w-full rounded-md shadow-md text-sm bg-gray-900 px-3 text-gray-400 h-10 border-indigo-400 bg-opacity-50 border-opacity-50 border-2 hover:bg-indigo-400 hover:text-white transition-colors duration-200">Change</button>
                        </div>
                    </div>
                </form>
                <p class="text-muted">On this address you will receive payments from purchases! Funds will be sent to
                    your most
                    recent added address of coin!</p>
                
                
                @if(auth() -> user() -> addresses -> isNotEmpty())
                <div class="bg-gray-900 rounded-md shadow-md mt-3">
                    <div class="p-1 bg-gray-800 rounded-t-md flex">
                        <div class="ml-2 text-gray-500 font-semibold sm:w-2/3">Address</div>
                        <div class="ml-2 text-gray-500 text-center w-1/4">Coin</div>
                        <div class="ml-2 text-gray-500 text-center w-1/4">Added</div>
                        <div class="ml-2 text-gray-500 w-1/4">Action</div>
                    </div>
                    @foreach(auth() -> user() -> addresses as $address)

                    <div class="p-1 flex border-gray-850 border-dashed border-b">
                        <div class="ml-2 text-gray-500 sm:w-2/3">
                            <input type="text" readonly value="{{ $address -> address }}"
                            class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2 appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2-lg d-flex form-control-sm">
                        </div>
                        <div class="ml-2 text-gray-500 text-center w-1/4"><span class="badge badge-info">{{ strtoupper($address -> coin) }}</span></div>
                        <div class="ml-2 text-gray-500 text-center w-1/4">{{ $address -> added_ago }}</div>
                        <div class="ml-2 text-gray-500 text-sm w-1/4">
                            <a href="{{ route('profile.vendor.address.remove', $address) }}" 
                            class="btn btn-danger btn-sm"><i class="fa fa-trash mr-1"></i>Remove</a></div>
                    </div>
                    @endforeach
                </div>
                @else
                <div class="alert text-center alert-warning">You addresses list is empty!</div>
                @endif
            </div>
        </div>

    </div>

</div>

@stop
