######################
# Shared shell setup #
######################
[ -f "$HOME/.config/.shellrc.sh" ] && source "$HOME/.config/.shellrc.sh"


########################
# Oh My Bash plugins   #
# Loaded through       #
# Sheldon, not from a  #
# manual checkout.     #
########################
plugins=(
  git
  ansible
  npm
  brew
  fzf
  cargo
)

export SHELDON_BASH_CONFIG_FILE="$HOME/.config/sheldon/bash_plugins.toml"
export SHELDON_BASH_DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/sheldon-bash"
export OSH="$SHELDON_BASH_DATA_DIR/repos/github.com/ohmybash/oh-my-bash"
export DISABLE_AUTO_UPDATE=true

eval "$(SHELDON_CONFIG_FILE=$SHELDON_BASH_CONFIG_FILE SHELDON_DATA_DIR=$SHELDON_BASH_DATA_DIR sheldon source)"


#####################
# Local extensions  #
#####################
source ~/.config/.aliasrc.sh
if [ -f "$HOME/.config/.rc_extend.sh" ]; then source ~/.config/.rc_extend.sh; fi


#############
# Fastfetch  #
#############
[ ! "$NEOFETCH" = "0" ] && fastfetch
