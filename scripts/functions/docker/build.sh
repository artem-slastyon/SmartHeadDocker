#!/bin/bash

echo "Starting build of docker containers..."

docker-compose -p smarthead -f ~/workspace/smarthead/docker-compose.yml build