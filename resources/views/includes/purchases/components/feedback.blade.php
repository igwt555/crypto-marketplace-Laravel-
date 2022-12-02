<div class="col-md-12 pl-0 mt-3">
    <div class="col-md-12 shadow-md pt-3 pb-3 rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400">
        
        {{-- Feedback --}}
        @if($purchase -> isDelivered() && $purchase -> isBuyer() && !$purchase -> hasFeedback())
            <tr>
                <td colspan="2" class="">
                    <h4><i class="fas fa-quote-left mr-2"></i>Leave feedback</h4>
                    <hr>
                    <form action="{{ route('profile.purchases.feedback.new', $purchase) }}" method="POST">
                        {{ csrf_field() }}
                        <div class="form-row">
                            <div class="col-md-3 text-left">
                                <label for="quality_rate">Quality:</label>
                                <select name="quality_rate" id="quality_rate" class="form-control">
                                    @for($i=1; $i<=5; $i++)
                                        <option value="{{ $i }}">
                                            {{ $i }} {{ Illuminate\Support\Str::plural('star', $i) }}
                                        </option>
                                    @endfor
                                </select>

                                <label for="communication_rate" class="mt-2">Communication:</label>
                                <select name="communication_rate" id="communication_rate" class="form-control">
                                    @for($i=1; $i<=5; $i++)
                                        <option value="{{ $i }}">
                                            {{ $i }} {{ Illuminate\Support\Str::plural('star', $i) }}
                                        </option>
                                    @endfor
                                </select>
                                <label for="shipping_rate" class="mt-2">Shipping:</label>
                                <select name="shipping_rate" id="shipping_rate" class="form-control">
                                    @for($i=1; $i<=5; $i++)
                                        <option value="{{ $i }}">
                                            {{ $i }} {{ Illuminate\Support\Str::plural('star', $i) }}
                                        </option>
                                    @endfor
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label for="type">Type:</label>
                                <select name="type" id="type" class="form-control">
                                    <option value="positive">Positive</option>
                                    <option value="neutral" selected>Neutral</option>
                                    <option value="negative">Negative</option>
                                </select>
                            </div>
                            <div class="col-md-6 ">
                                <label for="comment">Comment:</label>
                                <textarea name="comment" id="comment" rows="5" class="form-control"
                                          placeholder="Place your comment here"></textarea>
                                <button type="submit" class="btn btn-block btn-outline-primary mt-4">Leave
                                    feedback
                                </button>
                            </div>
                        </div>


                    </form>
                </td>
            </tr>

        @elseif($purchase -> isDelivered() && $purchase -> hasFeedback())
            <tr>
                <td colspan="2">
                    <h4><i class="fas fa-quote-left mr-2"></i>Feedback by buyer</h4>
                    <hr>
                    <ul class="list-group ">
                        <li class="list-group-item bg-gray-800">
                            Qualtiy:
                            @include('includes.purchases.stars', ['stars' => $purchase -> feedback -> quality_rate])
                        </li>
                        <li class="list-group-item bg-gray-800">
                            Shipping:
                            @include('includes.purchases.stars', ['stars' => $purchase -> feedback -> shipping_rate])
                        </li>
                        <li class="list-group-item bg-gray-800">
                            Communication:
                            @include('includes.purchases.stars', ['stars' => $purchase -> feedback -> communication_rate])
                        </li>
                        <li class="list-group-item bg-gray-800">
                            Type:
                            {{ $purchase->feedback->getType() }}
                        </li>
                        <li class="list-group-item text-center bg-gray-800">
                            <i class="fas fa-quote-left mr-2"></i>{{ $purchase -> feedback -> comment }}<i class="fas fa-quote-left ml-2"></i>
                        </li>
                    </ul>
                </td>
            </tr>
        @endif
    </div>

</div>