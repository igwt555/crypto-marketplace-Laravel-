@extends('master.profile')

@section('title', 'Purchases')
@section('page_title', 'Sales')

@section('profile-content')
    @include('includes.flash.success')
    @include('includes.flash.error')

    <div class="rounded-md bg-gray-900 px-3 py-4">
        <h1 class="mb-3 text-2xl"><i class="fas fa-receipt mr-2"></i>Sales</h1>

        <ul class="nav nav-tabs nav-fill mb-3">
            <li class="nav-item">
                <a class="nav-link @if(!array_key_exists($state, \App\Purchase::$states)) active @endif" href="{{ route('profile.sales') }}">
                    All ({{ auth() -> user() -> vendor -> salesCount() }})
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link @if($state == 'purchased') active @endif" href="{{ route('profile.sales', 'purchased') }}">
                    Purchased ({{ auth() -> user() -> vendor -> salesCount('purchased') }})
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link @if($state == 'sent') active @endif" href="{{ route('profile.sales', 'sent') }}">
                    Sent ({{ auth() -> user() -> vendor -> salesCount('sent') }})
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link @if($state == 'delivered') active @endif" href="{{ route('profile.sales', 'delivered') }}">
                    Delivered ({{ auth() -> user() -> vendor -> salesCount('delivered') }})
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link @if($state == 'disputed') active @endif" href="{{ route('profile.sales', 'disputed') }}">
                    Disputed ({{ auth() -> user() -> vendor -> salesCount('disputed') }})
                </a>
            </li>
        </ul>

        <div class="row">
            
            @if($sales -> isNotEmpty())
            <div class="bg-gray-900 rounded-md shadow-md mt-1 col-md-12 p-0">
                <div class="p-1 bg-gray-800 rounded-t-md flex">
                    <div class="ml-2 text-gray-500 font-semibold col-md-3">Product</div>
                    <div class="ml-2 text-gray-500 text-left col-md-1">Quantity</div>
                    <div class="ml-2 text-gray-500 text-center col-md-1">Buyer</div>
                    <div class="ml-2 text-gray-500 col-md-2">Shipping</div>
                    <div class="ml-2 text-gray-500 text-center col-md-1">Total</div>
                    <div class="ml-2 text-gray-500 col-md-4 text-center">ID</div>
                </div>
                @foreach($sales as $purchase)

                <div class="p-1 flex border-gray-850 @if(!$loop->last) border-dashed border-b @endif">
                    <div class="ml-2 text-light col-md-3 ">
                        <a href="{{ route('product.show', $purchase -> offer -> product) }}" class="text-light">{{ $purchase -> offer -> product -> name }}</a>
                        @if($purchase -> isDisputed() && $purchase -> dispute -> isResolved())
                            <span class="badge badge-success">resolved</span>
                        @endif
                    </div>
                    <div class="ml-2 text-gray-500 text-center col-md-1">{{ $purchase -> quantity }}</div>
                    <div class="ml-2 text-gray-500 text-right col-md-1">
                        @if($purchase -> buyer)
                        {{ $purchase -> buyer -> username }}
                        @else
                            <span class="text-muted">User deleted account!</span>
                        @endif
                    </div>
                    <div class="ml-2 text-gray-500 text-sm col-md-1">
                        @if($purchase -> shipping)
                            <p class="text-muted text-sm-center">{{ $purchase -> shipping -> name }} - @include('includes.currency', ['usdValue' => $purchase -> shipping -> price])</p>
                        @else
                            <span class="badge badge-info">Digital delivery</span>
                        @endif
                    </div>
                    <div class="ml-2 text-gray-500 text-right text-sm col-md-2">
                        <span class="badge badge-mblue">@include('includes.currency', ['usdValue' => $purchase -> value_sum])</span>
                    </div>
                    <div class="ml-2 text-gray-500 text-sm text-right col-md-3">
                        <a href="{{ route('profile.sales.single', $purchase) }}" class="btn btn-sm {{ $purchase -> isCanceled() ? 'btn-danger' : 'btn-primary' }}" style="float: right;">
                            @if($purchase->isCanceled()) <em>Canceled</em> @else {{ $purchase -> short_id }} @endif
                        </a>

                    </div>
                </div>
                @endforeach

                <div class="mt-3 col-md-12 flex py-3 pb-5" style="justify-content: center;">
                    {{ $sales -> links() }}
                </div>

            </div>
            @else
            <div class="alert text-center alert-warning">Your Sales list is empty!</div>
            @endif
        </div>
        
    </div>
@stop