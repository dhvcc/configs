# Source to enable __git_complete && enable git completion for "config" alias
if [ $0 = zsh ]; then
  source /usr/share/git/completion/git-completion.zsh > /dev/null 2>&1
  command -v gh > /dev/null && eval "$(gh completion -s zsh)"
fi
if [ $0 = bash ]; then
  source /usr/share/bash-completion/completions/git > /dev/null 2>&1
  command -v gh > /dev/null && eval "$(gh completion -s bash)"
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
fi

command -v __git_complete > /dev/null && __git_complete config __git_main

command -v aws_completer > /dev/null && complete -C $(which aws_completer) aws
