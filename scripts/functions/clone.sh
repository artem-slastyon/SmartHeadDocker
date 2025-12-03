#!/bin/bash

function clone_frontend() {
	target_dir=~/workspace/trade/www/panel
  if [[ ! -f $target_dir ]]; then
    echo "Clonning frontend";
    git clone https://gitlab.com/tenorium/trade/panel.git $target_dir
  fi
}

clone_frontend
