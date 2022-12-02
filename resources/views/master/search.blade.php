
<div class="">
    <div class="container p-0" >
            <div class="">
                <form action="{{route('search')}}" method="POST" class="form-inline h-100">
                    {{csrf_field()}}
                    <div class="input-group w-100">
                        <input type="text" class="form-control form-control bg-dark-l text-light" id="search" name="search" placeholder="Search for something..." value="{{app('request')->input('query')}}">
                        <div class="input-group-append">
                            <button class="btn border bg-dark text-light"><i class="fas fa-search"></i></button>
                        </div>
                    </div>
                </form>
            </div>
    </div>
</div>