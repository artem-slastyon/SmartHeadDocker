#!/bin/bash

function clone_sample() {
	target_dir=~/workspace/{{projectCommand}}/www/sample
  if [ ! -d $target_dir ]; then
    echo "Clonning sample";
    #git clone sampleUrl $target_dir
  else
    echo "sample already exist"
  fi
}

clone_sample
