<?php

namespace App\Marketplace\Utility;

// use Gregwar\Captcha\CaptchaBuilder;
use OneClickCaptcha\Service\OneClickCaptchaServiceFactory;
use OneClickCaptcha\Config\Config;

/**
 * Creating and Verifying Captcha
 */
class OneClickCaptcha
{
    private $oneClickCaptcha;
    
    public function __construct()
    {
        $config = new Config();
        $OneClickCaptchaServiceFactory = new OneClickCaptchaServiceFactory();
        $config->setCircleAmount(4);
        $config->setCircleSize(20);
        $config->setBackgroundWidth(250);
        $config->setBackgroundHeight(40);
        $config->setBackgroundColor('#2d3748');
        $this->oneClickCaptcha = $OneClickCaptchaServiceFactory->getOneClickCaptchaUsingConfig($config);


    }
    public function Build()
    {
        $this->oneClickCaptcha->showCaptcha();
    }
    public function Verify($input)
    {
        if (isset($input->position[0], $input->position[1])) {
            if (true === $this->oneClickCaptcha->validate($input->position[0], $input->position[1])) {
                return true;
            } else {
                return false;
            }
        }

        return false;
    }
}
