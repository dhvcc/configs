alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

if [ -n "$SSH_CLIENT" -a -n "$(command -v kitty)" ]; then
  alias clip="kitty +kitten clipboard";
elif [ -n "$WSL_DISTRO_NAME" ]; then
  clip() { cat $1 | clip.exe; };
else
  alias clip="xclip -sel clip";
fi

# Mon2cam alias for linux
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

alias vim=nvim
# Output dirs and sort by size
dus() { du -sh $1/* | sort -hr | xargs -0 echo | sed -r 's/\S*\// /g'; }
alias lss="lsd --blocks size,name -l -S --size=short -F" # dus lsd variant

color_lsd=$(ps -p $(ps -p $$ -o ppid=) -o args= | grep nautilus 2>&1 > /dev/null && echo -n "never" || echo -n "always")
alias ls="lsd -A --group-dirs first --color $color_lsd" \
      find="fd" \
      grep="rg -i --color always"

[ $(infocmp >/dev/null 2>&1) ] && alias ssh="kitty +kitten ssh"

docker() {
  if [[ $1 == "ps" && -n "$(command docker-pretty-ps)" ]]; then
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
