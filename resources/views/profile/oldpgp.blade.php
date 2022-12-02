@extends('master.profile')

@section('profile-content')

    @include('includes.flash.error')

    <div class=" rounded-md bg-gray-900 px-3 py-2 pb-4">
        <h1 class="mb-3"><i class="fa fa-key mr-2"></i>Your old PGP keys:</h1>
        <hr>
        @if($keys -> isNotEmpty())
            @foreach($keys as $pgp)
                <div class="form-group">
                    <textarea class="form-control disabled" rows="10" style="resize: none;" disabled readonly>{{{ $pgp -> key }}}</textarea>
                    <p class="text-muted">Used until {{ $pgp -> timeUntil() -> diffForHumans() }}.</p>
                </div>

            @endforeach
        @else
            <div class="alert-warning px-2 py-2 rounded-md">You don't have previous PGP keys.</div>
        @endif
        
    </div>


@stop