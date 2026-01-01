#!/bin/bash

echo "Building frontend..."

docker-compose -p {{projectCommand}} -f ~/workspace/{{projectCommand}}/docker-compose.yml run --rm -u user php8.4 bash -c "$(cat << EOF
. ~/.nvm/nvm.sh &&
cd /var/www/sample &&
npm install
npm run build
EOF
)"