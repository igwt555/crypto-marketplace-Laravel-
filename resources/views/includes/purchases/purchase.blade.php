@extends('master.profile')

@section('title')
    @yield('purchase-title')
@stop

@section('page_title', 'Purchase Detail')
@section('profile-content')

    <div class="row mb-3">
        <div class="col-md-12">
            @include('includes.flash.success')
            @include('includes.flash.error')
            @include('includes.validation')
            <header class="flex items-center mb-1"> 
                <i class="fas fa-briefcase mr-2"></i>
                @yield('purchase-title') - @include('includes.currency', ['usdValue' => $purchase -> value_sum ])
            </header>
            <p class="text-gray-500">Created {{ $purchase -> timeDiff() }} - {{ $purchase -> created_at }}</p>
        </div>

    </div>

    @if($purchase->status_notification !== null)
        <div class="row">
            <div class="col">
                <div class="alert alert-danger">
                    {{$purchase->status_notification}}
                </div>
            </div>
        </div>
    @endif
    <div class="row">
        @include('includes.purchases.components.offer')
        @include('includes.purchases.components.delivery')
    </div>
    <div class="row">
        @include('includes.purchases.components.message')
        @include('includes.purchases.components.payment')
    </div>
    <div class="row">
        @include('includes.purchases.components.feedback')
    </div>
    <div class="row">
        @include('includes.purchases.components.dispute')
    </div>


@stop