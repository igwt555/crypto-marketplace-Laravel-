<div class="row">
    <div class="col-md-12 col-lg-6 col-sm-12 col-xs-12">
        <div class="bg-gray-900 rounded-md shadow-md px-4 pt-3 pb-4">
            <header class="flex items-center"> <span class="text-gray-400 text-sm">Your Balance</span> </header>

            <div class="px-1 mt-6 mb-3  overflow-hidden" title="Bitcoin"> 
                <a href="#">
                    <div class="bg-gray-800 rounded-md flex">
                        <div class="bg-clip-border flex items-center justify-center flex-shrink-0 mt-4 ml-3 h-10 w-10 bg-cover"
                            style="background-image: url('/img/BTC.png')"></div>
                        <div
                            class="w-full flex flex-col pt-4 pb-6 sm:pb-4 px-6 border-b sm:border-b-0 sm:border-r border-gray-800 border-opacity-50">
                            <span class="text-gray-400 text-xl">
                               {{number_format(auth()->user()->btc_balance,8)}}
                            </span> <span class="font-bold text-sm text-gray-600">
                                BTC
                            </span> </div>
                    </div>
                </a> 
            </div>

            <div class="px-1 mt-10 mb-3  overflow-hidden" title="XMR"> 
                <a href="#">
                    <div class="bg-gray-800 rounded-md flex">
                        <div class="bg-clip-border flex items-center justify-center flex-shrink-0 mt-4 ml-3 h-10 w-10 bg-cover"
                            style="background-image: url('/img/xmr_icon.png')"></div>
                        <div
                            class="w-full flex flex-col pt-4 pb-6 sm:pb-4 px-6 border-b sm:border-b-0 sm:border-r border-gray-800 border-opacity-50">
                            <span class="text-gray-400 text-xl">
                                {{number_format(auth()->user()->xmr_balance,8)}}
                            </span> <span class="font-bold text-sm text-gray-600">
                                XMR
                            </span> </div>
                    </div>
                </a> 
            </div>

            <div class="px-1 mt-10 mb-2  overflow-hidden" title="USD"> 
                <a href="#">
                    <div class="bg-gray-800 rounded-md flex">
                        <div class="bg-clip-border flex items-center justify-center flex-shrink-0 mt-4 ml-3 h-10 w-10 bg-cover"
                            style="background-image: url('/img/USD.png')"></div>
                        <div
                            class="w-full flex flex-col pt-4 pb-6 sm:pb-4 px-6 border-b sm:border-b-0 sm:border-r border-gray-800 border-opacity-50">
                            <span class="text-gray-400 text-xl">
                                ${{number_format(auth()->user()->usd_balance,8)}}
                            </span> <span class="font-bold text-sm text-gray-600">
                                USD
                            </span> </div>
                    </div>
                </a> 
            </div>
            
        </div>
    </div>
    <div class="col-md-12 col-lg-6 col-sm-12 col-xs-12">
        <div class="bg-gray-900 rounded-md shadow-md px-4 pt-3 pb-4">
            <header class="flex items-center"> <span class="text-gray-400 text-sm">Exchange</span> </header>
            <form action="{{ route('profile.exchange.detail') }}" class="mt-2" method="POST" >
                {{ csrf_field() }}
                <div class="form-row flex" style="justify-content: flex-between;">
                    <div class="col-md-12 col-sm-12 mt-4">
                        <label><i class="fa fa-coins mr-2"></i>Choose coin to exchange</label>
                        <select name="coin" id="coin" class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" value="btc">
                            <!-- <option>Coin</option> -->
                            @foreach(config('coins.coin_list') as $supportedCoin => $instance)
                            <option value="{{ $supportedCoin }}">{{ \App\Address::label($supportedCoin) }} ~ Price
                            </option>
                            @endforeach
                        </select>
                    </div>
                    
                    <div class="col-md-12 text-center">
                        <header class="mt-1 text-center"> <span class="text-gray-400 text-sm">Exchange Rate</span> </header>
                        <div class="mt-2">
                                    <span class="text-gray-400 text-sm">
                                        1.00
                                    </span> <span class="font-bold text-sm text-gray-600">
                                        BTC
                                    </span> ~ 
                                    <span class="text-gray-400 text-sm">
                                        ${{number_format($btcToUsd,8)}}
                                    </span> <span class="font-bold text-sm text-gray-600">
                                        USD
                                    </span>
                        </div>
                        <div class="mt-2">
                                    <span class="text-gray-400 text-sm">
                                        1.00
                                    </span> <span class="font-bold text-sm text-gray-600">
                                        XMR
                                    </span> ~ 
                                    <span class="text-gray-400 text-sm">
                                        ${{number_format($xmrToUsd,8)}}
                                    </span> <span class="font-bold text-sm text-gray-600">
                                        USD
                                    </span>
                        </div>
                    </div>
                    
                    <div class="col-md-12 col-sm-12 ">
                        <label><i class="fas fa-dollar-sign mr-2"></i>Enter amount to exchange</label>
                        <input type="number" step="10" max="{{auth()->user()->usd_balance}}" min="100.00" class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" name="balance" id="balance" placeholder="Enter Dollar($) amount:" 
                            value="" >
                    </div>
                    <div class="col-md-12 mt-10 ">
                        <button type="submit" class="btn btn-block btn-success btn-md">
                            <i class="mr-2 fas fa-exchange-alt"></i> EXCHANGE</button>
                    </div>


                </div>
            </form>
        </div>
    </div>
</div>
