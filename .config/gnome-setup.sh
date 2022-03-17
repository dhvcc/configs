#!/usr/bin/env sh

# Setup gnome. Allow backward Alt+Tab with Alt+Shift+Tab and change language with Alt+Shift

gsettings reset org.gnome.desktop.input-sources xkb-options
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"

