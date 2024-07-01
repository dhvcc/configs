#!/bin/sh
# Inspiration https://bitbucket.org/durdn/cfg/src/master/.bin/install.sh

cd "$HOME"

alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
mkdir -p "$HOME/.config-backup"
git clone --no-checkout --bare https://github.com/dhvcc/configs.git $HOME/.cfg

# Backup and remove repo files (if exist)
cfg ls-tree -r master --name-only | xargs -I {} mv {} ./.config-backup/{}

cfg checkout

cfg "config" status.showUntrackedFiles no
cfg "config" commit.verbose true

