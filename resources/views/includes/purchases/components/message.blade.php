<div class="col-md-6 shadow-md mt-3 pt-3 pb-3 rounded-md bg-gray-800 text-gray-500 duration-200 transition-colors hover:text-gray-400">
    <h3 class="my-2" id="message"><i class="far fa-comment-dots mr-2"></i>Message for vendor</h3>
    <hr>
    <p class="text-muted mb-2">Encrypted with vendor's PGP key.</p>
    <textarea rows="10" readonly class="form-control">{{ $purchase -> message }}</textarea>
</div>