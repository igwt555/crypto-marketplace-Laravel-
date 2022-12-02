@extends('master.main')
@section('page_title', 'Cart')

@section('content')
    <div class="row">
        <div class="col-md-8">
            <h2 class="mb-3 font-bold"><i class="fas fa-shopping-cart mr-2"></i>Cart ({{ $numberOfItems }})</h2>
        </div>
        <div class="col-md-4 text-right">
            <a href="{{ route('profile.cart.clear') }}" class="btn btn-sm btn-danger">
                <i class="fas fa-trash-alt mr-2"></i>
                Clear
            </a>
        </div>

        @if(!empty($items))
        <div class="col-md-12">
            @include('includes.flash.error')
            @include('includes.flash.success')


            <div class="bg-gray-900 rounded-md shadow-md mt-3 col-md-12 p-0">
                <div class="p-1 bg-gray-800 rounded-t-md flex">
                    <div class="text-gray-500 font-semibold col-md-2">Product name</div>
                    <div class="text-gray-500 text-left col-md-1">{{ \App\Marketplace\Utility\CurrencyConverter::getSymbol(\App\Marketplace\Utility\CurrencyConverter::getLocalCurrency()) }} per item</div>
                    <div class="text-gray-500 text-center col-md-1">Coin</div>
                    <div class="text-gray-500 col-md-1 text-right">Amount</div>
                    <div class="text-gray-500 text-center col-md-2">Delivery/Payment</div>
                    <div class="text-gray-500 col-md-3 text-center">Message</div>
                    <div class="text-gray-500 col-md-2 text-center">Action</div>
                </div>
                

            </div>
  
        </div>

        @foreach($items as $productId => $item)
        <div class="col-md-12 ">
            
            <form action="{{ route('profile.cart.add', \App\Product::find($productId)) }}" method="POST" class="col-md-12 p-0">
                {{ csrf_field() }}

                <div class="p-1 flex border-gray-850 border-dashed border-b  shadow-md">
                    <div class="text-gray-500 col-md-2">
                       <a href="{{ route('product.show', $item -> offer -> product) }}">
                            <h4 class="font-bold text-light">{{ $item -> offer -> product -> name }}</h4>
                        </a>
                        by
                        <a class="badge badge-warning" href="{{ route('vendor.show', $item -> offer -> product -> user) }}">
                            {{ $item -> vendor -> user -> username }}
                        </a>
                    </div>
                    <div class="text-gray-500 text-center col-md-1">
                        <span class="badge badge-primary">
                            @include('includes.currency', ['usdValue' => $item -> offer -> price])
                        </span>
                    </div>
                    <div class="text-gray-500 text-center col-md-1">
                        @if(count($item -> offer -> product -> getCoins()) > 1)
                        <select name="coin" id="coin" class="w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2 form-control-sm">
                            @foreach($item -> offer -> product -> getCoins() as $coin)
                                <option value="{{ $coin }}" {{ $coin == $item -> coin_name ? 'selected' : ''}} >{{ strtoupper(\App\Purchase::coinDisplayName($coin)) }}</option>
                            @endforeach
                        </select>
                        @elseif(count($item -> offer -> product -> getCoins()) == 1)
                            <input type="hidden" class="w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" name="coin" value="{{ $item -> offer -> product -> getCoins()[0] }}">
                            <input type="text" value="{{ strtoupper(\App\Purchase::coinDisplayName($item -> offer -> product -> getCoins()[0])) }}" class="w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2 form-control-sm disabled" disabled>
                        @endif
                    </div>
                    <div class="text-gray-500 text-sm col-md-1 text-right">
                        <input type="number" class="rounded-md  form-control cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2 form-control-sm" name="amount" id="amount" min="1" max="{{ $item -> offer -> product -> quantity }}" placeholder="Quantity" value="{{ $item -> quantity }}"/>
                    </div>
                    <div class="text-gray-500 text-sm col-md-2 text-center">
                        @if($item -> offer -> product -> isPhysical())
                        <select name="delivery" id="delivery" class="form-control form-control-sm">
                            @foreach($item -> offer -> product -> specificProduct() -> shippings as $shipping)
                                <option value="{{ $shipping -> id }}" @if($shipping -> id == $item -> shipping -> id) selected @endif>{{ $shipping -> long_name }}</option>
                            @endforeach
                        </select>
                        @else
                        <span class="badge badge-success">Digital delivery</span>
                        @endif
                            <br>
                        @if(count($item -> offer -> product -> getTypes()) > 1)
                        <select name="type" id="type" class="rounded-md bg-gray-700 px-3 text-gray-400 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2 form-control-sm">
                            @foreach($item -> offer -> product -> getTypes() as $type)
                                <option value="{{ $type }}" {{ $type == $item -> type ? 'selected' : ''}} >{{ \App\Purchase::$types[$type] }}</option>
                            @endforeach
                        </select>
                        @elseif(count($item -> offer -> product -> getTypes()) == 1)
                            <input type="hidden" class="w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2 form-control-sm" name="type" value="{{ $item -> offer -> product -> getTypes()[0] }}">
                            <input type="text" class="w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2 form-control-sm" value="{{ \App\Purchase::$types[$item -> offer -> product -> getTypes()[0]]  }}" class="form-control form-control-sm disabled" disabled>
                        @endif
                    </div>
                    <div class="text-gray-500 text-sm col-md-3 text-right">
                        <textarea name="message" id="message" rows="3" placeholder="Message will be encrypted with vendor's PGP key. Click on edit to save message!" style="resize: 0" class="col-md-12 rounded-md shadow-md bg-gray-700 px-3 text-gray-400 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2 form-control form-control-sm">{{ $item -> message }}</textarea>

                    </div>

                    <div class="col-md-2 d-flex align-items-center justify-content-around ">
                        <button type="submit" class="btn btn-outline-primary">
                            <i class="far fa-edit mr-2"></i>
                            Edit
                        </button>
                        <a href="{{ route('profile.cart.remove', $productId) }}" class="btn btn-outline-danger">
                            <i class="fas fa-minus-circle"></i>
                        </a>
                    </div>
                </div>
            </form>
        </div>
        @endforeach
  
        @else
        <div class="alert text-center alert-warning col-md-12 px-4">
            <div class="col-md-12 px-3">
                There are no itmes in your cart!
            </div>
        </div>
        @endif

        <div class="col-md-12 py-2 justify-content-end">
            <div class="row">
                <div class="col-md-6">
                    <h4 class="m-0 text-light font-bold">Total sum: @include('includes.currency', ['usdValue' => $totalSum])</h4>
                </div>
                <div class="col-md-6 text-right">
                    <a href="{{ route('profile.cart.checkout') }}" class="btn ml-auto btn-md btn-mblue">
                        <i class="fas fa-cart-arrow-down mr-2"></i>
                        Checkout
                    </a>
                </div>
            </div>

        </div>
    </div>

@stop