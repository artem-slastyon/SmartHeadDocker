#!/bin/bash

service=$1
args=("${@:2}")

echo "Executing command... in $service"

docker-compose -p {{projectCommand}} -f ~/workspace/{{projectCommand}}/docker-compose.yml exec -u user -it "$service" bash "${args[@]}"