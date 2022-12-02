@extends('master.profile')

@section('title', 'Wishlist')
@section('page_title', 'Wishlist')

@section('profile-content')
    @include('includes.flash.success')
    @include('includes.flash.error')

    <h2 class="mb-3"><i class="fas fa-heart mr-2"></i> Wishlist</h2>
    <hr>

    @if(auth() -> user() -> whishes -> isNotEmpty())
        <div class="card-columns">
            @foreach(auth() -> user() -> whishes() ->orderByDesc('created_at') -> get() as $whish)
                @include('includes.product.card', ['product' => $whish -> product])
            @endforeach
        </div>
    @else
        <div class="alert alert-warning">Your wishlist of products is empty!</div>
    @endif

@stop