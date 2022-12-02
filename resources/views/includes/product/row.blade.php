<div class="row my-2 mb-2 rounded-md bg-gray-800 shadow-lg px-2 py-2">

    <div class="col-md-3 col-sm-4 col-12 pl-0">
        <img class="rounded img-thumbnail mw-100" src="{{ asset('storage/'  . $product -> frontImage() -> image) }}"
             alt="{{ $product -> name }}">
    </div>

    <div class="col-md-9 col-sm-8 col-12">
        <div class="row pb-2 mb-2 border-bottom border-light">
            <div class="col-md-8">
                <a href="{{ route('product.show', $product) }}"><h3 class="mb-0 text-white leading-tight font-mono font-bold">{{ $product -> name }}</h3></a>
            </div>
            <div class="col-md-4">
                <h5 class="mb-0 text-right text-xs">Posted by <a href="{{ route('vendor.show', $product -> user) }}"
                                             class="text-white leading-tight mt-1">{{ $product -> user -> username }}</a></h5>
            </div>
        </div>

        <div class="row">
            <div class="col-md-7" style="display: flex;flex-direction: column; justify-content: space-between;">
                <div>From: <strong class="text-light">@include('includes.currency', ['usdValue' => $product -> price_from ])</strong></div>
                <div>
                    <span class="mr-2">Category:</span>
                    @foreach($product -> category -> parents() as $ancestor)
                        <a href="{{ route('category.show', $ancestor) }}" class="text-white leading-tight mt-1">{{ $ancestor -> name }}</a>
                        <i class="fas fa-chevron-right"></i>
                    @endforeach
                    <a href="{{ route('category.show', $product -> category) }}" class="text-white leading-tight mt-1">{{ $product -> category -> name }}</a>
                </div>
                <div>
                    <span class="badge badge-warning">{{ ucfirst($product -> type) }}</span> 
                </div>
                <div>
                    <strong>{{ $product -> quantity }}</strong> left | <strong>{{ $product -> orders }}</strong>sold
                </div>
                <div class="flex items-center mt-2 ml-2 mr-2">
                    <div class="flex mb-2" title="Rating: 4.92"> 
                        <i class="gg-pill icon-small text-indigo-400 mb-1 mr-1"></i>
                        <i class="gg-pill icon-small text-indigo-400 mb-1 mr-1"></i>
                        <i class="gg-pill icon-small text-indigo-400 mb-1 mr-1"></i>
                        <i class="gg-pill icon-small text-indigo-400 mb-1 mr-1"></i>
                        <i class="gg-pill icon-small text-indigo-400 mb-1"></i> 
                    </div>
                </div>
                
            </div>

            <div class="col-md-5" style="display: flex;flex-direction: column; justify-content: space-between;">
                <p class="text-muted">
                    {{ $product -> short_description }}
                </p>
                <p class="mt-1">
                    <label><i class="fa fa-coins mr-2"></i>Payment coins:</label><br>
                    @foreach($product -> getCoins() as $coin)
                        <span class="badge badge-success">{{ strtoupper(\App\Purchase::coinDisplayName($coin)) }}</span>
                    @endforeach
                </p>
                <a href="{{ route('product.show', $product) }}" class="btn btn-primary d-block mt-3 ">
                    <i class="fas fa-shopping-cart mr-2"></i>
                    Buy now
                </a>
            </div>

        </div>

    </div>
</div>