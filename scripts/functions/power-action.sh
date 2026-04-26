#!/bin/bash

args=("${@:2}")

case "$1" in
"up")
echo "Starting containers.."
docker-compose -p smarthead -f ~/workspace/smarthead/docker-compose.yml up -d "${args[@]}"
;;
"down")
echo "Stopping containers..."
docker-compose -p smarthead -f ~/workspace/smarthead/docker-compose.yml down "${args[@]}"
;;
"restart")
echo "Restarting containers..."
docker-compose -p smarthead -f ~/workspace/smarthead/docker-compose.yml restart "${args[@]}"
;;
esac