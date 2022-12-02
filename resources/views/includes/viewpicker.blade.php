@if($productsView == 'list')
    <span class="viewpicker mr-2 text-light"><i class="fas fa-list"></i></span>
    <a href="{{ route('setview', 'grid') }}" class="viewpicker p-md-0 p-2 text-dark"><i class="fas fa-th"></i></a>
@else
    <a href="{{ route('setview', 'list') }}" class="viewpicker p-md-0 p-2 mr-2 text-dark"><i class="fas fa-list"></i></a>
    <span class="viewpicker text-light"><i class="fas fa-th"></i></span>
@endif