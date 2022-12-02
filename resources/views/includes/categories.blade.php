<div class=" mb-2 rounded-md bg-gray-900 px-3 py-2">
    <header class="flex items-center mt-2"> 
    	<span class="text-gray-400 text-sm flex">
    		<i class="gg-profile icon-normal mr-2"></i>Categories
    	</span> 
    </header>
    <div class="mb-2 sm:flex-row  mt-2">
        @include('includes.subcategories', ['categories' => $categories])
    </div>
</div>