#!/bin/bash

echo "Updating/Inserting alias..."

if [ -f "$HOME/.bashrc" ]; then
    sed -i '/#Trade/d' ~/.bashrc
    echo "source \$HOME/workspace/trade/scripts/trade_completion.sh #Trade" >> ~/.bashrc
fi
    
if [ -f "$HOME/.zshrc" ]; then
    sed -i '/#Trade/d' ~/.zshrc
    echo "source \$HOME/workspace/trade/scripts/trade_completion.sh #Trade" >> ~/.zshrc
fi

echo "Updating /etc/hosts... (need privileged access)"
sudo sed -i '/#Trade/d' /etc/hosts
echo "127.0.0.1 trade.tenorium.local #Trade" | sudo tee -a /etc/hosts >> /dev/null

FUNCTIONS_PATH="$( dirname -- "$0";)"
MAIN_SCRIPT_PATH="$( dirname -- "$FUNCTIONS_PATH";)/trade.sh"

$MAIN_SCRIPT_PATH clone
$MAIN_SCRIPT_PATH up
$MAIN_SCRIPT_PATH composer install -o
$MAIN_SCRIPT_PATH artisan migrate --seed
$MAIN_SCRIPT_PATH build