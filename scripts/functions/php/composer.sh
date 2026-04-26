#!/bin/bash

docker-compose -p smarthead -f ~/workspace/smarthead/docker-compose.yml run --rm -u user php8.4 composer "$@"