plugins=(
  git
  ansible
  pyenv
  npm
  nvm
  brew
)

export HISTSIZE=1000000
export HISTFILESIZE=1000000
export VISUAL=nvim
export EDITOR=nvim
export PATH="$HOME/.local/bin:$HOME/go:$HOME/go/bin:$HOME/.cargo/bin:/home/linuxbrew/.linuxbrew/bin:/opt/homebrew/bin:$PATH"

# Util configs
export FZF_DEFAULT_COMMAND='rg --files --follow --respect-gitignore --hidden --glob "!**/.venv/**" --glob "!**/venv/**" --glob "!**/node_modules/**" '
export BAT_THEME="Nord"

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

# Starship prompt initialization
eval "$(starship init bash)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path --no-rehash)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

##############
# Oh-my-bash #
if [[ -d $HOME/.oh-my-bash ]]; then
  export OSH=$HOME/.oh-my-bash
  source $OSH/oh-my-bash.sh
fi
#            #
##############

##########################
# RC files and functions #
source ~/.config/.aliasrc.sh
source ~/.config/.completionrc.sh
if [ -f "$HOME/.config/.rc_extend.sh" ]; then source ~/.config/.rc_extend.sh; fi
#                        #
##########################

/bin/find ~/.ssh -type f -not -name "*.pub" | xargs -I {} bash -c 'ssh-add {} 2>/dev/null'

[ ! "$NEOFETCH" = "0" ] && neofetch
. "$HOME/.cargo/env"
