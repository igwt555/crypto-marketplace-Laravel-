<div class="col-md-6 ">
    <div class="col-md-12 h-full shadow-md pt-3 pb-3 rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400">
        <h3 class="mb-2"><i class="fas fa-truck-moving mr-2"></i>Delivery</h3>
        <hr>

        @if($purchase -> shipping)
            <div style="display: flex; flex-direction: column; justify-content: space-around;" class="w-full h-full px-10 py-12">
                <div class="w-full" style="display: flex;  justify-content: space-between;">
                   <label class="">Shipping name:</label> 
                   <label class="badge badge-success">{{ $purchase -> shipping -> name }}</label>
                </div>
                <div class="w-full" style="display: flex;  justify-content: space-between;">
                    <label class="">Delivery time:</label> 
                    <label>
                        {{ $purchase -> shipping -> duration }}
                    </label>
                </div>
                <div class="w-full" style="display: flex;  justify-content: space-between;">
                    <label class="">Shipping price:</label> 
                    <strong>@include('includes.currency', ['usdValue' => $purchase -> shipping -> price])</strong>
                </div>
            </div>
        @else
            {{-- If the buyer deposited enough sum --}}
            @if($purchase -> isBuyer() && $purchase -> enoughBalance())
                <p class="mb-1">Automatic delivery:</p>
                <textarea class="form-control disabled" readonly rows="10">{{ $purchase -> delivered_product }}</textarea>
            @elseif($purchase -> isBuyer())
                <div class="alert alert-warning">
                    You must pay to address and the system will deliver you content here.
                </div>
            @endif
        @endif
    </div>
</div>