<a href="{{route('vendor.show.feedback',['user'=>$vendor])}}" class="float-right text-light"><i class="fa fa-eye mr-2"></i>See all feedback</a>
<h5 class="mb-3 text-gray-500"><i class="far fa-thumbs-up"></i>Feedback ratings</h5>


<div class="row justify-content-around">
    <div class="">
        <span class="text-gray-400">Quality:</span><br>
        <span class="text-gray-400">Communication:</span><br>
        <span class="text-gray-400">Shipping:</span>
    </div>
    <div class="">
        <span class="text-gray-400">
            @include('includes.purchases.stars', ['stars' => $vendor -> vendor -> roundAvgRate('quality_rate')]) ({{ $vendor -> vendor -> avgRate('quality_rate') }})
        </span>
        <span class="text-gray-400"> <br>
            @include('includes.purchases.stars', ['stars' => $vendor -> vendor -> roundAvgRate('communication_rate')]) ({{ $vendor -> vendor -> avgRate('communication_rate') }})
        </span> <br>
        <span class="text-gray-400">
            @include('includes.purchases.stars', ['stars' => $vendor -> vendor -> roundAvgRate('shipping_rate')]) ({{ $vendor -> vendor -> avgRate('shipping_rate') }})
        </span>
    </div>
    <div class="col-12 mt-2">

        <div class="row text-md-center">
            <div class="col-4 text-light">
                <span class="fas fa-plus-circle text-success"></span> {{$vendor->vendor->countFeedbackByType('positive')}}
                Positive
            </div>
            <div class="col-4 text-light">
                <span class="fas fa-stop-circle text-secondary"></span> {{$vendor->vendor->countFeedbackByType('neutral')}}
                Neutral
            </div>
            <div class="col-4 text-light">
                <span class="fas fa-minus-circle text-danger"></span> {{$vendor->vendor->countFeedbackByType('negative')}}
                Negative
            </div>
        </div>
    </div>


</div>