#!/bin/bash

help=$(cat << 'EOF'
Tenorium Trade

\e[1;32mbuild\e[0m - build project
\e[1;32mbuild-docker\e[0m - build docker containers
\e[1;32mup\e[0m - start containers
\e[1;32mdown\e[0m - stop containers
\e[1;32mrestart\e[0m - restart containers
\e[1;32msetup\e[0m - setup/update environment\n
\e[1;32mclone\e[0m - clone repositories
\e[1;32mgit\e[0m - run git command for each repository
EOF
)

if [[ $# -eq 0 ]]; then
  echo -e "$help"
  exit 0
fi

command=$1
args=${*:2}
FUNCTIONS_DIR="$( dirname -- "$0";)/functions"

BUILD_SCRIPT_PATH="$FUNCTIONS_DIR/build.sh"
BUILD_DOCKER_SCRIPT_PATH="$FUNCTIONS_DIR/build-docker.sh"
POWER_ACTION_SCRIPT_PATH="$FUNCTIONS_DIR/power-action.sh"
SETUP_SCRIPT_PATH="$FUNCTIONS_DIR/setup.sh"
CLONE_SCRIPT_PATH="$FUNCTIONS_DIR/clone.sh"
GIT_SCRIPT_PATH="$FUNCTIONS_DIR/git.sh"

case "$command" in
"build")
$BUILD_SCRIPT_PATH "$args"
;;
"build-docker")
$BUILD_DOCKER_SCRIPT_PATH "$args";;
"up")
$POWER_ACTION_SCRIPT_PATH "up";;
"down")
$POWER_ACTION_SCRIPT_PATH "down";;
"restart")
$POWER_ACTION_SCRIPT_PATH "restart";;
"setup")
$SETUP_SCRIPT_PATH;;
"clone")
$CLONE_SCRIPT_PATH;;
"git")
$GIT_SCRIPT_PATH "$args";;
*)
  echo -e "$help";
;;

esac
