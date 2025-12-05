#!/bin/bash

docker-compose -p trade -f ~/workspace/trade/docker-compose.yml run --rm -u user php8.4 composer "$@"