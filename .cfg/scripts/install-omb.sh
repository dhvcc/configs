#!/usr/bin/env bash

. ~/.bashrc

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
mv -f .bashrc.omb* .bashrc
