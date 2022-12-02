<div class="card profile-card border border-secondary bg-dark-l">
    <div class="card-body">
        <div class="nameBOx w-100 ">
            <div class="row no-gutters">
                <h4>
                    <a href="{{ route('vendor.show', $vendor) }}" style="color: black" class="flex text-uppercase text-light">
                        <i class="gg-profile icon-small text-gray-500 mr-2"></i><label class="font-bold">{{ $vendor -> username }}</label>
                    </a>
                </h4>
            </div>
            <div class="row mt-2">
                <div class="col-6 pl-3">
                    <div class="levelBox">
                        <p><span class="badge badge-sm @if($vendor->vendor->experience >= 0) badge-primary @else badge-danger @endif active" style="cursor:default">Level {{$vendor->vendor->getLevel()}}</span>
                            <span class="@if($vendor->vendor->experience < 0) text-danger @endif text-light">({{$vendor->vendor->getShortXP()}} XP)</span>
                        </p>
                    </div>
                    @if($vendor->vendor->isTrusted())
                    <p class="badge badge-success">Trusted vendor <span class="fa fa-check-circle"></span></p>
                    @endif
                    @if($vendor->vendor->isDwc())
                    <p class="badge badge-danger">Deal with caution <span class="fa fa-exclamation-circle"></span></p>
                    @endif

                </div>
                <div class="col-6">
                    <a href="{{ route('profile.messages').'?otherParty='.$vendor->username}}" style="white-space: nowrap;" class="btn btn-outline-success btn-sm"><span class="fas fa-envelope"></span> Send message</a>
                </div>
            </div>

            <div class="row mt-2">
                <div class="col-md-12">
                    <p class="mt-2 text-justify mb-0 text-gray-400">
                        {{$vendor->vendor->about}}
                        <!-- Lorem ipsum dolor sit amet consectetur adipisicing elit. Nam in ad incidunt inventore itaque expedita. -->
                    </p>
                </div>
            </div>
            <div class="col-12 mt-2">
                <div class="">
                    <div class="text-white leading-tight"><i class="fa fa-clock mr-2 text-gray-500"></i>Member since:
                        <span class="font-weight-semibold float-right">{{$vendor->memberSince()}}</span>
                    </div>

                    <div class="text-white leading-tight mt-2"><i class="fas fa-poop mr-2 text-gray-500"></i>Disputes in last year
                        <span class="float-right font-weight-bolder">
                            <span class="badge badge-success">
                                <i class="far fa-thumbs-up"></i>
                                <span class="badge badge-pill badge-light">{{$vendor->vendor->disputesLastYear(true)}}</span>
                            </span>
                            <span class="badge badge-danger">
                                <i class="far fa-thumbs-down"></i>
                                <span class="badge badge-pill badge-light">{{$vendor->vendor->disputesLastYear(false)}}</span>
                            </span>
                        </span>
                    </div>

                    <div class="text-white leading-tight mt-2"><i class="fas fa-star mr-2 text-gray-500"></i>Rated Orders:
                        <span class="font-weight-semibold float-right font-weight-bolder">{{$vendor->vendor->countFeedback()}}</span>
                    </div>
                </div>
                <div class="text-white leading-tight mt-2"><i class="fas fa-business-time mr-2 text-gray-500"></i>Vendor since:
                    <span class="font-weight-semibold float-right font-weight-bolder">{{$vendor->vendor->vendorSince()}}</span>
                </div>

                <div class="text-white leading-tight mt-2"><i class="fas fa-money-check-alt mr-2 text-gray-500"></i>Completed orders:
                    <span class="font-weight-semibold float-right font-weight-bolder">{{$vendor->vendor->completedOrders()}}</span>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col">
                <hr>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                @include('includes.vendor.feedback')
            </div>
        </div>

    </div>
</div>