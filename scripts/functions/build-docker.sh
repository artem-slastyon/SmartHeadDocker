#!/bin/bash

echo "Starting build of docker containers..."

docker-compose -p trade -f ~/workspace/trade/docker-compose.yml build