#!/bin/bash

echo "Updating/Inserting alias..."

current_shell=$(basename "$0")

if [ -f "$HOME/.bashrc" ]; then
    sed -i '/#Tenorium/d' ~/.bashrc
    echo "alias tenorium='~/workspace/tenorium/scripts/tenorium.sh' #Tenorium" >> ~/.bashrc
fi
    
if [ -f "$HOME/.zshrc" ]; then
    sed -i '/#Tenorium/d' ~/.bashrc
    echo "alias tenorium='~/workspace/tenorium/scripts/tenorium.sh' #Tenorium" >> ~/.zshrc
fi

echo "Updating /etc/hosts... (need privileged access)"
sudo sed -i '/#Tenorium/d' /etc/hosts
echo "127.0.0.1 api.tenorium.local tenorium.local #Tenorium" | sudo tee -a /etc/hosts >> /dev/null
