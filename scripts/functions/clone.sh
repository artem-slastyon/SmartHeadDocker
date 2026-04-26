#!/bin/bash

function clone_site() {
	target_dir=~/workspace/smarthead/www/site
  if [ ! -d $target_dir ]; then
    echo "Clonning site";
    git clone https://github.com/artem-slastyon/SmartHeadTest.git $target_dir
  else
    echo "site already exist"
  fi
}

clone_site
