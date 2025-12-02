tenorium_is_zsh() {
  [ -n "${ZSH_VERSION-}" ]
}

if tenorium_is_zsh; then
  setopt completealiases
fi

alias tenorium='$HOME/workspace/tenorium/scripts/tenorium.sh'

_tenorium_generate_completion() {
  declare current_word
  current_word="${COMP_WORDS[COMP_CWORD]}"
  # shellcheck disable=SC2207
  COMPREPLY=($(compgen -W "$1" -- "${current_word}"))
  return 0
}

_tenorium_commands() {
  declare current_word
  declare command

  current_word="${COMP_WORDS[COMP_CWORD]}"

  COMMANDS='
      build build-docker up down restart env clone git'

  if [ ${#COMP_WORDS[@]} == 2 ]; then
    _tenorium_generate_completion "${COMMANDS}"
  fi
}

_tenorium() {
  declare previous_word
  previous_word="${COMP_WORDS[COMP_CWORD - 1]}"

  case "${previous_word}" in
  *)
    _tenorium_commands
  ;;
  esac
}

# complete is a bash builtin, but recent versions of ZSH come with a function
# called bashcompinit that will create a complete in ZSH. If the user is in
# ZSH, load and run bashcompinit before calling the complete function.
if [[ -n ${ZSH_VERSION-} ]]; then
  # First calling compinit (only if not called yet!)
  # and then bashcompinit as mentioned by zsh man page.
  if ! command -v compinit > /dev/null; then
    autoload -U +X compinit && if [[ ${ZSH_DISABLE_COMPFIX-} = true ]]; then
      compinit -u
    else
      compinit
    fi
  fi
  autoload -U +X bashcompinit && bashcompinit
fi

complete -o default -F _tenorium tenorium