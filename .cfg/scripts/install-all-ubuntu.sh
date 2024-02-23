#!/usr/bin/env bash

set -e

#apt update

#apt install -y curl wget git gcc g++ libffi-dev
#apt install -y htop xclip make vim curl \
#    python3-dev python3-pip python3-venv \
#    libpq-dev libsqlite3-dev \
#    lzma-dev libreadline6-dev libbz2-dev
#apt install -y bash zsh neofetch unzip ripgrep
#curl https://sh.rustup.rs -sSf | bash -s -- -y --no-modify-path

# Shell setup
~/.cfg/scripts/install-omb.sh
~/.cfg/scripts/install-omz.sh
sh -c "$(curl -fsSL https://starship.rs/install.sh)" "" -f

# CLI Utils
#pip install pipx && \
#    pipx install ansible --include-deps && \
#    pipx install git+https://github.com/politeauthority/docker-pretty-ps.git#egg=docker-pretty-ps && \
#    pipx install ranger-fm --include-deps && \
#    pipx install poetry --include-deps && \
#    pipx install ipython --include-deps

# RUST-Based utils
mkdir -p ~/.local/bin
wget https://github.com/lsd-rs/lsd/releases/download/v1.0.0/lsd-musl_1.0.0_amd64.deb && \
    dpkg -i lsd-musl_1.0.0_amd64.deb && rm lsd-musl_1.0.0_amd64.deb
apt install -y fd-find && ln -s $(which fdfind) ~/.local/bin/fd
apt install -y bat && ln -s $(which batcat) ~/.local/bin/bat

# ??? COPY ???

# Version management
curl https://pyenv.run | bash
curl -fsSL https://fnm.vercel.app/install | bash && /bin/zsh -i -c 'fnm install 16'

# NeoVIM
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
~/.cfg/scripts/install-neovim.sh

cfg checkout ~
