## Crypto Marketplace

### Tech specs for Laravel based gift card marketplace using crypto as currency via deposit into custom generated blockchain address which translates into a user balance

# Requirements
## PHP Extensions
-  sodium   (Message encryptuon)
-  gmp (Precision calculation)
-  curl (http requests)
-  gmp
-  mbstring
## Mysql 8+ installed
## Additional services
- Bitcoind (Processing btc transactions)
- Monerod (Processing xmr)
- Elasticsearch (Searching through records)

## Dev Install Instructions:
## - composer update;
- composer install;
- cp .env.example .env
- --- UPDATE .env as required ---
- php artisan migrate
- nohup php artisan serve --host 0.0.0.0 --port 8000 &

composer-graph.pdf

## Possible setup hickups
### With either Bitcoind or Monerod
Please use acceessible config files in commonly found locations (i.e. `~/.bitcoin/bicoin.conf`).
Some configs to consider for bitcoin.conf
 - In case using localhost for daemons use 0.0.0.0 for ip
 - Make sure you specify the wallet file name

## WIP: containerization with docker for dev
## WIP: orchestration with k8 for prod
