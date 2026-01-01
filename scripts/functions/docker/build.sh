#!/bin/bash

echo "Starting build of docker containers..."

docker-compose -p {{projectCommand}} -f ~/workspace/{{projectCommand}}/docker-compose.yml build