@extends('master.profile')

@section('page_title', 'Exchange')
@section('profile-content')

    @include('includes.flash.error')
    @include('includes.flash.success')

    @vendor
    @include('includes.profile.exchange.vendor')
    @else
    @include('includes.profile.exchange.buyer')
    @endvendor

    <!-- <hr> -->
    <h3 class="mt-4 col-md-12 "><i class="fa fa-history mr-2"></i>Exchange History</h3>

    @if($history -> isNotEmpty())
    <div class="bg-gray-900 rounded-md shadow-md mt-3" style="overflow-x: auto;">
        <div class="p-1 bg-gray-800 rounded-t-md flex">
            <div class="ml-2 text-gray-500 font-semibold col-md-3">Date</div>
            <div class="ml-2 text-gray-500 text-left col-md-3">From</div>
            <div class="ml-2 text-gray-500 text-left col-md-3">To</div>
            <div class="ml-2 text-gray-500 col-md-3 text-left">Fee</div>
        </div>
        @foreach($history as $key => $exchange)

        <div class="p-1 flex border-gray-850 @if(!$loop->last) border-dashed border-b @endif">
            <div class="ml-2 text-gray-500 col-md-3">
                {{$exchange->created_at}}
            </div>
            <div class="ml-2 text-gray-500 text-left col-md-3">
                <span class="badge badge-warning">
                    @vendor $ @endvendor{{$exchange->from_amount}} {{strtoupper($exchange->from_currency)}}
                </span>
            </div>
            <div class="ml-2 text-gray-500 text-left col-md-3">
                <span class="badge badge-success">
                    @vendor 
                    @else
                    $
                    @endvendor
                    {{$exchange->to_amount}} {{strtoupper($exchange->to_currency)}}
                </span>
            </div>
            <div class="ml-2 text-gray-500 text-sm col-md-3 text-left">
                <span class="badge badge-danger">-
                    @vendor 
                    @else
                    $
                    @endvendor
                    {{$exchange->fee}}
                </span>
            </div>
        </div>
        @endforeach

        <!-- <hr> -->
        <div class="mt-3 mb-3 pb-3 ml-2 flex" style="justify-content:center;">
            {{ $history -> links() }}
        </div>

    </div>
    @else
    <div class="alert text-center alert-warning">Your exchange history is empty!</div>
    @endif
@stop