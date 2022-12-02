<?php

namespace App\Http\Controllers\Auth;

use App\Exceptions\RequestException;
use App\Http\Requests\Auth\VerifySinginRequest;
use App\Http\Requests\Auth\SignInRequest;
use App\Marketplace\Encryption\Cipher;
use App\Marketplace\Encryption\DecryptionKey;
use App\Marketplace\Encryption\EncryptionKey;
use App\Marketplace\Encryption\Keypair;
use App\Marketplace\Utility\Captcha;
use App\Marketplace\Utility\OneClickCaptcha;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class LoginController extends Controller {

    private $oneClickcaptcha;
    public function __construct()
    {
        $this->oneClickcaptcha = new OneClickCaptcha();
    }

    /**
     * Show view for sign in
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function showSignIn() {

        return view('auth.signin')->with([
            // 'captcha' => Captcha::build()
        ]);
    }
    
    public function postSignIn(SignInRequest $request){
        $isHuman = $this->oneClickcaptcha->Verify($request);
        if(!$isHuman) {
            session() -> flash('errormessage', 'Captcha is not valid');
            return redirect()->back();
        }
        try{
            return $request -> persist();
        } catch (RequestException $e){
            session() -> flash('errormessage', $e -> getMessage());
            return redirect()->back();
        }
    }

    public function postSignOut(){
        auth()->logout();
        session()->flush();
        return redirect()->route('home');
    }

    /**
     * Display verify page
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function showVerify()
    {
        return view('auth.verify');
    }

    /**
     * Accepet the validation string
     *
     * @param VerifySinginRequest $request
     * @return \Illuminate\Http\RedirectResponse|void
     */
    public function postVerify(VerifySinginRequest $request)
    {
        try{
            return $request -> persist();
        }
        catch (RequestException $exception){
            session() -> flash('errormessage', $exception -> getMessage());
            return redirect() -> back();
        }
    }


    public function getCaptcha(){
        // $captcha = new OneClickCaptcha();
        // $this->oneClickcaptcha = $captcha;
        $this->oneClickcaptcha->Build();
        // var_dump($this->oneClickcaptcha->position[0])
    }
    
}

