@extends('master.profile')

@section('title', 'Purchases')
@section('page_title', 'Purchases')

@section('profile-content')
@include('includes.flash.success')
@include('includes.flash.error')
<div class="rounded-md bg-gray-900 px-3 py-3">
    <h1 class="mb-3"><i class="fas fa-shopping-cart mr-2"></i>Purchases</h1>
    <hr>
    <ul class="nav nav-tabs nav-fill mb-3">
        <li class="nav-item">
            <a class="nav-link @if(!array_key_exists($state, \App\Purchase::$states)) active @endif"
                href="{{ route('profile.purchases') }}">
                All ({{ auth() -> user() -> purchasesCount() }})
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link @if($state == 'purchased') active @endif"
                href="{{ route('profile.purchases', 'purchased') }}">
                Purchased ({{ auth() -> user() -> purchasesCount('purchased') }})
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link @if($state == 'sent') active @endif" href="{{ route('profile.purchases', 'sent') }}">
                Sent ({{ auth() -> user() -> purchasesCount('sent') }})
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link @if($state == 'delivered') active @endif"
                href="{{ route('profile.purchases', 'delivered') }}">
                Delivered ({{ auth() -> user() -> purchasesCount('delivered') }})
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link @if($state == 'disputed') active @endif"
                href="{{ route('profile.purchases', 'disputed') }}">
                Disputed ({{ auth() -> user() -> purchasesCount('disputed') }})
            </a>
        </li>
    </ul>


    @if($purchases -> isNotEmpty())
    <div class="bg-gray-900 rounded-md shadow-md mt-3">
        <div class="p-1 bg-gray-800 rounded-t-md flex">
            <div class="ml-2 text-gray-500 font-semibold col-md-3">Product</div>
            <div class="ml-2 text-gray-500 text-left col-md-1">Quantity</div>
            <div class="ml-2 text-gray-500 text-center col-md-1">Price</div>
            <div class="ml-2 text-gray-500 col-md-2">Shipping</div>
            <div class="ml-2 text-gray-500 text-center col-md-1">Total</div>
            <div class="ml-2 text-gray-500 col-md-4 text-center">ID</div>
        </div>
        @foreach($purchases as $purchase)

        <div class="p-1 flex border-gray-850 border-dashed border-b">
            <div class="ml-2 text-gray-500 col-md-3">
                <a class="text-dark" 
                    href="{{ route('product.show', $purchase -> offer -> product) }}">{{ $purchase -> offer -> product -> name }}</a>
                <br>by
                <a class="text-light" 
                    href="{{ route('vendor.show', $purchase -> vendor) }}">{{ $purchase -> vendor -> user -> username }}</a>
                @if($purchase -> isDisputed() && $purchase -> dispute -> isResolved())
                <span class="badge badge-success">resolved</span>
                @endif
            </div>
            <div class="ml-2 text-gray-500 text-center col-md-1">{{ $purchase -> quantity }}</div>
            <div class="ml-2 text-gray-500 text-right col-md-1">
                <span class="badge badge-mblue">@include('includes.currency', ['usdValue' => $purchase -> offer -> price
                    ])</span>
            </div>
            <div class="ml-2 text-gray-500 text-sm col-md-1">
                @if($purchase -> shipping)
                <p class="text-muted text-sm-center">{{ $purchase -> shipping -> name }} -
                    {{ $purchase -> shipping -> price }} $</p>
                @else
                <span class="badge badge-info">Digital delivery</span>
                @endif
            </div>
            <div class="ml-2 text-gray-500 text-sm col-md-2">
                <span class="badge badge-mblue"  style="float: right;">@include('includes.currency', ['usdValue' => $purchase -> value_sum
                    ])</span>
            </div>
            <div class="ml-2 text-gray-500 text-sm col-md-3">
                <a href="{{ route('profile.purchases.single', $purchase) }}" 
                    class="btn btn-sm {{ $purchase -> isCanceled() ? 'btn-danger' : 'btn-mblue' }} mt-1"
                    style="float: right;">@if($purchase->isCanceled()) <em>Canceled</em> @else
                    {{ $purchase -> short_id }} @endif</a>

            </div>
        </div>
        @endforeach
        {{ $purchases -> links('includes.paginate') }}

    </div>
    @else
    <div class="alert text-center alert-warning">Your purchase list is empty!</div>
    @endif



</div>
@stop