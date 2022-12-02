<div class="row mt-2">
    <div class="col-md-6">
        <label for="Recent">
            <i class="fa fa-clock mr-2"></i>
            <span class="text-gray-400">Recent feedback ratings</span>
        </label>

        <div class="bg-gray-900 rounded-md shadow-md mt-1">
            <div class="p-1 bg-gray-800 rounded-t-md flex">
                <div class="text-gray-500 font-semibold col-md-3">Feedback</div>
                <div class="text-gray-500 text-left col-md-3">1 month</div>
                <div class="text-gray-500 text-left col-md-3">6 month</div>
                <div class="text-gray-500 col-md-3 text-left">All time</div>
            </div>

            <div class="p-1 flex border-gray-850 border-dashed border-b">
                <div class="text-gray-500 col-md-3">
                    <span class="fas fa-plus-circle text-success"></span> Positive
                </div>
                <div class="text-gray-500 col-md-3">
                    {{$vendor->vendor->countFeedbackByType('positive',1)}}
                </div>
                <div class="text-gray-500 col-md-3">
                    {{$vendor->vendor->countFeedbackByType('positive',6)}}
                </div>
                <div class="text-gray-500 col-md-3">
                    {{$vendor->vendor->countFeedbackByType('positive')}}
                </div>
            </div>
            <div class="p-1 flex border-gray-850 border-dashed border-b">
                <div class="text-gray-500 col-md-3">
                    <span class="fas fa-stop-circle text-secondary"></span>  Neutral
                </div>
                <div class="text-gray-500 col-md-3">
                    {{$vendor->vendor->countFeedbackByType('neutral',1)}}
                </div>
                <div class="text-gray-500 col-md-3">
                    {{$vendor->vendor->countFeedbackByType('neutral',6)}}
                </div>
                <div class="text-gray-500 col-md-3">
                    {{$vendor->vendor->countFeedbackByType('neutral')}}
                </div>
            </div>
            <div class="p-1 flex border-gray-850 ">
                <div class="text-gray-500 col-md-3">
                    <span class="fas fa-minus-circle text-danger"></span> Negative
                </div>
                <div class="text-gray-500 col-md-3">
                    {{$vendor->vendor->countFeedbackByType('negative',1)}}
                </div>
                <div class="text-gray-500 col-md-3">
                    {{$vendor->vendor->countFeedbackByType('negative',6)}}
                </div>
                <div class="text-gray-500 col-md-3">
                    {{$vendor->vendor->countFeedbackByType('negative')}}
                </div>
            </div>
        </div>
    </div>


    <div class="col-md-6">
        <label for="Recent">
            <i class="fa fa-info-circle mr-2"></i>
            <span class="text-gray-400">Detailed vendor ratings</span>
        </label>

        <div class="bg-gray-900 rounded-md shadow-md mt-1">
            <div class="p-1 bg-gray-800 rounded-t-md flex">
                <div class="text-gray-500 font-semibold col-md-4">Criteria</div>
                <div class="text-gray-500 text-left col-md-4">Average rating</div>
                <div class="text-gray-500 text-left col-md-4">Score</div>
            </div>

            <div class="p-1 flex border-gray-850 border-dashed border-b">
                <div class="text-gray-500 col-md-3">
                    Quality
                </div>
                <div class="text-gray-500 col-md-3">
                    @include('includes.purchases.stars', ['stars' =>  $vendor -> vendor -> avgRate('quality_rate')])
                </div>
                <div class="text-gray-500 col-md-3">
                    {{ $vendor ->vendor-> avgRate('quality_rate') }}
                </div>
            </div>
            <div class="p-1 flex border-gray-850 border-dashed border-b">
                <div class="text-gray-500 col-md-3">
                    Communication
                </div>
                <div class="text-gray-500 col-md-3">
                    @include('includes.purchases.stars', ['stars' =>  $vendor -> vendor -> avgRate('communication_rate')])
                </div>
                <div class="text-gray-500 col-md-3">
                    {{ $vendor ->vendor-> avgRate('communication_rate') }}
                </div>
            </div>
            <div class="p-1 flex border-gray-850 ">
                <div class="text-gray-500 col-md-3">
                    Shipping
                </div>
                <div class="text-gray-500 col-md-3">
                    @include('includes.purchases.stars', ['stars' =>  $vendor -> vendor -> avgRate('shipping_rate')])
                </div>
                <div class="text-gray-500 col-md-3">
                    {{ $vendor ->vendor-> avgRate('shipping_rate') }}
                </div>
            </div>
        </div>
    </div>
</div>