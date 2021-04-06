#!/usr/bin/env bash

# Theme inspired by:
#  - oh-my-bash cupcake theme

# CONFIG ======================================================================

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""

ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"

ZSH_THEME_GIT_PROMPT_REMOTE_STATUS_DETAILED=1

# ICONS =======================================================================

icon_start="┌"
icon_directory=" 📁"
icon_branch="🌿"
icon_end="└❯ "

# FUNCTIONS ===================================================================

function git_info() {
  local output
  # local branch=$(git_current_branch)
  if [ ! $branch = " " ]; then
    output+="$icon_branch $branch"
  fi
  echo "$output"
}

# PROMPT OUTPUT ===============================================================

PROMPT='${icon_start} %{$terminfo[bold]$fg[cyan]%}%$(virtualenv_prompt_info) \
%{$terminfo[bold]$fg[red]%}%n%{$reset_color%}${icon_directory} \
%{$terminfo[bold]$fg[yellow]%}%~ %{$fg[green]%}% \
$(git_info) %{$reset_color%}
${icon_end}'
