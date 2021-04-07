alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

alias ls=lsd
dus() { du -sh $1/* | sort -hr | xargs -0 echo | sed -r 's/\S*\// /g'; }
alias lsds="lsd --blocks size,name -l -S --size=short -F"

if [ $(which du) ]; then
  alias lss=dus
else
  alias lss=lsds
fi

alias find="fd"
alias grep="rg"

alias python="python3"
alias pip="pip3"
alias ipython="ipython3"

alias shellp="python manage.py shell_plus --ipython"
alias runp="python manage.py runserver_plus"
