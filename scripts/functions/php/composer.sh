#!/bin/bash

docker-compose -p {{projectCommand}} -f ~/workspace/{{projectCommand}}/docker-compose.yml run --rm -u user php8.4 composer "$@"