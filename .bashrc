plugins=(
  git
  ansible
  pyenv
  npm
)

export HISTSIZE=1000000
export HISTFILESIZE=1000000
export VISUAL=nvim
export EDITOR=nvim
export PATH="$HOME/.local/bin:$HOME/go:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/.poetry/bin:$PATH"

# Util configs
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden'
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

# fnm
export PATH="$HOME/.fnm:$PATH"
eval "$(fnm env)"

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

[ ! "$NEOFETCH" = "0" ] && sh -c "neofetch $OVERRIDE_NEOFETCH_ARGUMENTS"

