#!/bin/bash

docker-compose -p smarthead -f ~/workspace/smarthead/docker-compose.yml watch "$@"