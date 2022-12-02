<?php


namespace App\Marketplace\Utility;

use Illuminate\Support\Facades\Cache;
use App\ExchangeValue;
use DateTime;


/**
 * Class for bitcoin convert to usd and backwards
 *
 * Class BitcoinConverter
 * @package App\Marketplace\Utility
 */
class BitcoinConverter
{

    /**
     * Returns the float amount of the usd
     *
     * @return float
     */
    public static function usdToBtc(float $amount): float
    {
        $date = new DateTime;
        $date->modify('-30 minutes');
        $formatted_date = $date->format('Y-m-d H:i:s');
        $savedValues = ExchangeValue::first();
        $savedValuesPassed = $savedValues->where('updated_at', '<=', $formatted_date)->first();
        if($savedValuesPassed){
            $btcprice = Cache::remember('btc_price',config('coins.caching_price_interval'),function(){
                // get bitcoin price
                $url = "https://blockchain.info/ticker";
                $json = json_decode(file_get_contents($url), true);
                $btcUsd = $json["USD"]["last"];
                return $btcUsd;
            });

            $savedValuesPassed -> BTC_USD = $btcprice;
            $savedValuesPassed->save();
            return $amount / $btcprice;
        }
        else{
            return $amount / $savedValues->BTC_USD;
        }
    }


    /**
     * Returns amount of btc converted from usd
     *
     * @param $amount
     * @return float
     */
    public static function btcToUsd(float $amount) : float
    {
        $date = new DateTime;
        $date->modify('-30 minutes');
        $formatted_date = $date->format('Y-m-d H:i:s');
        $savedValues = ExchangeValue::first();
        $savedValuesPassed = $savedValues->where('updated_at', '<=', $formatted_date)->first();
        if($savedValuesPassed){
            $btcprice = Cache::remember('btc_price',config('coins.caching_price_interval'),function(){
                // get bitcoin price
                $url = "https://blockchain.info/ticker";
                $json = json_decode(file_get_contents($url), true);
                $btcUsd = $json["USD"]["last"];
                return $btcUsd;
            });

            $savedValuesPassed -> BTC_USD = $btcprice;
            $savedValuesPassed->save();
            return $amount * $btcprice;
        }
        else{
            return $amount * $savedValues->BTC_USD;
        }
    }

    public static function satoshiToBtc(int $satoshi) : float
    {
        return $satoshi / 100000000;
    }

}