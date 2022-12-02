<div class="rounded-md bg-gray-900 px-3 py-2 pb-3">
    <h3 class="mt-4"><i class="mr-2 far far fa-money-bill-alt"></i>Local Currency</h3>
    <hr>
    <div class="row">

        <div class="col-md-12">
            <form action="{{route('multicurrency.change')}}" method="post">
                {{csrf_field()}}

                <div class="form-group">
                    <select name="currency" id="" class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2 disabled">
                        @foreach(\App\Marketplace\Utility\CurrencyConverter::getSupportedCurrencies() as $currency)
                            <option value="{{$currency}}" @if(auth()->user()->getLocalCurrency() == $currency) selected @endif>{{$currency}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <button type="submit" class="w-full rounded-md shadow-md text-sm bg-gray-900 px-3 text-gray-400 h-10 border-indigo-400 bg-opacity-50 border-opacity-50 border-2 hover:bg-indigo-400 hover:text-white transition-colors duration-200">Change currency</button>
                </div>
            </form>
            <p class="text-muted">Your current local currency is: {{auth()->user()->getLocalCurrency()}}</p>
        </div>
    </div>    
</div>
