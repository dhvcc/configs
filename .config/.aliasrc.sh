alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

# Output dirs and sort
command -v lsd > /dev/null && alias ls='lsd -A --group-dirs first'
dus() {
  du -sh $1/* | sort -hr | xargs -0 echo | sed -r 's/\S*\// /g';
}
alias lsds="lsd --blocks size,name -l -S --size=short -F"

# Use du for sorting, if available
command -v du > /dev/null && alias lss=dus ||  alias lss=lsds

command -v fd > /dev/null && alias find="fd"
command -v rg > /dev/null && alias grep="rg -i --color always"

alias python="python3" \
      pip="pip3" \
      ipython="ipython3"

alias shellp="./manage.py shell_plus --ipython" \
      runp="./manage.py runserver_plus"
