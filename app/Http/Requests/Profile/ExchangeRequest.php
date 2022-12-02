<?php

namespace App\Http\Requests\Profile;

use App\Exceptions\RequestException;
use Defuse\Crypto\Crypto;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Hash;
use App\Marketplace\Payment\BitcoinPayment;
use App\Deposit;

class ExchangeRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'coin' => 'required|string',
            'balance' => 'required'
        ];
    }


    public function total()
    {
        $coin = $this->coin;
        $balance = $this->balance;
        $total = 0;
        $fee = 0;
        $receive = 0;
        $fee_rate = 0.0;

        if(array_key_exists($coin, config('coins.coin_list')) && $balance > 0) {
            try {
                switch ($coin) {
                    case 'btc':
                        $btc = new BitcoinPayment();
                        $total = $btc->coinToUsd($balance);
                        break;
                    case 'xmr':
                        break;
                    case 'usd':
                        break;
                    default:
                        # code...
                        break;
                }  
            } catch (Exception $e) {
                throw new RequestException("Some error occured!");
            }
            
        } else {
            return redirect()->back();

        }
        return $total;
    }

    public function fee($total, $fee_rate)
    {
        $fee = $total * $fee_rate * 0.01 ;
        $fee =  round($fee, 5, PHP_ROUND_HALF_DOWN);
        return $fee;
    }

    public function feeRate(){
        $feeRate = 3.0;
            $feeRate = (\Illuminate\Support\Facades\Blade::check('vendor')) ? 
            config('marketplace.vender_exchange_fee_percent') : 
            config('marketplace.buyer_exchange_fee_percent');
        return $feeRate;
        // var_dump(auth()->user());die();
        // if(auth()->user()->vendor)   
    }

    public function receive($total, $fee){
        $receive = round(($total - $fee), 5, PHP_ROUND_HALF_DOWN);
        return $receive;
    }

    
}
