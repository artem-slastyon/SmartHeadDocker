#!/bin/bash

echo "Updating/Inserting alias..."

if [ -f "$HOME/.bashrc" ]; then
    sed -i '/#SmartHead/d' ~/.bashrc
    echo "source \$HOME/workspace/smarthead/scripts/main_completion.sh #SmartHead" >> ~/.bashrc
fi
    
if [ -f "$HOME/.zshrc" ]; then
    sed -i '/#SmartHead/d' ~/.zshrc
    echo "source \$HOME/workspace/smarthead/scripts/main_completion.sh #SmartHead" >> ~/.zshrc
fi

echo "Updating /etc/hosts... (need privileged access)"
sudo sed -i '/#SmartHead/d' /etc/hosts
echo "127.0.0.1 smarthead.tenorium.local #SmartHead" | sudo tee -a /etc/hosts >> /dev/null

FUNCTIONS_PATH="$( dirname -- "$0";)"
MAIN_SCRIPT_PATH="$( dirname -- "$FUNCTIONS_PATH";)/main.sh"

$MAIN_SCRIPT_PATH clone
$MAIN_SCRIPT_PATH mkcert smarthead.tenorium.local
$MAIN_SCRIPT_PATH up
$MAIN_SCRIPT_PATH docker exec php8.4 -c "cp .env.docker .env"
$MAIN_SCRIPT_PATH composer install -o
$MAIN_SCRIPT_PATH artisan migrate --seed
$MAIN_SCRIPT_PATH build