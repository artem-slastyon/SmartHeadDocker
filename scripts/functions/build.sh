#!/bin/bash

echo "Building frontend..."

docker-compose -p tenorium -f ~/workspace/tenorium/docker-compose.yml run nodejs bash -c "$(cat << EOF
cd /var/www/frontend &&
npm install
npm run dev
EOF
)"