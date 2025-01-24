alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias vim=lvim

if [ -n "$WSL_DISTRO_NAME" ]; then
  clip() { cat $1 | clip.exe; };
elif [ "$(uname)" = "Darwin" ]; then
  clip() { pbcopy < $1; };
else
  alias clip="xclip -sel clip";
fi

# Output dirs and sort by size
dus() { du -sh $1/* | sort -hr | xargs -0 echo | sed -r 's/\S*\// /g'; }
alias lss="lsd --blocks size,name -l -S --size=short -F" # dus lsd variant
alias rg="rg -S"
alias ls="lsd -A --group-dirs first --color always"

docker() {
  if [[ $1 == "pps" && -n "$(command docker-pretty-ps)" ]]; then
    shift # remove the first "ps" argument from argv
    command docker-pretty-ps $@
  else
    command docker "$@"
  fi
}

##########
# Python #
alias python="python3" \
      pip="pip3" \
      ipython="ipython3"
# Django
alias shellp="./manage.py shell_plus --ipython" \
      runp="./manage.py runserver_plus"
#        #
##########
