trade_is_zsh() {
  [ -n "${ZSH_VERSION-}" ]
}

if trade_is_zsh; then
  setopt completealiases
fi

alias trade='$HOME/workspace/trade/scripts/trade.sh'

_trade_generate_completion() {
  declare current_word
  current_word="${COMP_WORDS[COMP_CWORD]}"
  # shellcheck disable=SC2207
  COMPREPLY=($(compgen -W "$1" -- "${current_word}"))
  return 0
}

_trade_commands() {
  declare current_word
  declare command

  current_word="${COMP_WORDS[COMP_CWORD]}"

  COMMANDS='
      build clone docker down git restart setup up'

  DOCKER_SUBCOMMANDS='
      build exec temp watch'

  if [ ${#COMP_WORDS[@]} == 2 ]; then
    _trade_generate_completion "${COMMANDS}"
  fi

  case "${#COMP_WORDS[@]}" in
  2) _trade_generate_completion "${COMMANDS}";;
  3)
    command="${COMP_WORDS[COMP_CWORD - 1]}"
    if [ "$command" == "docker" ]; then
      _trade_generate_completion "${DOCKER_SUBCOMMANDS}"
    fi;;
  esac
}

_trade() {
  declare previous_word
  previous_word="${COMP_WORDS[COMP_CWORD - 1]}"

  case "${previous_word}" in
  *)
    _trade_commands
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

complete -o default -F _trade trade