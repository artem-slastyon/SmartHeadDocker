#!/bin/bash

docker-compose -p trade -f ~/workspace/trade/docker-compose.yml exec -it php8.4 composer "$@"