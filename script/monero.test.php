<?php

include "./includes/easybitcoin.php";
// $bitcoin = new Bitcoin('username','password');
$bitcoin = new Bitcoin('someusername','somepassword','0.0.0.0','8332');
// $bitcoin->getaddrinfo();
var_dump($bitcoin->looadwallet('mywallet'));

$address = $bitcoin->listreceivedbyaddress();

