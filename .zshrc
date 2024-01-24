plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf

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

  rust
)

export HISTSIZE=1000000
export HISTFILESIZE=1000000
export VISUAL=nvim
export EDITOR=nvim
path+=(
  $HOME/.local/bin
  $HOME/go
  $HOME/go/bin
  $HOME/.cargo/bin
  $HOME/.local/share/gem/ruby/3.0.0/bin
  $HOME/.poetry/bin
)

# Util configs
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden'
export BAT_THEME="Nord"

# Starship prompt initialization
eval "$(starship init zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
path+=($PYENV_ROOT/bin)
eval "$(pyenv init --path --no-rehash)"

# fnm
path+=($HOME/.local/share/fnm)
eval "$(fnm env --use-on-cd --shell=zsh)"

# pnpm
export PNPM_HOME="/home/dhvcc/.local/share/pnpm"
path+=($PNPM_HOME)

#############
# Oh-my-zsh #
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d1d1d1,bg=#525252"
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
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

bindkey -e  # Disable VI mode
[ ! "$NEOFETCH" = "0" ] && neofetch

