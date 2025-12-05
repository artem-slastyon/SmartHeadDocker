#!/bin/bash

function clone_panel() {
	target_dir=~/workspace/trade/www/panel
  if [ ! -d $target_dir ]; then
    echo "Clonning panel";
    git clone https://gitlab.com/tenorium/trade/panel.git $target_dir
  else
    echo "Panel already exist"
  fi
}

clone_panel
