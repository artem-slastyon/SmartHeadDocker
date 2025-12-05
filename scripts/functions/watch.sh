#!/bin/bash

echo "Building frontend..."

docker-compose -p trade -f ~/workspace/trade/docker-compose.yml run -u user php8.4 bash -c "$(cat << EOF
. ~/.nvm/nvm.sh &&
cd /var/www/panel &&
npm install
npm run dev
EOF
)"