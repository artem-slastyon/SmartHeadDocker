#!/bin/bash

function clone_frontend() {
	target_dir=~/workspace/tenorium/www/frontend
  if [[ ! -f $target_dir ]]; then
    echo "Clonning frontend";
    git clone https://gitlab.com/tenorium/site/frontend.git $target_dir
  fi
}

clone_frontend
