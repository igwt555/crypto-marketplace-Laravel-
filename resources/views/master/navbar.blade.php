<header class="md:items-center pt-4 pb-2 sm:pb-10">
    <div style="background-color: transparent;">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-md-12 col-sm-12 col-xs-12 text-center text-md-left ">

                    <nav class="">
                        <ul class="flex flex-row text-gray-600">
                            <li>
                                <a href="/" title="Visit the mainpage" class="">
                                    <img src="/img/logo.png" style="width: 50px!important;" width="50px" height="50px">
                                </a>
                            </li>
                            <li>
                                <a href="/" title="Visit the mainpage"
                                    class="py-1 sm:py-0 h-full flex items-center py-1 sm:py-0 h-full flex items-center hover:text-white px-3 transition-colors duration-200text-white px-3">
                                    <span><i class="fas fa-home"></i>&nbsp;Home</span>
                                </a>
                            </li>
                            <li>
                                <a href="/search" title="Browse marketplace"
                                    class="py-1 sm:py-0 h-full flex items-center py-1 sm:py-0 h-full flex items-center hover:text-white px-3 transition-colors duration-200text-white px-3">
                                    <span><i class="fas fa-shopping-cart"></i>&nbsp;Market</span>
                                </a>
                            </li>
                            <li>
                                <a href="{{ route('profile.index') }}" title="Browse setting"
                                    class="py-1 sm:py-0 h-full flex items-center py-1 sm:py-0 h-full flex items-center hover:text-white px-3 transition-colors duration-200text-white px-3">
                                    <span><i class="fas fa-cogs"></i>&nbsp;Settings</span>
                                </a>

                            </li>
                            <li> <a href="{{ route('profile.messages') }}" title="Browse Message"
                                    class="py-1 sm:py-0 h-full flex items-center py-1 sm:py-0 h-full flex items-center hover:text-white px-3 transition-colors duration-200text-white px-3">
                                    <span><i class="fas fa-comments"></i>&nbsp;MESSAGE
                                    </span>

                                </a>

                            </li>
                        </ul>

                    </nav>

                </div>
                <div class="col-lg-3 search-bar1">
                    @include('master.search')
                </div>
                <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 text-center text-md-right">
                    <span class="">
                        <div class="btn-group nav1 flex flex-row">
                            @auth
                            <a href="{{ route('profile.index') }}" title="{{auth()->user()->username}}"
                                class="@isroute('profile.index') active @endisroute text-uppercase  font-weight-bold  text-dark mr-3 mx-sm-3 text-dark"><i
                                    class="fa fa-user-circle"></i></a>
                            @endauth
                            @admin
                            <a href="{{ route('admin.index') }}" class="mr-3 mx-sm-3 text-dark"><i
                                    class="fas fa-user-shield" title="Admin Panel"></i>&nbsp;</a>
                            @endadmin
                            @moderator
                            <a href="{{ route('admin.index') }}" class="mr-3 mx-sm-3 text-dark"
                                title="Moderator panel"></a><i class="fas fa-users-cog"></i>&nbsp;
                            @endmoderator


                            @auth
                            <a href="{{ route('profile.tickets') }}" class="mr-3 mx-sm-3 text-dark " title="Support"><i
                                    class="fa fa-life-ring"></i>
                            </a>


                            <a href="{{route('profile.notifications')}}"
                                class="mr-4 mx-sm-3 text-dark position-relative" title="Notifications"><i
                                    class="fa fa-bell"></i>
                                <span class="position-absolute badge badge-danger"
                                    style="font-size: 13px; right: -20px; top:-10px">
                                    {{auth()->user()->unreadNotifications()->count()}}
                                </span>
                            </a>

                            <a href="{{ route('profile.cart') }}" class="mr-4 mx-sm-3 text-dark position-relative"
                                title="Cart"><i class="fas fa-shopping-cart"></i>
                                <span class="position-absolute badge badge-danger"
                                    style="font-size: 13px; right: -20px; top:-10px">
                                    {{ session('cart_items') !== null ? count(session('cart_items')) : 0 }}
                                </span>
                            </a>
                            <form class="form-inline mx-3  text-light" action="{{route('auth.signout.post')}}"
                                method="post">
                                {{csrf_field()}}
                                <button class="border-0 bg-transparent  text-dark" type="submit"
                                    style="text-decoration: none;"><i class="gg-log-off  log-off-btn"></i></button>
                            </form>

                            @endauth
                        </div>
                    </span>
                    @auth
                    @else
                    <a class="mx-3  text-light" href="{{route('auth.signin')}}">Sign In</a>
                    <a class="mx-3  text-light" href="{{route('auth.signup')}}">Sign Up</a>
                    @endauth
                </div>
            </div>

            <div class="col-xs-12 search-bar2">
                @include('master.search')
            </div>

            <div class="col-md-12 px-0 col-sm-12 col-xs-12 flex w-full " style="justify-content: space-between;">
                <div class="col-md-3 col-sm-6 px-0  nav-title">
                    <h1 class="text-white text-4xl font-light mt-3">@yield('page_title')</h1>
                    <h3 class="text-gray-500 text-1xl text-dark font-light leading-tight flex items-center mt-1">
                        <a class="hover:text-white transition-colors duration-200 text-dark" href="/">Home</a> 
                        <i class="gg-chevron-right text-gray-500 icon-smaller"></i> 
                        <a class="hover:text-white transition-colors duration-200 text-dark" href="">@yield('page_title')</a> 
                    </h3>
                </div>
                @auth
                <div class="col-lg-4 col-md-12 col-sm-12 col-xs-12 flex p-0 mt-3" style="justify-content: space-between;">
                    <div class="bg-gray-800 rounded-md flex" style="height: fit-content;" title="Bitcoin">
                        <div class="bg-clip-border flex items-center justify-center flex-shrink-0 mt-3 ml-3 h-8 w-8 bg-cover" style="background-image: url('/img/BTC.png')"></div>
                        <div class="w-full flex flex-col pt-2 pb-2 sm:pb-4 px-2 border-b sm:border-b-0 sm:border-r border-gray-800 border-opacity-50">
                            <span class="text-gray-400 " style="font-size: 14px;">
                               {{number_format(auth()->user()->btc_balance, 8)}}
                            </span> <span class="font-bold text-sm text-gray-600" style="font-size: 13px;">
                                BTC
                            </span> </div>
                    </div>
                    <div class="bg-gray-800 rounded-md flex" style="height: fit-content;" title="XMR">
                        <div class="bg-clip-border flex items-center justify-center flex-shrink-0 mt-3 ml-3 h-8 w-8 bg-cover" style="background-image: url('/img/xmr_icon.png')"></div>
                        <div class="w-full flex flex-col pt-2 pb-2 sm:pb-4 px-2 border-b sm:border-b-0 sm:border-r border-gray-800 border-opacity-50">
                            <span class="text-gray-400 " style="font-size: 14px;">
                               {{number_format(auth()->user()->xmr_balance, 8)}}
                            </span> <span class="font-bold text-sm text-gray-600" style="font-size: 13px;">
                                XMR
                            </span> </div>
                    </div>
                    <div class="bg-gray-800 rounded-md flex" style="height: fit-content;" title="USD">
                        <div class="bg-clip-border flex items-center justify-center flex-shrink-0 mt-3 ml-3 h-8 w-8 bg-cover" style="background-image: url('/img/USD.png')"></div>
                        <div class="w-full flex flex-col pt-2 pb-2 sm:pb-4 px-2 border-b sm:border-b-0 sm:border-r border-gray-800 border-opacity-50">
                            <span class="text-gray-400 " style="font-size: 14px;">
                               ${{number_format(auth()->user()->usd_balance, 8)}}
                            </span> <span class="font-bold text-sm text-gray-600" style="font-size: 13px;">
                                USD
                            </span> </div>
                    </div>
                    
                </div>
                @endauth
            </div>
        </div>
    </div>
    <style>
    @media screen and (max-width : 426px) {
        .cart-sm {
            position: absolute;
            top: 65px;
            right: 22px;
        }
    }
    </style>


</header>