plugins=(git)

##############
# Oh-my-zsh #
if [[ -d $HOME/.oh-my-zsh ]]; then
  plugins+=(docker docker-compose)
  
  export ZSH="$HOME/.oh-my-zsh"
  export ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
  source $ZSH/oh-my-zsh.sh

  [ -d "$ZSH_CUSTOM/plugins/zsh-completions" ] && plugins+=zsh-completions
  [ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && plugins+=zsh-autosuggestions
  [ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && plugins+=zsh-syntax-highlighting
fi
#            #
##############

command -v starship > /dev/null && eval "$(starship init zsh)"
[ -f ~/.config/.aliasrc.sh ] && sourc.she ~/.config/.aliasrc.sh
[ -f ~/.config/.completionrc.sh ] && sourc.she ~/.config/.completionrc.sh

[ -f ~/.private_aliases.zsh ] && source ~/.private_aliases.zsh

# FZF key-bindings and completion
fzf=$(command -v fzf)
if [[ -n $fzf ]]; then
  [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && \
    source /usr/share/doc/fzf/examples/key-bindings.zsh || \
    source /usr/share/fzf/key-bindings.zsh
  [ -f /usr/share/doc/fzf/examples/completion.zsh ] && \
    source /usr/share/doc/fzf/examples/completion.zsh || \
    source /usr/share/fzf/completion.zsh
fi

# Enable pyenv
pyenv=$(command -v pyenv)
if [[ -n $pyenv ]]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Install icon font for lsd
# git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
# cd nerd_fonts/
# ./install.sh Hack
