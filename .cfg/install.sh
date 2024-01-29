#!/bin/sh
# Origin https://bitbucket.org/durdn/cfg/src/master/.bin/install.sh

cd "$HOME"

alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
mkdir -p "$HOME/.config-backup"
git clone --bare https://github.com/dhvcc/configs.git $HOME/.cfg

cfg checkout

if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    cfg checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
    cfg checkout
fi;

cfg "config" status.showUntrackedFiles no
cfg "config" commit.verbose true
