plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
  brew
  gh

  git
  docker
  docker-compose
  ansible

  python
  pip

  node
  npm
  fnm

  rust
)

export HISTSIZE=10000000
export HISTFILESIZE=10000000
export VISUAL=lvim
export EDITOR=lvim
path+=(
  $HOME/.local/bin
  $HOME/go
  $HOME/go/bin
  $HOME/.cargo/bin
  /home/linuxbrew/.linuxbrew/bin
  /opt/homebrew/bin
)

# Util configs
export FZF_DEFAULT_COMMAND='rg --files --follow --respect-gitignore --hidden --glob "!**/.venv/**" --glob "!**/venv/**" --glob "!**/node_modules/**" '
export BAT_THEME="Nord"

# Starship prompt initialization
eval "$(starship init zsh)"

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"


#############
# Oh-my-zsh #
export DISABLE_UPDATE_PROMPT=true
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d1d1d1,bg=#525252"
fpath+="$ZSH_CUSTOM/plugins/zsh-completions/src"
source $ZSH/oh-my-zsh.sh
#            #
#############

##########################
# RC files and functions #
source ~/.config/.aliasrc.sh
if [ -f "$HOME/.config/.rc_extend.sh" ]; then source ~/.config/.rc_extend.sh; fi

#                        #
##########################

[ ! "$NEOFETCH" = "0" ] && fastfetch 

