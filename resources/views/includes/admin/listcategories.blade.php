@foreach($categories as $category)
<div class="w-full mb-2">
    <a href="{{ route('admin.categories.show', $category -> id) }}">
        <div style="display: flex; justify-content: space-between;" class="text-sm rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-800 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md px-3 py-1 flex cursor-pointer">
            <label class="mb-0 mt-1 text-gray-400"> <i class="fa fa-plus mr-2"></i>{{ $category -> name }}</label>
            <a class="btn btn-outline-danger btn-sm" href="{{ route('admin.categories.delete', $category -> id) }}">Delete</a>
        </div>

    </a>

    @if($category -> children -> isNotEmpty())
    <div class="pl-2 mt-2">
        @include('includes.admin.listcategories', ['categories' => $category -> children])
    </div>
    @endif
    
</div>
@endforeach