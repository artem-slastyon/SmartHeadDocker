#!/bin/bash

echo "Updating/Inserting alias..."

if [ -f "$HOME/.bashrc" ]; then
    sed -i '/#Tenorium/d' ~/.bashrc
    echo "source \$HOME/workspace/tenorium/scripts/tenorium_completion.sh #Tenorium" >> ~/.bashrc
fi
    
if [ -f "$HOME/.zshrc" ]; then
    sed -i '/#Tenorium/d' ~/.zshrc
    echo "source \$HOME/workspace/tenorium/scripts/tenorium_completion.sh #Tenorium" >> ~/.zshrc
fi

echo "Updating /etc/hosts... (need privileged access)"
sudo sed -i '/#Tenorium/d' /etc/hosts
echo "127.0.0.1 api.tenorium.local tenorium.local #Tenorium" | sudo tee -a /etc/hosts >> /dev/null
