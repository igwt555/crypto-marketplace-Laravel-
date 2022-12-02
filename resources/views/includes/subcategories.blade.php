@foreach($categories as $cat)
<div class="">
	<a href="{{ route('category.show', $cat) }}">
		<label for="new" class=" text-sm rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-800 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer  " style="display: flex; justify-content: space-between; ">
		    <span class="flex"> <i class="fa fa-plus mr-2"></i>{{ $cat -> name }}</span>
		    <span class="badge badge-secondary badge-pill">{{ $cat -> num_products }}</span>
		</label>
	</a>

	@if($cat -> children -> isNotEmpty())
    <div class="pl-2 subcategories">
        @include('includes.subcategories', ['categories' => $cat -> children])
    </div>
    @endif
	
</div>
@endforeach
<!-- list-group-item category @if(isset($category) && $cat -> isAncestorOf(optional($category))) active @endif  align-items-center rounded-0 list-group-item-action d-flex justify-content-between -->