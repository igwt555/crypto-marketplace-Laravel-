<div class="row mt-3 px-3">
    <div class="w-full bg-gray-900 rounded-md shadow-md mt-1">
        <div class="p-1 bg-gray-800 rounded-t-md flex">
            <div class="text-gray-500 font-semibold col-md-4">Feedback</div>
            <div class="text-gray-500 text-left col-md-4">From</div>
            <div class="text-gray-500 text-left col-md-4">When</div>
        </div>

        @foreach($feedback as $fb)
        <div class="p-1 flex border-gray-850 @if(!$loop->last) border-dashed border-b @endif">
            <div class="text-gray-500 col-md-3">
                <span>@include('includes.vendor.feedback_icon',$fb){{$fb->comment}}</span>@if($fb->isLowValue()) <span class="badge badge-warning">Low value</span> @endif<br>
                <span class="text-muted">{{$fb->product_name}}</span>
            </div>
            <div class="text-gray-500 col-md-3">
                <span>Buyer: {{$fb->getHiddenBuyerName()}}</span><br>
                <span class="text-muted">US ${{$fb->product_value}}</span>
            </div>
            <div class="text-gray-500 col-md-3">
                {{$fb->getLeftTime()}}
            </div>
        </div>
        @endforeach

    </div>
    {{$feedback->links()}}
</div>