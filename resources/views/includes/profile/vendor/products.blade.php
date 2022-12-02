<div class="rounded-md bg-gray-900 px-3 py-2 mt-3">

    <h3 class="mt-3"><i class="fa fa-cart mr-2"></i>My products</h3>
    <hr>

    @if(auth() -> user() -> products -> isNotEmpty())
    <div class="bg-gray-900 rounded-md shadow-md mt-3">
        <div class="p-1 bg-gray-800 rounded-t-md flex">
            <div class="ml-2 text-gray-500 font-semibold col-md-3">Title</div>
            <div class="ml-2 text-gray-500 text-right col-md-1">Quantity</div>
            <div class="ml-2 text-gray-500 text-right col-md-2">Price from</div>
            <div class="ml-2 text-gray-500 text-center col-md-2">Category</div>
            <div class="ml-2 text-gray-500 text-center col-md-1">Type</div>
            <div class="ml-2 text-gray-500 text-right col-md-2">Action</div>
        </div>
        @foreach($myProducts as $product)

        <div class="p-1 flex border-gray-850 border-dashed border-b">
            <div class="ml-2 text-gray-500 col-md-3">
                <a href="{{ route('product.show', $product) }}" class="text-dark text-left">{{ $product -> name }}</a>
            </div>
            <div class="ml-2 text-gray-500 text-right col-md-1">{{ $product -> quantity }}</div>
            <div class="ml-2 text-gray-500 text-right col-md-2">
                @include('includes.currency', ['usdValue' => $product -> price_from ])
            </div>
            <div class="ml-2 text-gray-500 text-center col-md-2">
                <a href="{{ route('category.show', $product -> category) }}" class="text-dark text-center">{{ $product -> category -> name }}</a>
            </div>
            <div class="ml-2 text-gray-500 text-center col-md-1">
                <span class="badge badge-primary">{{ $product -> isDigital() ? 'Digital' : 'Physical' }}</span>
            </div>
            <div class="ml-2 text-gray-500 text-right col-md-2" style="display: flex;justify-content: end;">
                <a href="{{ route('profile.vendor.product.clone.show', $product ) }}" class="btn btn-sm btn-info">
                    Clone
                </a>
                <a href="{{ route('profile.vendor.product.edit', $product -> id) }}" class="btn btn-sm btn-primary">
                    <i class="far fa-edit"></i>
                </a>
                <a href="{{ route('profile.vendor.product.remove.confirm', $product -> id) }}" class="btn btn-sm btn-danger">
                    <i class="fa fa-trash"></i>
                </a>

            </div>
        </div>


        @endforeach
        {{{ $myProducts -> links('includes.paginate') }}}
    </div>
    @else
        <div class="alert alert-warning text-center">
            You don't have any products!
        </div>
    @endif
</div>