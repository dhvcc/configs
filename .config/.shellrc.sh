###########################
# Guard against reloading #
###########################
if [ -n "${_CFG_SHELLRC_LOADED:-}" ]; then
  return 0 2>/dev/null || exit 0
fi
_CFG_SHELLRC_LOADED=1


#####################
# Shared environment #
#####################
[ -f "$HOME/.config/.shellenv.sh" ] && . "$HOME/.config/.shellenv.sh"


##################
# Shared prompt   #
##################
if [ ! "$STARSHIP" = 0 ]; then
  if command -v starship >/dev/null 2>&1; then
    if [ -n "${ZSH_VERSION:-}" ]; then
      eval "$(starship init zsh)"
    elif [ -n "${BASH_VERSION:-}" ]; then
      eval "$(starship init bash)"
    fi
  fi
fi


##################
# Shared runtime  #
##################
if command -v fnm >/dev/null 2>&1; then
  if [ -n "${ZSH_VERSION:-}" ]; then
    eval "$(fnm env --use-on-cd --shell zsh)"
  elif [ -n "${BASH_VERSION:-}" ]; then
    eval "$(fnm env --use-on-cd --shell bash)"
  fi
fi
