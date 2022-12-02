@extends('master.confirmation')

@section('confirmation-title', 'Exchange Conform')
@section('page_title', 'Exchange Confirm')

@section('confirmation-content')
	<div class="alert text-center alert-warning">This action can't be undone! Confirm that you want to exchange 
        @vendor
        <label class="text-warning text-center">${{$balance}} USD 
            &nbsp; TO {{strtoupper($coin)}}
        </label>
        @else
        <label class="text-warning text-center">{{$balance}} {{strtoupper($coin)}} 
            &nbsp; TO USD
        </label>
        @endif
    </div>
    
    
@endsection

@section('confirmation-back', route('profile.exchange'))
@section('confirmation-next', route('profile.exchange.submit',['coin' => base64_encode($coin), 'balance' => base64_encode($balance)]))