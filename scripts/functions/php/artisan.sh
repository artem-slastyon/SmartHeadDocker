#!/bin/bash

docker-compose -p trade -f ~/workspace/trade/docker-compose.yml exec -u user -it php8.4 php artisan "$@"