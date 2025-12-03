#!/bin/bash

service=$1
args=${*:2}

echo "Executing command... in $service"

docker-compose -p trade -f ~/workspace/trade/docker-compose.yml exec -it bash "$args"