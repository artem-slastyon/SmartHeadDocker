#!/bin/bash

docker-compose -p {{projectCommand}} -f ~/workspace/{{projectCommand}}/docker-compose.yml watch "$@"