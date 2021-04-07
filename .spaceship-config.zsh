SPACESHIP_PROMPT_FIRST_PREFIX_SHOW='true'

SPACESHIP_VENV_GENERIC_NAMES='false'
SPACESHIP_VENV_PREFIX="%{$fg[blue]%}via ("
SPACESHIP_VENV_SUFFIX="%{$fg[blue]%})%{$reset_color%} "

SPACESHIP_USER_PREFIX="┌ "
SPACESHIP_USER_PREFIX=""
SPACESHIP_USER_COLOR="red"
SPACESHIP_USER_SHOW="always"

SPACESHIP_DIR_PREFIX="📁 "
SPACESHIP_DIR_COLOR="yellow"

SPACESHIP_GIT_PREFIX=" 🌿 "
SPACESHIP_GIT_SYMBOL=""
SPACESHIP_GIT_BRANCH_COLOR="green"

local is_git_dir=$([ -d .git ] && echo .git || git rev-parse --git-dir >/dev/null 2>&1)
if [[ -n $is_git_dir ]]; then
  local git_status=$(git status --porcelain 2>/dev/null)
  local git_dirty=$(git status -s)
  local git_remote_status=$(git rev-list --left-right --count settings-refactor...origin/settings-refactor)

  local untracked=$(echo $git_status | egrep '^\?\?' | wc -l)
  local modified=$(echo $git_status | egrep '^M' | wc -l)
  local indexed=$(echo $git_status | egrep '^ M' | wc -l)

  local branch=$(git rev-parse --abbrev-ref HEAD)
  local remote_diff=$(git rev-list --left-right --count origin/$branch...$branch)
  local behind=$(echo $remote_diff | sed -E "s/\W*[0-9]$//g")
  local ahead=$(echo $remote_diff | sed -E "s/^[0-9]\W*//g")
fi

status_suffix() {
  local status_suffix=" "
  if [[ -n $git_dirty ]]; then
    status_suffix+="%{$fg[red]%}✗"
  else
    status_suffix+="%{$fg[green]%}✓"
  fi
  status_suffix+="%{$reset_color%}"
  echo $status_suffix
}
SPACESHIP_GIT_STATUS_PREFIX="%b%{$fg[green]%}%{$reset_color%}"
SPACESHIP_GIT_STATUS_SUFFIX="$(status_suffix)"

SPACESHIP_GIT_STATUS_MODIFIED=" %{$fg[yellow]%}•%{$reset_color%}$modified"
SPACESHIP_GIT_STATUS_ADDED=" %B%{$fg[green]%}+%{$reset_color%}$indexed"
SPACESHIP_GIT_STATUS_UNTRACKED=" %{$fg[white]%}⌀%{$reset_color%}$untracked"

SPACESHIP_GIT_STATUS_AHEAD=" %B%{$fg[green]%}↑%{$reset_color%}$ahead"
SPACESHIP_GIT_STATUS_BEHIND=" %B%{$fg[red]%}↓%{$reset_color%}$behind"

SPACESHIP_PYENV_PREFIX=""

SPACESHIP_CHAR_PREFIX="\n"
SPACESHIP_CHAR_COLOR_SUCCESS="white"
SPACESHIP_CHAR_COLOR_FAILURE="white"
SPACESHIP_CHAR_SYMBOL="└❯ "

SPACESHIP_PROMPT_ORDER=(
  user
  dir
  venv
  git
  pyenv
  exec_time
  char
)
