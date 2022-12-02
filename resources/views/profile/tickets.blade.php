@extends('master.profile')

@section('page_title', 'Support')
@section('content')

    <div class="row">
        <div class="col-md-12">
            <h1 class="mb-3 font-bold text-gray-400 "><i class="fa fa fa-life-ring mr-2"></i>Support</h1>
            <!-- <hr> -->
            @include('includes.flash.error')
            @include('includes.flash.invalid')
        </div>

        <div class="col-md-3">
            <h3 class="mb-2"><i class="fas fa-ticket-alt mr-2"></i>Tickets</h3>

            <a href="{{ route('profile.tickets') }}" class="btn btn-block @if($ticket) btn-outline-primary @else btn-primary @endif my-2">
                <i class="fas fa-plus-circle mr-2"></i>
                New ticket
            </a>

            @if(auth() -> user() -> tickets() -> exists())
                <div class="list-group flex-md-column flex-row nav-pills justify-content-sm-center">
                @foreach(auth() -> user() -> tickets as $currTicket)
                    
                    <a href="{{ route('profile.tickets', $currTicket) }}" class="@if($currTicket == $ticket) active @endif">
                        <label for="new" class=" text-sm rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400 border-gray-800 border-2 hover:border-opacity-50 hover:border-indigo-400 shadow-md py-1 px-3 w-full flex cursor-pointer  " style="display: flex; justify-content: space-between; ">
                            <label>
                                <i class="fas fa-ticket-alt mr-2"></i>
                                {{ $currTicket -> title }}
                            </label>
                            @if($currTicket -> solved)
                                <span class="badge badge-success">Solved</span>
                            @else
                                @if($currTicket -> answered)
                                    <span class="badge badge-warning">Answered</span>
                                @endif
                            @endif
                        </label>
                    </a>
                @endforeach
                </div>
            @else
                <div class="alert alert-warning text-center">
                    Your ticket list is empty!
                </div>
            @endif

        </div>
        <div class="col-md-9">
            @if($ticket)
                @include('includes.profile.ticket')
            @else
                @include('includes.profile.newticket')
            @endif
        </div>
    </div>

@stop