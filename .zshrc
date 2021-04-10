plugins=(git docker docker-compose)

export VISUAL=vim
export EDITOR=vim

# Highlight man with "most"
command -v most > /dev/null 2>&1 && export MANPAGER="most"

#############
# Oh-my-zsh #
if [[ -d $HOME/.oh-my-zsh ]]; then
  export ZSH="$HOME/.oh-my-zsh"
  export ZSH_CUSTOM="$HOME/.oh-my-zsh-custom"

  [ -d "$ZSH_CUSTOM/plugins/zsh-completions" ] && plugins+=zsh-completions
  [ -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && plugins+=zsh-autosuggestions
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d1d1d1,bg=#525252"
  [ -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && plugins+=zsh-syntax-highlighting

  source $ZSH/oh-my-zsh.sh
fi
#            #
##############

command -v starship > /dev/null && eval "$(starship init zsh)"
[ -f ~/.config/.aliasrc.sh ] && source ~/.config/.aliasrc.sh
[ -f ~/.config/.completionrc.sh ] && source ~/.config/.completionrc.sh

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
