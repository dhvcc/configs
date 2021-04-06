# Oh my zsh needs to go first so that we can override it's aliases
##############
# Oh-my-zsh #
if [[ -d $HOME/.oh-my-zsh ]]; then
  export ZSH="$HOME/.oh-my-zsh"
  export ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
  ZSH_THEME="spaceship"
  source $ZSH/oh-my-zsh.sh
fi
#            #
##############

[ -f ~/.zsh_aliases.zsh ] && . ~/.zsh_aliases.zsh
[ -f ~/.zsh_private_aliases.zsh ] && . ~/.zsh_private_aliases.zsh
[ -f ~/.zsh_completion ] && . ~/.zsh_completion.zsh

# FZF
fzf=$(command -v fzf)
if [[ -n $fzf ]]; then
  [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && . /usr/share/doc/fzf/examples/key-bindings.zsh ||
    source /usr/share/fzf/key-bindings.zsh
  [ -f /usr/share/doc/fzf/examples/completion.zsh ] && . /usr/share/doc/fzf/examples/completion.zsh ||
    source /usr/share/fzf/completion.zsh
fi

# Enable pyenv
pyenv=$(command -v pyenv)
if [[ -n $pyenv ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

plugins=(git)

# Install icon font for lsd
# git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
# cd nerd_fonts/
# ./install.sh Hack
