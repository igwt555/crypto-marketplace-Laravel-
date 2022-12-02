<div class="col-md-6 shadow-md pt-3 pb-2 rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400">
    <h3 class=""><i class="fas fa-shopping-cart mr-2"></i>Offer</h3>
    <hr>

    <div style="display: flex; flex-direction: column; justify-content: space-around;" class="w-full h-full px-10 py-12">
        <div class="w-full" style="display: flex;  justify-content: space-between;">
           <label class=""><i class="fas fa-file-invoice-dollar mr-2"></i>Purchased amount:</label> 
           <label class="text-gray-500">{{ $purchase -> quantity }} {{ Illuminate\Support\Str::plural($purchase -> offer -> product -> mesure, $purchase -> quantity) }}</label>
        </div>
        <div class="w-full" style="display: flex;  justify-content: space-between;">
            <label class=""><i class="fa fa-coins mr-2"></i>Price:</label> 
            <label>
                <strong>@include('includes.currency', ['usdValue' => $purchase -> offer -> price])</strong>
                    / {{ $purchase -> offer -> product -> mesure }}
            </label>
        </div>
        <div class="w-full" style="display: flex;  justify-content: space-between;">
            <label class=""><i class="fa fa-coins mr-2"></i>Total:</label> 
            <strong>@include('includes.currency', ['usdValue' => $purchase -> value_sum])</strong>
        </div>
    </div>
</div>