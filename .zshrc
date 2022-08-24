plugins=(
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf
  git
  docker
  docker-compose
  fnm
  pyenv
  poetry
)

export HISTSIZE=1000000
export HISTFILESIZE=1000000
export VISUAL=nvim
export EDITOR=nvim
path+=(
  $HOME/.local/bin,
  $HOME/go
  $HOME/go/bin
  $HOME/.cargo/bin
  $HOME/.local/share/gem/ruby/3.0.0/bin
  $HOME/.poetry/bin
)

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
eval "$(starship init zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
path+=($PYENV_ROOT/bin)
eval "$(pyenv init --path --no-rehash)"

# fnm
path+=($HOME/.fnm)
eval "$(fnm env)"

#############
# Oh-my-zsh #
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d1d1d1,bg=#525252"
source $ZSH/oh-my-zsh.sh
# Completion
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit
#            #
#############

##########################
# RC files and functions #
source ~/.config/.aliasrc.sh
source ~/.config/.completionrc.sh
if [ -f "$HOME/.config/.rc_extend.sh" ]; then source ~/.config/.rc_extend.sh; fi
#                        #
##########################


[ ! "$NEOFETCH" = "0" ] && sh -c "neofetch $OVERRIDE_NEOFETCH_ARGUMENTS"

