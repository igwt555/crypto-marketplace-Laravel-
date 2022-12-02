@extends('master.main')
@section('page_title', 'Checkout')

@section('content')
    <div class="row">
        <div class="col-md-12">
            @include('includes.flash.error')

            <!-- <div class="rounded-md bg-gray-900 py-2 pb-4"> -->
                <h2 class="mb-3 mt-2 font-bold pl-3"><i class="fa fa-check mr-2"></i>Checkout ({{ $numberOfItems }})
                        <label style="float: right;" class="text-right text-light d-inline-block mr-2">Total: @include('includes.currency', ['usdValue' => $totalSum])
                        </label>
                </h2>
                
                @if(!empty($items))
                <div class="col-md-12 p-0">
                    <div class="bg-gray-900 rounded-md shadow-md mt-3 col-md-12 p-0">
                        <div class="p-1 bg-gray-800 rounded-t-md flex">
                            <div class="text-gray-500 font-semibold col-md-2">Product</div>
                            <div class="text-gray-500 col-md-1 text-center">#</div>
                            <div class="text-gray-500 text-center col-md-1">Price</div>
                            <div class="text-gray-500 text-center col-md-1 px-0">Paying with</div>
                            <div class="text-gray-500 text-center col-md-3">Payment Type & Shipping</div>
                            <div class="text-gray-500 col-md-1 text-center">total</div>
                            <div class="text-gray-500 col-md-3 text-center">Message</div>
                        </div>
                    </div>
                </div>
                @foreach($items as $productId => $item)

                <div class="p-1 flex border-gray-850 @if(!$loop->last) border-dashed border-b @endif shadow-md">
                    <div class="text-gray-500 col-md-2">
                       <a href="{{ route('product.show', $item -> offer -> product) }}">
                            <h4 class="font-bold text-dark">{{ $item -> offer -> product -> name }}</h4>
                        </a>
                    </div>
                    <div class="text-gray-500 text-center col-md-1">
                        {{ $item -> quantity }}
                    </div>
                    <div class="text-gray-500 text-center col-md-1">
                        <span class="badge badge-mblue">
                            @include('includes.currency', ['usdValue' => $item -> offer -> price])
                        </span>
                    </div>
                    <div class="text-gray-500 text-sm col-md-1 text-center">
                         <span class="badge badge-info">{{ strtoupper(\App\Purchase::coinDisplayName($item -> coin_name)) }}</span>
                    </div>
                    <div class="text-gray-500 text-sm col-md-3 text-center">
                        <span class="badge badge-primary">{{ \App\Purchase::$types[$item->type] }}</span>

                        @if($item -> shipping)
                            {{ $item -> shipping -> name }} -
                            @include('includes.currency', ['usdValue' => $item -> shipping -> price])
                        @else
                            <span class="badge badge-info">Digital delivery</span>
                        @endif
                    </div>
                    <div class="col-md-1 d-flex align-items-center justify-content-around ">
                        <span class="badge badge-mblue">
                            @include('includes.currency', ['usdValue' => $item -> value_sum])
                        </span>
                    </div>
                    <div class="text-gray-500 text-sm col-md-3 text-center">
                        @if($item -> message)
                            @if(\App\Message::messageEncrypted($item -> message))
                                <textarea class="form-control"  readonly rows="5">{{ $item -> message }}</textarea>
                            @else
                                <p class="text-muted">
                                    {{ $item -> message }}
                                </p>

                            @endif
                        @else
                            <span class="badge badge-info">No message</span>
                        @endif


                    </div>

                </div>
                @endforeach
            <!-- </div> -->
            @else
            <div class="alert text-center alert-warning col-md-12 px-4">
                <div class="col-md-12 px-3">
                    There are no itmes in your checkout!
                </div>
            </div>
            @endif

        </div>

        <div class="col-md-12 p-0 mt-3 flex justify-content-between">
            <div class="col-md-4">
                <a href="{{ route('profile.cart') }}" class="btn btn-md btn-danger">
                    <i class="fas fa-chevron-left mr-2"></i>
                    Back to cart
                </a>
            </div>
            <div class="col-md-4 text-right">
                <form action="{{ route('profile.cart.make.purchases') }}">
                    {{--<input type="hidden" name="cointype" value="btc">--}}
                    <button type="submit"  class="btn btn-mblue btn-md">
                        <i class="fas fa-shopping-cart mr-2"></i>
                        Purchase
                    </button>
                </form>
            </div>
            
        </div>


    </div>



    {{--<div class="col-md-6 mt-3 justify-content-center text-center">--}}
        {{--<form action="{{ route('profile.cart.make.purchases') }}">--}}
            {{--<input type="hidden" name="cointype" value="xmr">--}}
            {{--<button type="submit"  class="btn btn-primary btn-lg">--}}
                {{--<i class="fab fa-monero mr-2"></i>--}}
                {{--Pay with Monero Escrow--}}
            {{--</button>--}}
        {{--</form>--}}
    {{--</div>--}}

@stop