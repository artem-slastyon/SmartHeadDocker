#!/bin/bash

function clone_frontend() {
	target_dir=~/workspace/trade/www/frontend
  if [[ ! -f $target_dir ]]; then
    echo "Clonning frontend";
    git clone https://gitlab.com/trade/site/frontend.git $target_dir
  fi
}

clone_frontend
