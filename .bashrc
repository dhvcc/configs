# Oh my bash needs to go first so that we can override it's aliases
##############
# Oh-my-bash #
if [[ -d $HOME/.oh-my-bash ]]; then
  export OSH=$HOME/.oh-my-bash
  OSH_THEME="dhvcc"
  source $OSH/oh-my-bash.sh
fi
#            #
##############

dus() { du -sh $1/* | sort -hr | xargs -0 echo | sed -r 's/\S*\// /g'; }

[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_private_aliases.bash ] && . ~/.bash_private_aliases.bash
[ -f ~/.bash_completion ] && . ~/.bash_completion

# FZF
fzf=$(command -v fzf)
if [[ -n $fzf ]]; then
  [ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && . /usr/share/doc/fzf/examples/key-bindings.bash ||
    source /usr/share/fzf/key-bindings.bash
  [ -f /usr/share/doc/fzf/examples/completion.bash ] && . /usr/share/doc/fzf/examples/completion.bash ||
    source /usr/share/fzf/completion.bash
fi

# Enable pyenv
pyenv=$(command -v pyenv)
if [[ -n $pyenv ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# NVM config
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install icon font for lsd
# git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
# cd nerd_fonts/
# ./install.sh Hack

