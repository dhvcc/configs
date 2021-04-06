# Source to enable __git_complete
. /usr/share/git/completion/git-completion.zsh
# Enable git completion for "config" alias
__git_complete config __git_main

gh=$(command -v gh)
if [[ -n $gh ]]; then
  eval "$(gh completion -s zsh)"
fi

aws_completer=$(command -v aws_completer)
if [[ -n $aws_completer ]]; then
  complete -C $(which aws_completer) aws
fi

