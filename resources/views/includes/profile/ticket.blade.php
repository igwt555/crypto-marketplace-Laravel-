<h3 class="mb-3"><i class="fa fa-tag mr-2"></i>Ticket: {{ $ticket -> title }}</h3>
@if(!$ticket -> solved)
<form method="POST" action="{{ route('profile.tickets.message.new', $ticket) }}">
    {{ csrf_field() }}

    <div class="form-group mb-0">
        <label for="text"><h4 class="text-gray-500"><i class="fa fa-edit mr-2"></i>New ticket message:</h4></label>
        <textarea class="form-control appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" name="message" id="title" rows="5" placeholder="Enter ticket content"></textarea>
    </div>

    <div class="form-group text-right flex" style="justify-content: space-between;">
        <small class="form-text text-muted mb-0">Post new message!</small>
        <div class="mt-2">
            @hasAccess('tickets')
            <a href="{{ route('admin.tickets.solve', $ticket) }}" class="btn btn-warning">
                Solve Ticket
            </a>
            @endhasAccess
            <button type="submit" class="btn btn-outline-success">
                Post message
                <i class="far ml-2 fa-comment-alt"></i>
            </button>
        </div>
    </div>
</form>
@else
    <div class="alert text-center alert-success">
        This ticket is solved!
        @hasAccess('tickets')
        <a href="{{ route('admin.tickets.solve', $ticket) }}" class="btn btn-outline-danger btn-sm">Unsolve</a>
        @endhasAccess
    </div>
@endif
@foreach($replies as $reply)

    <div class="card my-2">
        <div class="card-body">
            <p class="card-text text-gray-400">
                {{ $reply -> text }}
            </p>
        </div>
        <div class="card-footer text-right py-1">
            <small><span class="text-gray-500">{{ $reply -> time_passed }}</span>
            by <strong class="text-gray-400">{{ $reply -> user -> username }}</strong></small>
        </div>
    </div>

@endforeach

{{ $replies-> links('includes/paginate') }}
