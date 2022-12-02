<?php


namespace App\Marketplace\Utility;
use App\ExchangeValue;
use DateTime;


class MoneroConvert
{
    const API_URL = "https://min-api.cryptocompare.com/data/price?fsym=XMR&tsyms=EUR";
    const API_URL_USD = "https://min-api.cryptocompare.com/data/price?fsym=XMR&tsyms=USD";
    const API_KEY = "25f09a3e2a5e0be8c5eaad53757280cdbbce9e603ae8ee1be6be067ba3e3be45";
    const EUR = "EUR";
    const USD = "USD";
    const XMR_TO_PICONERO = 1000000000000;

    public static function xmrToEur(float $amount){
        $date = new DateTime;
        $date->modify('-30 minutes');
        $formatted_date = $date->format('Y-m-d H:i:s');
        $savedValues = ExchangeValue::first();
        $savedValuesPassed = $savedValues->where('updated_at', '<=', $formatted_date)->first();
        if($savedValuesPassed){
            $rate = static::getRate(self::API_URL);
            $euroRate = json_decode($rate)->EUR;

            $savedValuesPassed -> XMR_EUR = $euroRate;
            $savedValuesPassed->save();
            return $amount * $euroRate;
        }
        else{
            return $amount * $savedValues->XMR_EUR;
        }
    }

    public static function xmrToUsd(float $amount){
        $date = new DateTime;
        $date->modify('-30 minutes');
        $formatted_date = $date->format('Y-m-d H:i:s');
        $savedValues = ExchangeValue::first();
        $savedValuesPassed = $savedValues->where('updated_at', '<=', $formatted_date)->first();
        if($savedValuesPassed){
            $rate = static::getRate(self::API_URL_USD);
            $usdRate = json_decode($rate)->USD;

            $savedValuesPassed -> XMR_USD = $usdRate;
            $savedValuesPassed->save();
            return $amount * $usdRate;
        }
        else{
            return $amount * $savedValues->XMR_USD;
        }
    }

    public static function eurToXmr(float $amount) {
        $date = new DateTime;
        $date->modify('-30 minutes');
        $formatted_date = $date->format('Y-m-d H:i:s');
        $savedValues = ExchangeValue::first();
        $savedValuesPassed = $savedValues->where('updated_at', '<=', $formatted_date)->first();
        if($savedValuesPassed){
            $rate = static::getRate(self::API_URL);
            $euroRate = json_decode($rate)->EUR;

            $savedValuesPassed -> XMR_EUR = $euroRate;
            $savedValuesPassed->save();
            return $amount / $euroRate;
        }
        else{
            return $amount / $savedValues->XMR_EUR;
        }
    }

    public static function usdToXmr(float $amount) {
        $date = new DateTime;
        $date->modify('-30 minutes');
        $formatted_date = $date->format('Y-m-d H:i:s');
        $savedValues = ExchangeValue::first();
        $savedValuesPassed = $savedValues->where('updated_at', '<=', $formatted_date)->first();
        if($savedValuesPassed){
            $rate = static::getRate(self::API_URL_USD);
            $usdRate = json_decode($rate)->USD;

            $savedValuesPassed -> XMR_USD = $usdRate;
            $savedValuesPassed->save();
            return $amount / $usdRate;
        }
        else{
            return $amount / $savedValues->XMR_USD;
        }
    }
    public static function toPicoNero($xmr) {
        return $xmr * self::XMR_TO_PICONERO;
    }
    public static function toXmr($piconero) {
        return $piconero / self::XMR_TO_PICONERO;
    }
    public static function piconeroToEur($piconero){
        return self::xmrToEur( self::toXmr($piconero));
    }

    public static function piconeroToUsd($piconero){
        return self::xmrToUsd( self::toXmr($piconero));
    }

    private static function getRate($currencyUrl)
    {
        // Create a stream
        $opts = [
            "http" => [
                "method" => "GET",
                "header" => "authorization: Apikey " . self::API_KEY
            ]
        ];

        // DOCS: https://www.php.net/manual/en/function.stream-context-create.php
        $context = stream_context_create($opts);

        return file_get_contents($currencyUrl, false, $context);
    }
}
