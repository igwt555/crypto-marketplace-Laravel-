@extends('master.main')

@section('title', $category -> name . ' category')
@section('page_title', 'Category')

@section('content')
<div class="row">
    <div class="col-md-3">
        @include('includes.categories')
    </div>
    <div class="col-md-9 rounded-md bg-gray-900 px-3 py-2">
        <div class="p-3">
            <div class="row">
                <h1 class="col-md-11 text-light"><i class="fas fa-shopping-cart mr-2"></i>{{ $category -> name}}
                    <small>- category</small>
                </h1>
                <div class="col-md-1 text-lg-right">
                    @include('includes.viewpicker')
                </div>
            </div>
            <hr>

            @if($productsView == 'list')
            @foreach($products as $product)
            @include('includes.product.row', ['product' => $product])
            @endforeach
            @else
            @foreach($products->chunk(3) as $chunks)
            <div class="row mt-3">
                @foreach($chunks as $product)
                <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 my-md-0 my-2 col-12 mb-2">
                    @include('includes.product.card', ['product' => $product])
                </div>
                @endforeach
            </div>
            @endforeach
            @endif

            {{ $products -> links('includes.paginate') }}
        </div>
    </div>

</div>

@stop