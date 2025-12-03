#!/bin/bash

echo "Building frontend..."

docker-compose -p trade -f ~/workspace/trade/docker-compose.yml run nodejs bash -c "$(cat << EOF
cd /var/www/trade &&
npm install
npm run dev
EOF
)"