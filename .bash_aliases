alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

alias ls=lsd
if [ $(which du) ]; then
  alias lss=dus
else
  alias lss="lsd --blocks size,name -l -S --size=short -F"
fi

alias find="fd"
alias grep="rg"
alias qgrep="rg"

alias python="python3"
alias pip="pip3"
alias ipython="ipython3"

alias shellp="python manage.py shell_plus --ipython"
alias runp="python manage.py runserver_plus"
