#!/bin/bash

echo "Updating/Inserting alias..."

if [ -f "$HOME/.bashrc" ]; then
    sed -i '/#{{projectName}}/d' ~/.bashrc
    echo "source \$HOME/workspace/{{projectCommand}}/scripts/main_completion.sh #{{projectName}}" >> ~/.bashrc
fi
    
if [ -f "$HOME/.zshrc" ]; then
    sed -i '/#{{projectName}}/d' ~/.zshrc
    echo "source \$HOME/workspace/{{projectCommand}}/scripts/main_completion.sh #{{projectName}}" >> ~/.zshrc
fi

echo "Updating /etc/hosts... (need privileged access)"
sudo sed -i '/#{{projectName}}/d' /etc/hosts
echo "127.0.0.1 {{projectCommand}}.tenorium.local #{{projectName}}" | sudo tee -a /etc/hosts >> /dev/null

FUNCTIONS_PATH="$( dirname -- "$0";)"
MAIN_SCRIPT_PATH="$( dirname -- "$FUNCTIONS_PATH";)/main.sh"

$MAIN_SCRIPT_PATH clone
$MAIN_SCRIPT_PATH mkcert {{projectCommand}}.tenorium.local
$MAIN_SCRIPT_PATH composer install -o
$MAIN_SCRIPT_PATH artisan migrate --seed
$MAIN_SCRIPT_PATH build