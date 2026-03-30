######################
# Shared shell setup #
######################
[ -f "$HOME/.config/.shellrc.sh" ] && source "$HOME/.config/.shellrc.sh"


##########################
# Sheldon / Oh My Zsh    #
# Sheldon owns plugins;  #
# OMZ still provides the #
# lib files we source.   #
##########################
export SHELDON_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/sheldon"
export ZSH="$SHELDON_DATA_DIR/repos/github.com/ohmyzsh/ohmyzsh"
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/oh-my-zsh"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d1d1d1,bg=#525252"


################
# Completions   #
################
mkdir -p "$ZSH_CACHE_DIR/completions"
fpath=(
  "$ZSH_CACHE_DIR/completions"
  "$SHELDON_DATA_DIR/repos/github.com/zsh-users/zsh-completions/src"
  $fpath
)

autoload -Uz compinit

fast_compinit() {
  local zcompdump="$ZSH_CACHE_DIR/.zcompdump-$ZSH_VERSION"

  if [ -s "$zcompdump" ]; then
    compinit -C -d "$zcompdump"
  else
    compinit -i -d "$zcompdump"
  fi

  (
    local lockdir="$ZSH_CACHE_DIR/.zcompdump-refresh.lock"
    local now
    local mtime

    mkdir "$lockdir" 2>/dev/null || exit 0
    trap 'rmdir "$lockdir" 2>/dev/null' EXIT

    now=$(date +%s)
    mtime=$(stat -f %m "$zcompdump" 2>/dev/null || echo 0)

    if (( now - mtime > 86400 )); then
      autoload -Uz compinit
      compinit -i -d "$zcompdump" >/dev/null 2>&1
      zcompile "$zcompdump" >/dev/null 2>&1 || true
    fi
  ) >/dev/null 2>&1 &!
}

fast_compinit


################
# OMZ lib files #
################
for lib in \
  cli.zsh \
  clipboard.zsh \
  completion.zsh \
  directories.zsh \
  functions.zsh \
  git.zsh \
  history.zsh \
  key-bindings.zsh \
  misc.zsh
do
  [ -f "$ZSH/lib/$lib" ] && source "$ZSH/lib/$lib"
done


###################
# Sheldon plugins #
###################
eval "$(sheldon source)"


#####################
# Local extensions  #
#####################
source ~/.config/.aliasrc.sh
if [ -f "$HOME/.config/.rc_extend.sh" ]; then source ~/.config/.rc_extend.sh; fi


#############
# Fastfetch  #
#############
[ ! "$NEOFETCH" = "0" ] && fastfetch
