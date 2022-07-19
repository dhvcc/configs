plugins=(
  git
  docker
  docker-compose
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  poetry
#  zsh-vi-mode
)

export HISTSIZE=1000000
export HISTFILESIZE=1000000
export VISUAL=nvim
export EDITOR=nvim

poetry-python() {
  echo "$(poetry env info --path)/bin/python"
}
poetry-shell() {
  . "$(poetry env info --path)/bin/activate"
}

# FZF
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden'

# Cargo, Gem
export PATH="$HOME/go:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/.poetry/bin:$PATH"

#############
# Oh-my-zsh #
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d1d1d1,bg=#525252"
source $ZSH/oh-my-zsh.sh
#            #
##############

# Starship prompt initialization
eval "$(starship init zsh)"

##########################
# RC files and functions #
source ~/.config/.aliasrc.sh
source ~/.config/.completionrc.sh
if [ -f "$HOME/.config/.private_aliases.sh" ]; then source ~/.config/.private_aliases.sh; fi

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

# FZF key-bindings and completion
if [ ! -d $HOME/.fzf ]; then
  if [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
  else
   source /usr/share/fzf/key-bindings.zsh
  fi
  if [ -f /usr/share/doc/fzf/examples/completion.zsh ]; then
   source /usr/share/doc/fzf/examples/completion.zsh
  else
   source /usr/share/fzf/completion.zsh
  fi
fi;


# Enable pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
# Defer initialization of nvm until nvm, node or a node-dependent command is
# run. Ensure this block is only run once if .bashrc gets sourced multiple times
# by checking whether __init_nvm is a function.
if [ -s "$HOME/.nvm/nvm.sh" ] && [ ! "$(whence -w __init_nvm)" = function ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
  __node_commands=('nvm' 'node' 'npm' 'yarn' 'gulp' 'grunt' 'webpack')
  function __init_nvm() {
    for i in "${__node_commands[@]}"; do unalias $i; done
    . "$NVM_DIR"/nvm.sh
    unset __node_commands
    unset -f __init_nvm
  }
  for i in "${__node_commands[@]}"; do alias $i='__init_nvm && '$i; done
fi

# Add pem files to agent
ls "$HOME/.ssh/pem" | xargs -i ssh-add "$HOME/.ssh/pem/"{} >/dev/null 2>&1

[ ! "$NEOFETCH" = "0" ] && neofetch

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.poetry/bin:$PATH"
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
