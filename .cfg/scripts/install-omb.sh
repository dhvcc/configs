#!/usr/bin/env bash

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended
mv -f .bashrc.omb* .bashrc
