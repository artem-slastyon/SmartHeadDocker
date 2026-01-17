{{projectCommand}}_is_zsh() {
  [ -n "${ZSH_VERSION-}" ]
}

if {{projectCommand}}_is_zsh; then
  setopt completealiases
fi

alias {{projectCommand}}='$HOME/workspace/{{projectCommand}}/scripts/main.sh'

_{{projectCommand}}_generate_completion() {
  declare current_word
  current_word="${COMP_WORDS[COMP_CWORD]}"
  # shellcheck disable=SC2207
  COMPREPLY=($(compgen -W "$1" -- "${current_word}"))
  return 0
}

_{{projectCommand}}_commands() {
  declare current_word
  declare command

  current_word="${COMP_WORDS[COMP_CWORD]}"

  COMMANDS='
      artisan build clone composer docker down git mkcert restart setup up watch'

  DOCKER_SUBCOMMANDS='
      build exec temp watch'

  SERVICES='apache php8.4'

  if [ ${#COMP_WORDS[@]} == 2 ]; then
    _{{projectCommand}}_generate_completion "${COMMANDS}"
  fi

  case "${#COMP_WORDS[@]}" in
  2) _{{projectCommand}}_generate_completion "${COMMANDS}";;
  3)
    command="${COMP_WORDS[COMP_CWORD - 1]}"
    if [ "$command" == "docker" ]; then
      _{{projectCommand}}_generate_completion "${DOCKER_SUBCOMMANDS}"
    fi;;
  4)
    command="${COMP_WORDS[COMP_CWORD - 1]}"
    case "$command" in
    "exec") _{{projectCommand}}_generate_completion "${SERVICES}";;
    esac
  esac
}

_{{projectCommand}}() {
  declare previous_word
  previous_word="${COMP_WORDS[COMP_CWORD - 1]}"

  case "${previous_word}" in
  *)
    _{{projectCommand}}_commands
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

complete -o default -F _{{projectCommand}} {{projectCommand}}