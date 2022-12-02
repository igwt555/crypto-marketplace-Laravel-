<div class="rounded-md bg-gray-900 px-3 py-2 mt-3">

    <h3><i class="fa fa-add mr-2"></i>Add product</h3>
    <hr>
    <div class="card-deck">
        <div class="card">
            <h5 class="card-header"><i class="fas fa-shopping-bag"></i> Physical product</h5>
            <div class="card-body text-center">
                <p class="card-text">Physical products includes shipping options.</p>
                <a href="{{ route('profile.vendor.product.add') }}" class="btn btn-primary">Add physical product</a>
            </div>
        </div>
        <div class="card">
            <h5 class="card-header"><i class="fas fa-compact-disc"></i>
                Digital product</h5>
            <div class="card-body text-center">
                <p class="card-text">Digital products can be delivered automatically and they don't have shipping options.</p>
                <a href="{{ route('profile.vendor.product.add', 'digital') }}" class="btn btn-primary">Add digital product</a>
            </div>
        </div>
    </div>
</div>