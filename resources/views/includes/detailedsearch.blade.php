<div class="row">
    <div class="col mt-2">
        <div class=" mt-5 bg-transprent">
            <h2 class="font-bold text-gray-400 mb-4"><i class="fa fa-search mr-2"></i>Search options</h2>
            <div class="">
                <form action="{{route('search')}}" method="post">
                    {{csrf_field()}}
                    <div class="form-group">
                        <label for="search">
                            <i class="fa fa-edit mr-2"></i>
                            <span class="text-gray-400">Search terms:</span>
                        </label>
                        <input type="text" name="search" id="search" class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" value="{{app('request')->input('query')}}" placeholder="Search query">
                    </div>
                    <div class="form-group">
                        <label for="user" class="flex">
                            <i class="gg-profile icon-small mr-2 text-gray-600 text-lg"></i>
                            <span class="text-gray-400">User:</span>
                        </label>
                        <input type="text" name="user" placeholder="All vendors" id="user" class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" value="{{app('request')->input('user')}}">
                    </div>
                    <div class="form-group">
                        <label for="" class="">
                            <i class="fa fa-tag mr-2 text-gray-600"></i>
                            <span class="text-gray-400">Category:</span>
                        </label>
                        <select class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" id="category" name="category">
                            <option selected value="any">All</option>
                            @foreach($categories as $category)
                                <option value="{{$category->name}}" @if(app('request')->input('category') == $category->name) selected @endif>+ {{$category->name}}</option>
                                @if($category -> children -> isNotEmpty())
                                    @foreach($category->children as $child)
                                        <option value="{{$child->name}}" @if(app('request')->input('category') == $child->name) selected @endif> &nbsp;- {{$child->name}}</option>
                                        @if($child -> children -> isNotEmpty())
                                            @foreach($child->children as $subChild)
                                                <option value="{{$subChild->name}}" @if(app('request')->input('category') == $subChild->name) selected @endif>&nbsp;&nbsp;>> {{$subChild->name}}</option>
                                            @endforeach
                                        @endif
                                    @endforeach
                                @endif
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="product_type">
                            <i class="fa fa-tag mr-2 text-gray-600"></i>
                            <span class="text-gray-400">Product type:</span>
                        </label>
                        <select class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" id="product_type" name="product_type">
                            <option selected value="all">All</option>
                            <option value="digital" @if(app('request')->input('type') == 'digital') selected @endif>Digital</option>
                            <option value="physical" @if(app('request')->input('type') == 'physical') selected @endif>Physical</option>
                        </select>
                    </div>
                    <div class="form-group flex">
                        <div class="mr-2">
                            <label for="">
                                <i class="fas fa-dollar-sign mr-2 text-gray-600"></i>
                                <span class="text-gray-400">From:</span>
                            </label>
                            <input type="number" name="minimum_price" id="" placeholder="$100.00"
                                   class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" id="product_type" name="product_type" value="{{app('request')->input('price_min')}}" step="0.01">
                        </div>
                        <div class="">
                            <label for="">
                                <i class="fas fa-dollar-sign mr-2 text-gray-600"></i>
                                <span class="text-gray-400">To:</span>
                            </label>
                            <input type="number" name="maximum_price" id="" placeholder="$10,000.00"
                                   class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" id="product_type" name="product_type" value="{{app('request')->input('price_max')}}" step="0.01">
                        </div>
                      
                    </div>
                    <div class="form-group">
                        <label for="">
                            <i class="fa fa-sort mr-2 text-gray-600"></i>
                            <span class="text-gray-400">Order By:</span>
                        </label>
                        <select class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" id="order_by" name="order_by">
                            <option @if(app('request')->input('order_by') == 'price_asc' ||app('request')->input('order_by') == null) selected @endif value="price_asc">Price: Low to High</option>
                            <option @if(app('request')->input('order_by') == 'price_desc') selected @endif value="price_desc">Price: High to Low</option>
                            <option @if(app('request')->input('order_by') == 'newest') selected @endif value="newest">Newest</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="text-center">
                            <button type="submit" class="w-full rounded-md shadow-md bg-gray-800 px-3 text-gray-400 h-10 border-indigo-400 border-opacity-50 border-2 hover:bg-indigo-400 hover:text-white transition-colors duration-200">
                                Search
                            </button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
