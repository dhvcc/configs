#!/bin/sh
# Origin https://bitbucket.org/durdn/cfg/src/master/.bin/install.sh

git clone --bare https://github.com/dhvcc/configs.git $HOME/.cfg
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@"

mkdir -p .config-backup
config checkout

if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;

config checkout
config "config" status.showUntrackedFiles no
