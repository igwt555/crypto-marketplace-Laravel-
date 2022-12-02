<div class="row mt-4 mb-2">
    <div class="col">
        <h4><i class="fas fa-shopping-cart mr-2"></i>Featured Products</h4>
    </div>
</div>
<div class="row">
    @if($featuredProducts > 0)
    @foreach($featuredProducts as $product)
        <div class="col-md-4 my-md-0 my-2 col-12">
            @include('includes.product.card', ['product' => $product])
        </div>
    @endforeach
    @endif
</div>