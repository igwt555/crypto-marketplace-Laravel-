@extends('master.profile')
@section('page_title', 'Deposit')

@section('profile-content')
    @include('includes.flash.error')
    @include('includes.flash.success')

    <div class="rounded-md bg-gray-900 px-3 py-2">
        <h1 class="my-3 text-2xl">
            <i class="mr-2  far fa-money-bill-alt"></i>
            Deposit
        </h1>

        <h3 class="mt-2">Generate Deposit Address</h3>
        <div class="row mt-2">
            <div class="col-md-12">
                <form action="{{ route('profile.deposit.getAddress') }}" method="POST">
                    {{ csrf_field() }}
                    <div class="form-row">
                        
                        <div class="col-md-6">
                            <select name="coin" id="coin" class="w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer  border-indigo-400 border-opacity-50 focus:border-2 form-control-md d-flex" value="xmr"
                            >
                                <!-- <option>Coin</option> -->
                                @foreach($coins as $coin)
                                    <option value="{{ $coin }}" @if ($coin===$selectedCoin) selected @endif>{{ \App\Address::label($coin) }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6 ">
                            <button class="w-full rounded-md shadow-md text-sm bg-gray-900 px-3 text-gray-400 h-10 border-indigo-400 bg-opacity-50 border-opacity-50 border-2 hover:bg-indigo-400 hover:text-white transition-colors duration-200">Generate Address</button>
                        </div>

                        @foreach($coins as $coin)

                        <div class="col-md-12 mt-4 deposit-address {{$coin}}-deposit-address" @if ($coin!==$selectedCoin) style="display:none" @endif>
                            <input type="text" class="form-control form-control-md d-flex" name="address" id="address" placeholder="Here will be the address to deposit to" readonly
                            value="@if(!empty($recent[$coin])){{$recent[$coin]->address}}@endif">
                        </div>

                        @endforeach
                    </div>
                </form>
                <br>
                <p class="text-muted">Once you click the "GENERATE" button, you will get an address to deposit to. On this address you will receive the coins from the deposit! Funds will be charged to your account!</p>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 p-0">
                <h3 class="mt-4 col-md-12 text-2xl"><i class="fa fa-history mr-2"></i>Deposit History
                    <!-- <button style="float: right;" class="btn  btn-outline-danger"><i class="fa fa-trash"></i></button> -->
                    <a href="{{route('profile.deposit')}}" class="mr-2 btn btn-outline-success" style="float: right;"><i class="fa fa-refresh">&#xf021;</i></a>
                </h3>
                @if(!empty($history))
                <div class="bg-gray-900 rounded-md shadow-md mt-3">
                    <div class="p-1 bg-gray-800 rounded-t-md flex">
                        <div class="text-gray-500 font-semibold col-md-3">Date</div>
                        <div class="text-gray-500 text-left col-md-6">Address</div>
                        <div class="text-gray-500 text-center col-md-1">Coin</div>
                        <div class="text-gray-500 text-right col-md-2">Amount</div>
                        <!--<div class="text-gray-500 text-center col-md-2">Action</div>-->
                    </div>
                    @foreach($history as $coin => $deposits)
                    @foreach($deposits as $key => $deposit)

                    <div class="p-1 flex border-gray-850 @if(!$loop->last) border-dashed border-b @endif">
                        <div class="text-gray-500 col-md-3">{{$deposit->updated_at}}</div>
                        <div class="text-gray-500 text-left col-md-6">
                            <input type="text" readonly class="form-control form-control-sm d-flex" value="{{$deposit->displayAddress()}}" />
                        </div>
                        <div class="text-gray-500 text-center col-md-1">
                            <span class="badge badge-info">{{strtoupper($deposit->coin)}}</span>
                        </div>
                        <div class="text-gray-500 text-sm text-right col-md-2">
                            {{ number_format($deposit->balance, 8) }}
                        </div>
                        <!--<div class="text-gray-500 text-sm text-center col-md-2">
                            @if($deposit->balance > 0 && $deposit->status == 0)
                            <a href="{{ route('profile.deposit.add', $deposit->id) }}" class="btn btn-primary btn-md"><i class="fa fa-plus mr-1"></i>Deposit</a>
                            @endif
                        </div>-->
                    </div>
                    @endforeach
                    <!--
                    <div class="mt-3 ml-2">
                        {{ $deposits->links() }}
                    </div>
                    -->
                    @endforeach
                </div>
                @else
                <div class="alert text-center alert-warning">Your Deposit history is empty!</div>
                @endif
            </div>
        </div>
    </div>
@stop
