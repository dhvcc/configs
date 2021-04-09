plugins=(git)

##############
# Oh-my-zsh #
if [[ -d $HOME/.oh-my-zsh ]]; then
  export ZSH="$HOME/.oh-my-zsh"
  export ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"
  plugins+=(docker docker-compose)
  ZSH_THEME="spaceship"
  source $ZSH/oh-my-zsh.sh

  [ -d "$ZSH_CUSTOM/plugins/zsh-completions" ] && plugins+=zsh-completions
  [ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && plugins+=zsh-autosuggestions
  [ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && plugins+=zsh-syntax-highlighting
fi
#            #
##############

[ -f ~/.config/.aliasrc ] && source ~/.config/.aliasrc
[ -f ~/.config/.completionrc ] && source ~/.config/.completionrc

[ -f ~/.zsh_private_aliases.zsh ] && source ~/.zsh_private_aliases.zsh
[ -f ~/.spaceship-config.zsh ] && source ~/.spaceship-config.zsh

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
