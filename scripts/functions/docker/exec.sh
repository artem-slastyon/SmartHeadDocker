#!/bin/bash

service=$1
args=("${@:2}")

echo "Executing command... in $service"

docker-compose -p smarthead -f ~/workspace/smarthead/docker-compose.yml exec -u user -it "$service" bash "${args[@]}"