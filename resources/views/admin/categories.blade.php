@extends('master.admin')

@section('page_title', 'Categories')
@section('admin-content')

    @include('includes.flash.success')
    @include('includes.flash.error')
    <h3 class="mb-3 text-light"><i class="text-gray-400 fa fa-tags mr-2 "></i> Categories</h3>

    <div class="row">
        <div class="col-md-6 bg-gray-900 shadow-md rounded-md px-3 py-3">
            <h4><i class="fa fa-tag mr-2 mb-3"></i>List of categories ({{ count($categories) }})</h4>
            @if($rootCategories -> isNotEmpty())
                @include('includes.admin.listcategories', ['categories' => $rootCategories])
            @else
                <div class="alert alert-warning text-center">There are no categories!</div>
            @endif
        </div>
        <div class="col-md-6 ">
            <div class="w-full bg-gray-900 shadow-md rounded-md px-3 py-3">
                <h4 class="mb-3"><i class="fa fa-plus mr-2"></i>Add new category</h4>
                <form action="{{ route('admin.categories.new') }}"  method="POST">
                    {{ csrf_field() }}
                    <input name="name" placeholder="Category name" class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer  border-indigo-400 border-opacity-50 focus:border-2 mb-3 @error('name', $errors) is-invalid @enderror"/>
                    @error('name', $errors)
                    <div class="invalid-feedback d-block">{{ $errors -> first('name') }}</div>
                    @enderror
                    <label for="parent_id">Parent category:</label>
                    <select name="parent_id" class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-1 border-indigo-400 border-opacity-50 focus:border-2 mb-3" id="parent_id">
                        <option value="" selected>No parent category</option>
                        @foreach($categories as $category)
                            <option value="{{ $category -> id }}">{{ $category -> name }}</option>
                        @endforeach
                    </select>
                    <div class="form-group">
                        <button class="btn btn-outline-success " type="submit">Add category</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


@stop