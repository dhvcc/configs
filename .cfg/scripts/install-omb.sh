#!/usr/bin/env bash

export OSH=$HOME/.oh-my-bash
source $OSH/oh-my-bash.sh

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
mv -f .bashrc.omb* .bashrc
