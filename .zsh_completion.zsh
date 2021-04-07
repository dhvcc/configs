# Source to enable __git_complete && enable git completion for "config" alias
if [ -f /usr/share/git/completion/git-completion.zsh ]; then
  . /usr/share/git/completion/git-completion.zsh
  __git_complete config __git_main
fi

gh=$(command -v gh)
if [[ -n $gh ]]; then
  eval "$(gh completion -s zsh)"
fi

aws_completer=$(command -v aws_completer)
if [[ -n $aws_completer ]]; then
  complete -C $(which aws_completer) aws
fi
