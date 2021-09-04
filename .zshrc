plugins=(
  git
  docker
  docker-compose
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  poetry
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
export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{**/node_modules/**,**/.git/**,**/.idea/**,**/.venv/**,**/venv/**,.**/__pycache__/**,}"'

# Cargo, Gem
export PATH="$HOME/go:$HOME/go/bin:$HOME/.cargo/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use > /dev/null

# Add pem files to agent
ls "$HOME/.ssh/pem" | xargs -i ssh-add "$HOME/.ssh/pem/"{} >/dev/null 2>&1

neofetch --color_blocks off \
  --disable gpu packages theme icons host resolution \
  --cpu_temp C

# Install icon font for lsd
# git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
# cd nerd_fonts/
# ./install.sh Hack

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
