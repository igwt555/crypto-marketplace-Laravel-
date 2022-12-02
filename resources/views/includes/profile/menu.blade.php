<style>
@media screen and (max-width:576px) {
    .nav a {
        min-width: 30% !important;
        max-width: 50% !important;
        display: inline-block !important;
        font-size: 13px !important;
        white-space: nowrap !important;
        /* background-color: var(--lightColor) !; */
    }
}
</style>


<div class="nav flex-md-column flex-row nav-pills justify-content-sm-center" id="v-pills-tab" role="tablist"
    aria-orientation="vertical">
    <h5 class="text-light mb-2 w-full">Navigation</h5>
    <a href="{{ route('profile.index') }}" class=" text-light "
        id="v-pills-home-tab" data-toggle="pill" role="tab" aria-controls="v-pills-home" aria-selected="true">
        <label for="new"
            class="@isroute('profile.index') active @endisroute text-sm rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-800 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer items-center ">
            <i class="fa fa-cog mr-2"></i>Settings
        </label>
    </a>
    <a href="{{ route('profile.pgp') }}" class=" text-light "
        data-toggle="pill">
        <label for="new"
            class="@isroute('profile.pgp') active @endisroute text-sm rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-800 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer items-center ">
            <i class="fa fa-key mr-2"></i>PGP Key
        </label>
        
        
    </a>
    @if(auth() -> user() -> isVendor())

    <a href="{{ route('profile.vendor') }}" class=" text-light "
        data-toggle="pill">
        <label for="new"
            class="@isroute('profile.vendor') active @endisroute text-sm rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-800 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer items-center ">
             <i class="far fa-address-card mr-2"></i>
            Vendor
        </label>
       
    </a>
    <a href="{{ route('profile.sales') }}" class=" text-light "
        data-toggle="pill">
        <label for="new"
            class="@isroute('profile.sales') active @endisroute text-sm rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-800 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer items-center ">
            <i class="fas fa-receipt mr-2"></i>
            Sales
            @if(auth() -> user() -> vendor -> unreadSales() > 0)
            <span class="ml-2 badge badge-warning">{{ auth() -> user() -> vendor -> unreadSales() }} new</span>
            @endif
        </label>
        
        
    </a>
    @else
    <a href="{{ route('profile.become') }}" class=" text-light "
        data-toggle="pill">
        <label for="new"
            class="@isroute('profile.become') active @endisroute text-sm rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-800 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer items-center ">
            <i class="far fa-address-card mr-2"></i>
        Become Vendor
        </label>
        
    </a>

    @endif

    <a href="{{ route('profile.wishlist') }}"
        class=" text-light " data-toggle="pill">
        <label for="new"
            class="@isroute('profile.wishlist') active @endisroute text-sm rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-800 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer items-center ">
            <i class="fas fa-heart mr-2"></i>
        Wishlist
        </label>
        
    </a>

    <a href="{{ route('profile.purchases') }}"
        class=" text-light " data-toggle="pill">
        <label for="new"
            class="@isroute('profile.purchases') active @endisroute text-sm rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-800 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer items-center ">
            <i class="fas fa-shopping-cart mr-2"></i>
        Purchases
        </label>
        
    </a>
    <a href="{{ route('profile.messages') }}"
        class=" text-light " data-toggle="pill">
        <label for="new"
            class="@isroute('profile.messages') active @endisroute text-sm rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-800 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer items-center ">
            <i class="mr-2 far fa-comments"></i>
        Messages
        </label>
        
    </a>
    <a href="{{ route('profile.notifications') }}"
        class=" text-light " data-toggle="pill">
        <label for="new"
            class="@isroute('profile.notification') active @endisroute text-sm rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-800 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer items-center ">
            <i class="mr-2 far fa-bell"></i>
        Notifications
        </label>
        
    </a>

    <!-- Add New : Genius Dev -->
    <a href="{{ route('profile.deposit') }}" class="text-light"
        data-toggle="pill">
        <label for="new"
            class="  @isroute('profile.deposit') active @endisroute text-sm rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-800 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer items-center ">
            <i class="mr-2 far far fa-money-bill-alt"></i>
        Deposit
        </label>
        
    </a>
    <a href="{{ route('profile.exchange') }}"
        class="text-light" data-toggle="pill">
        <label for="new"
            class="  @isroute('profile.exchange') active @endisroute text-sm rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-800 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer items-center ">
            <i class="mr-2 fas fa-exchange-alt"></i>
        Exchange
        </label>
        
    </a>
</div>