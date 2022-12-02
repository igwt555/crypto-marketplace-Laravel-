<h3 class="mb-3"><i class="fa fa-tag mr-2"></i>Open new Support Ticket</h3>

<form action="{{ route('profile.tickets.new') }}" method="POST">
    {{ csrf_field()  }}
    <div class="form-group">
        <label for="title" class="text-gray-500"><i class="fa fa-edit mr-2"></i>Ticket title</label>
        <input type="text" name="title" class="appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" id="title" aria-describedby="title" placeholder="Enter ticket title">
    </div>
    <div class="form-group mb-0">
        <label for="text" class="text-gray-500"><i class="fa fa-comment mr-2"></i>Ticket message:</label>
        <textarea class="form-control appearance-none w-full rounded-md shadow-md bg-gray-700 px-3 text-gray-400 h-10 cursor-pointer mt-2 border-indigo-400 border-opacity-50 focus:border-2" name="message" id="title" rows="5" placeholder="Enter ticket content"></textarea>
    </div>

    <div class="form-group flex" style="justify-content: space-between;">
        <small class="form-text text-muted">Describe your problem with the market!</small>
        <button type="submit" class="btn btn-outline-primary mt-2">
            Open ticket
            <i class="far ml-2 fa-plus-square"></i>
        </button>
    </div>
</form>

