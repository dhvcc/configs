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
  pyenv
  poetry

  node
  npm
  nvm

  rust
)

export HISTSIZE=1000000
export HISTFILESIZE=1000000
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

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
path+=($PYENV_ROOT/bin)
eval "$(pyenv init --path --no-rehash)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm

#############
# Oh-my-zsh #
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
source ~/.config/.completionrc.sh
if [ -f "$HOME/.config/.rc_extend.sh" ]; then source ~/.config/.rc_extend.sh; fi

# Helper functions
poetry-shell() {
  . "$(poetry env info --path)/bin/activate"
}
clipp() {
  output="$(poetry env info)"
  if [ $? -eq 0 ]; then
    echo -n "$(poetry env info --path)/bin/python" | clip
    echo "Copied poetry python path to clipboard"
  else
    echo $output
  fi
}
#                        #
##########################

# /bin/find ~/.ssh -type f -not -name "*.pub" | xargs -I {} bash -c 'ssh-add {} 2>/dev/null'
# /usr/bin/find ~/.ssh -type f -not -name "*.pub" | xargs -I {} bash -c 'ssh-add {} 2>/dev/null'

bindkey -e  # Disable VI mode
[ ! "$NEOFETCH" = "0" ] && neofetch

