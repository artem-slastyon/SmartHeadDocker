#!/bin/bash

docker-compose -p trade -f ~/workspace/trade/docker-compose.yml watch "$@"