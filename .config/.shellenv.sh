############################
## Guard against reloading #
############################
_CFG_SHELLENV_LOADED=1

###################
# Helper functions #
###################
prepend_path() {
  case ":$PATH:" in
  *":$1:"*) ;;
  *) PATH="$1${PATH:+:$PATH}" ;;
  esac
}

##################
# Shared defaults #
##################

export HISTSIZE=10000000
export HISTFILESIZE=10000000
export VISUAL=nvim
export EDITOR=nvim

#############
# PATH setup #
#############
for dir in \
  "$HOME/.local/bin" \
  "$HOME/go" \
  "$HOME/go/bin" \
  "$HOME/.cargo/bin" \
  "/home/linuxbrew/.linuxbrew/bin" \
  "/opt/homebrew/bin"; do
  prepend_path "$dir"
done
export PATH

#################
# Tool settings #
#################
export FZF_DEFAULT_COMMAND='rg --files --follow --respect-gitignore --hidden'
export BAT_THEME="Visual Studio Dark+"

#####################
# Local extensions  #
#####################
if [ -f "$HOME/.config/.rc_extend.sh" ]; then . "$HOME/.config/.rc_extend.sh"; fi
