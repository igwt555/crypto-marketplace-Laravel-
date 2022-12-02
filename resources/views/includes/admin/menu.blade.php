<div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
    <h3 class="text-light mb-3">Navigator</h3>

    <a class="" href="{{ route('admin.index') }}">
        <label for="new" class="@isroute('admin.index') active @endisroute text-sm rounded-md bg-gray-900 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-900 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer  " style="display: flex; justify-content: space-between; ">
            <label class="mt-2">
                <i class="fas fa-columns mr-2"></i>
                Index
            </label>
        </label>
    </a>

    @hasAccess('categories')
    <a class="" href="{{ route('admin.categories') }}">
        <label for="new" class="@isroute('admin.categories') active @endisroute text-sm rounded-md bg-gray-900 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-900 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer  " style="display: flex; justify-content: space-between; ">
            <label class="mt-2">
                <i class="fas fa-list mr-2"></i>
                Categories
            </label>
        </label>

    </a>
    @endhasAccess

    @hasAccess('messages')
    <a href="{{ route('admin.messages.mass') }}">
        <label for="new" class="@isroute('admin.messages.mass') active @endisroute text-sm rounded-md bg-gray-900 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-900 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer  " style="display: flex; justify-content: space-between; ">
            <label class="mt-2">
                <i class="fas fa-envelope mr-2"></i>
                Mass Messages
            </label>
        </label>
        
    </a>
    @endhasAccess

    @hasAccess('users')
    <a href="{{ route('admin.users') }}">
        <label for="new" class="@isroute('admin.users') active @endisroute text-sm rounded-md bg-gray-900 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-900 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer  " style="display: flex; justify-content: space-between; ">
            <label class="mt-2">
                <i class="fas fa-users mr-2"></i>
                Users
            </label>
        </label>
        
    </a>
    @endhasAccess

    @hasAccess('products')
    <a  href="{{ route('admin.products') }}">
        <label for="new" class="@isroute('admin.product') active @endisroute text-sm rounded-md bg-gray-900 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-900 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer  " style="display: flex; justify-content: space-between; ">
            <label class="mt-2">
                <i class="fas fa-shopping-bag mr-2"></i>
                Products
            </label>
        </label>
        
    </a>
    @endhasAccess

    @hasAccess('products')
    @isModuleEnabled('FeaturedProducts')
    <a  href="{{ route('admin.featuredproducts.show') }}">
        <label for="new" class="@isroute('admin.featuredproducts') active @endisroute text-sm rounded-md bg-gray-900 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-900 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer  " style="display: flex; justify-content: space-between; ">
            <label class="mt-2">
                <i class="fas fa-medal mr-2"></i>
                Featured Products
            </label>
        </label>
        
    </a>
    @endisModuleEnabled
    @endhasAccess

    @hasAccess('purchases')
    <a href="{{ route('admin.purchases') }}">
        <label for="new" class="@isroute('admin.purchases') active @endisroute @isroute('admin.purchase') active @endisroute text-sm rounded-md bg-gray-900 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-900 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer  " style="display: flex; justify-content: space-between; ">
            <label class="mt-2">
                <i class="fas fa-shopping-cart mr-2"></i>
                Purchases
            </label>
        </label>
        
    </a>
    @endhasAccess

    @hasAccess('logs')
    <a href="{{ route('admin.log') }}">
        <label for="new" class="@isroute('admin.log') active @endisroute text-sm rounded-md bg-gray-900 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-900 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer  " style="display: flex; justify-content: space-between; ">
            <label class="mt-2">
                <i class="fas fa-list-alt mr-2"></i>
                Log
            </label>
        </label>
        
    </a>
    @endhasAccess


    @hasAccess('disputes')
    <a href="{{ route('admin.disputes') }}">
        <label for="new" class="@isroute('admin.disputes') active @endisroute text-sm rounded-md bg-gray-900 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-900 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer  " style="display: flex; justify-content: space-between; ">
            <label class="mt-2">
                <i class="fas fa-exclamation-triangle mr-2"></i>
                Disputes
            </label>
        </label>
        
    </a>
    @endhasAccess

    @hasAccess('tickets')
    <a href="{{ route('admin.tickets') }}">
        <label for="new" class="@isroute('admin.tickets') active @endisroute @isroute('admin.tickets') active @endisroute text-sm rounded-md bg-gray-900 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-900 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer  " style="display: flex; justify-content: space-between; ">
            <label class="mt-2">
                <i class="far mr-2 fa-question-circle"></i>
                Tickets
            </label>
        </label>
        
    </a>
    @endhasAccess

    @hasAccess('vendorpurchase')
    <a href="{{ route('admin.vendor.purchases') }}">
        <label for="new" class="@isroute('admin.vendor.purchases') active @endisroute @isroute('admin.vendor.purchases') active @endisroute text-sm rounded-md bg-gray-900 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-900 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer  " style="display: flex; justify-content: space-between; ">
            <label class="mt-2">
                <i class="far mr-2 fa-list-alt"></i>
                Vendor Purchases
            </label>
        </label>
        
    </a>
    @endhasAccess

</div>