#!/bin/bash

case "$1" in
"up")
echo "Starting containers.."
docker-compose -p trade -f ~/workspace/trade/docker-compose.yml up -d
;;
"down")
echo "Stopping containers..."
docker-compose -p trade -f ~/workspace/trade/docker-compose.yml down
;;
"restart")
echo "Restarting containers..."
docker-compose -p trade -f ~/workspace/trade/docker-compose.yml restart
;;
esac