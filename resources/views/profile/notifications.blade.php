@extends('master.profile')

@section('title', 'Notifications')

@section('profile-content')
    @include('includes.flash.success')
    @include('includes.flash.error')

    <div class="rounded-md bg-gray-900 px-3 py-4">
        <h1 class="mb-3"><i class="far fa-bell mr-2"></i>Notifications</h1>
        <hr>
        <h5 class="flex" style="justify-content: space-between;">
            <div>
                List of your notifications. You can delete them any time
            </div>
            <form action="{{route('profile.notifications.delete')}}" method="post" >
                {{csrf_field()}}
                    <button type="submit" class="btn btn-outline-danger"><i class="fa fa-trash"></i> Delete notifications
                    </button>
            </form>
        </h5>
        <hr>
        <div class="row ">
            @if($notifications -> isNotEmpty())
            <div class="p-1 bg-gray-800 rounded-t-md flex col-md-12">
                <div class="ml-2 text-gray-500 font-semibold col-md-8">Notification</div>
                <div class="ml-2 text-gray-500 text-center col-md-2">Time</div>
                <div class="ml-2 text-gray-500 text-center col-md-2">Action</div>
            </div>
            @foreach($notifications as $notification)

            <div class="p-1 flex border-gray-850 @if(!$loop->last) border-dashed border-b @endif  col-md-12">
                <div class="ml-2 text-gray-500 col-md-8">{{$notification->description}}</div>
                <div class="ml-2 text-gray-500 text-center col-md-2">{{$notification->created_at->diffForHumans()}}</div>
                <div class="ml-2 text-gray-500 text-center col-md-2">
                    @if($notification->getRoute() !== null )
                        <a href="{{route($notification->getRoute(),$notification->getRouteParams())}}" class="btn btn-outline-secondary"><i class="fa fa-eye"></i> View</a>
                    @else
                        None
                    @endif
                </div>
                
            </div>
            @endforeach
            <div class="mt-3 ml-2">
                {{ $notifications -> links() }}
            </div>

            @else
            <div class="alert text-center alert-warning">Notification list is empty!</div>
            @endif
        </div>
    </div>

@stop