# Configs

Basic showcase

![desktop](https://user-images.githubusercontent.com/18076967/179727974-d9bdf501-f911-4ff7-9bc3-8021d7f096ec.png)

## Install

Before installing, remove `.bashrc` or `.zshrc` which may conflict with the ones being pulled from this repo. Before retrying, remove `"$HOME"/.cfg` directory

```shell
curl -Lks https://raw.githubusercontent.com/dhvcc/configs/master/.cfg/install.sh | /bin/sh
```

You may want to add
`0 0 * * * cfg pull --rebase` as a cron job (`crontab -e`)

**Warning**, Bash configs are outdated

## Configuration

- Any additional rc stuff for `.zshrc` or `.bashrc` you can add into `.config/.rc_extend.sh`
- Place a picture for neofetch into `.config/neofetch/resources/source.jpg`
- `neofetch` can be turned off with `export NEOFETCH=0` (in something like `/etc/profile`)
- you can override default neofetch settings with cli arguments set as `OVERRIDE_NEOFETCH_ARGUMENTS=` in `.config/.rc_extend.sh`

## Dependencies

### System

Dependencies and software on ubuntu

```bash
sudo apt-get install -y htop xclip zsh kitty make vim \
       python3-dev python3-pip python3-venv \
       libpq-dev libsqlite3-dev
```

GNOME setup

```bash
# Install usefull software
sudo apt-get install -y gnome-tweaks gnome-shell-extension-manager dconf-editor
# Change layout on Alt+Shift
sudo echo gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']" >> /etc/profile
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true # show app button on the top/left
gsettings set org.gnome.desktop.default-applications.terminal exec kitty # set kitty as default terminal
gsettings reset org.gnome.desktop.input-sources xkb-options # allow to Alt+Shift+Tab to Alt+Tab backwards
```

- [pyenv](https://github.com/pyenv/pyenv-installer)

    ```bash
    curl https://pyenv.run | bash
    ```

- [nvm](https://github.com/nvm-sh/nvm)

    ```bash
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
    ```
- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) (Hack Nerd Font Mono)

    ```bash
    sudo mkdir -p /usr/share/fonts/hack
    cd /usr/share/fonts/hack && sudo curl -fLo "Hack Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
    sudo fc-cache -f -v
    ```

### VIM / NEOVIM

- [nvim](https://github.com/neovim/neovim)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [coc.nvim](https://github.com/neoclide/coc.nvim)

```bash
# Ubuntu install v0.7.2 from github
sudo curl -sL -o /var/cache/apt/archives/nvim-linux64.deb  https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb && sudo dpkg -i /var/cache/apt/archives/nvim-linux64.deb

python -m venv ~/.vim/.venv
~/.vim/.venv/bin/pip install pynvim pyright 
npm i -g neovim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c ':PlugInstall | :qall'
```

### Shell

#### Pip

- [pipx](https://github.com/pypa/pipx)
- [poetry](https://github.com/python-poetry/poetry)
- [docker-pretty-ps](https://github.com/politeauthority/docker-pretty-ps) (pretty print `docker ps`)
- [ranger](https://github.com/ranger/ranger) (terminal file manager)


```bash
pip install pipx
pipx install git+https://github.com/politeauthority/docker-pretty-ps.git#egg=docker-pretty-ps
pipx install ranger-fm
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
```

#### Cargo

- [rgipgrep](https://github.com/BurntSushi/ripgrep) (better `grep`)
- [lsd](https://github.com/Peltoche/lsd) (better `ls`)
- [bat](https://github.com/sharkdp/bat) (better `cat`)
- [starship](https://starship.rs/) (shell prompt)

```bash
cargo install ripgrep lsd bat
# Starship cargo install is super slow
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

#### Manual install

- [fzf](https://github.com/junegunn/fzf) (`Ctrl+R` shell history search)

    ```bash
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
    ```

- [htop](https://github.com/htop-dev/htop/) (better `top`)

### ZSH

- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) (`zsh` config framework)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-completions](https://github.com/zsh-users/zsh-completions)

```bash
KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# poetry completion
mkdir $ZSH_CUSTOM/plugins/poetry
poetry completions zsh > $ZSH_CUSTOM/plugins/poetry/_poetry
```

### Terminal

- [kitty](https://github.com/kovidgoyal/kitty) (fast and feature-rich terminal emulator)
- [kitty-themes](https://github.com/dexpota/kitty-themes) (Broadcast)

    ```bash
    THEME=Broadcast
    wget "https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/$THEME.conf" -P ~/.config/kitty/kitty-themes/themes
    cd ~/.config/kitty
    ln -s ./kitty-themes/themes/$THEME.conf ~/.config/kitty/theme.conf
    ```
