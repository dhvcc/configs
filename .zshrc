# Oh my zsh needs to go first so that we can override it's aliases
##############
# Oh-my-zsh #
if [[ -d $HOME/.oh-my-zsh ]]; then
  export ZSH="/home/dhvcc/.oh-my-zsh"
  ZSH_THEME="dhvcc"
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
  source /usr/share/fzf/key-bindings.zsh
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
# git clone https://github.com/ryanoasis/nerd-fonts.git
# cd nerd_fonts/
# ./install.sh Hack