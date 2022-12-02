<div class="card bg-dark-l mb-2">
    <div class="col-span-1" title="Promoted">
        <div class="bg-gray-700 rounded-md shadow-md">
            <div class="p-2"> 
                <a href="{{ route('product.show', $product) }}" title="{{ $product -> name }}">
                    <div class="rounded-md overflow-hidden bg-gray-800 bg-cover w-auto h-65 flex items-center justify-center p-3"
                        style="background-image: url('{{ asset('storage/'  . $product -> frontImage() -> image) }}')">
                    </div>
                </a> 
            </div>
            <div class="px-4 pb-3 pt-0 ">
                <ul class="flex flex-wrap items-center leading-tight">
                    <li> 
                        <a href="#" class="font-bold text-xs text-gray-400 hover:text-white">{{ $product -> category -> name }}
                        </a>
                    </li>
                    <!-- <li> <i class="gg-chevron-right px-1 icon-mini text-gray-500"></i> </li> -->
                    <!-- <li> <a href="?category=560" class="font-bold text-xs text-gray-400 hover:text-white">LSD</a> </li> -->
                </ul>
                <h4 class="text-white leading-tight mt-1"> 
                    <a href="{{ route('product.show', $product) }}" class="text-light">{{ $product -> name }}</a> 
                </h4>
                <div class="mt-2 text-xs flex items-center justify-between">
                    <div class="flex flex-col"> 
                        <a href="{{ route('vendor.show', $product -> user) }}" class="flex items-center"> 
                            <i class="gg-profile icon-small text-gray-500 mr-2"></i> 
                            <span class="text-gray-400">{{ $product -> user -> username }}</span> 
                        </a> 
                    </div>
                    <div class="flex flex-col"> 
                        <a href="#listing-types" class="flex items-center"> 
                            <i class="gg-info icon-smaller text-gray-500 mr-1"></i> 
                            <span class="text-gray-400">Escrow</span> 
                        </a> 
                    </div>
                </div>
                <div class="flex items-center justify-between mt-1">
                    <div class="flex flex-col"> 
                        <span class="font-bold text-xss text-gray-600">Source</span> 
                        <span class="text-sm text-gray-400">USA</span> 
                    </div>
                    <div class="flex flex-col text-right"> 
                        <span class="font-bold text-xss text-gray-600">Ships to</span>
                        <span class="text-sm text-gray-400">Worldwide</span>
                    </div>
                </div>
                <div class="flex items-center mt-2 ml-2 mr-2">
                    <div class="flex mb-2" title="Rating: 4.92"> 
                        <i class="gg-pill icon-small text-indigo-400 mb-1 mr-1"></i>
                        <i class="gg-pill icon-small text-indigo-400 mb-1 mr-1"></i>
                        <i class="gg-pill icon-small text-indigo-400 mb-1 mr-1"></i>
                        <i class="gg-pill icon-small text-indigo-400 mb-1 mr-1"></i>
                        <i class="gg-pill icon-small text-indigo-400 mb-1"></i> 
                    </div>
                    <div class="ml-auto"> 
                        <!-- <a href="#" title="Add to favorites"> 
                            <iframe
                                style="border:none; width: 25px; height: 25px; align-self: center;"
                                srcdoc="<meta charset=&quot;utf-8&quot;><link rel=&quot;stylesheet&quot; type=&quot;text/css&quot; href=&quot;/assets/css/main.css&quot;><a style=&quot;all:initial;color: #b3b3b3; cursor:pointer; align-self: center;&quot; href=&quot;/heart/RDVteTcvTU1Ubkk4bVUwSGlkcjZUUT09&quot; title=&quot;Add to favorites&quot;><i class=&quot;gg-heart text-gray-500 hover:text-red-500 mt-1 ml-2&quot;></i></a>">
                                    
                            </iframe>
                        </a>  -->
                    </div>
                </div>
            </div> 
            <a href="{{ route('product.show', $product) }}">
                <footer class="rounded-b-md bg-gray-800">
                    <div class="flex">
                        <div class="w-1/2 flex justify-center items-center py-2 border-r border-gray-700 border-opacity-50">
                            <span class="text-gray-300 text-sm">Quantity: {{ $product -> quantity }} Left</span>
                        </div>
                        <div class="w-1/2 flex justify-center items-center py-2 border-l border-gray-700 border-opacity-50">
                            <span class="text-gray-300 text-sm"> 
                                From: 
                                <strong>{{ $product->getLocalPriceFrom() }}</strong> 
                            </span> 
                            <span  class="font-bold text-sm text-gray-600 ml-2">{{\App\Marketplace\Utility\CurrencyConverter::getLocalSymbol() }}</span>
                        </div>
                    </div>
                    <div class="flex">
                        <a href="{{ route('product.show', $product) }}" class="w-full rounded-md shadow-md text-sm bg-gray-900 px-3 text-gray-400 h-10 border-indigo-400 bg-opacity-50 border-opacity-50 border-2 hover:bg-indigo-400 hover:text-white py-2 transition-colors duration-200 text-center">
                            <i class="fas fa-shopping-cart"></i>
                            Buy
                        </a>
                    </div>
                </footer>
            </a>
        </div>
    </div>
</div>
