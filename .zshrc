SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true

SPACESHIP_VENV_GENERIC_NAMES=("")
SPACESHIP_VENV_PREFIX="%{$fg[blue]%}("
SPACESHIP_VENV_SUFFIX="%{$fg[blue]%})%{$reset_color%} "

SPACESHIP_USER_PREFIX="┌ "
SPACESHIP_USER_COLOR="red"
SPACESHIP_USER_SHOW="always"

SPACESHIP_DIR_PREFIX="📁 "
SPACESHIP_DIR_COLOR="yellow"

SPACESHIP_GIT_PREFIX="🌿 "
SPACESHIP_GIT_SYMBOL=""
SPACESHIP_GIT_BRANCH_COLOR="green"

SPACESHIP_GIT_STATUS_PREFIX=" %{$fg[green]%}[%{$reset_color%}"
SPACESHIP_GIT_STATUS_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
local untracked=$(git status --porcelain 2>/dev/null | grep '^??' | wc -l)
SPACESHIP_GIT_STATUS_UNTRACKED="%{$fg[red]%}✗%{$reset_color%}$untracked"
local modified=$(git status --porcelain 2>/dev/null | grep '^M' | wc -l)
SPACESHIP_GIT_STATUS_MODIFIED="%{$fg[yellow]%}●%{$reset_color%}$modified"
local indexed=$(git status --porcelain 2>/dev/null | grep '^ M' | wc -l)
SPACESHIP_GIT_STATUS_ADDED="%{$fg[green]%}+%{$reset_color%}$indexed"
SPACESHIP_GIT_STATUS_AHEAD="%{$fg[green]%}⇡%{$reset_color%}"
SPACESHIP_GIT_STATUS_BEHIND="%{$fg[red]%}⇣%{$reset_color%}"

SPACESHIP_PYENV_PREFIX=""

SPACESHIP_CHAR_PREFIX="\n"
SPACESHIP_CHAR_COLOR_SUCCESS="white"
SPACESHIP_CHAR_COLOR_FAILURE="white"
SPACESHIP_CHAR_SYMBOL="└❯ "

SPACESHIP_PROMPT_ORDER=(
  venv
  user
  dir
  git
  pyenv
  exec_time
  char
)

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

plugins=(git zsh-completions zsh-autosuggestions zsh-syntax-highlighting)

# Install icon font for lsd
# git clone https://github.com/ryanoasis/nerd-fonts.git --depth 1
# cd nerd_fonts/
# ./install.sh Hack
