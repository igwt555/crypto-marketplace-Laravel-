<div class="form-group  mt-3 text-center">
    <input type="image" src="{{ route('auth.getCaptcha') }}" name="position[]"/>
    @error('captcha',$errors)
    <p class="text-danger">{{$errors->first('captcha')}}</p>
    @enderror
    <label class="flex items-center mt-3" for="login-capture"> <i class="gg-bulb mr-2 text-gray-600 icon-smaller mb-1"></i> <span class="text-gray-500 text-xs">Click the circle with a cut to continue.</span> </label>

</div>