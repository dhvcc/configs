# Configs

Basic showcase (neofetch is customized in this picture, `mint` theme used)

![desktop](https://user-images.githubusercontent.com/18076967/186787936-8ff80282-5e4e-4643-b1cd-4f3ac0a6d140.png)

## Install

While installing, some files may conflict with the ones being pulled from this repo. Before retrying, remove `"$HOME"/.cfg` directory

```shell
curl -Lks https://raw.githubusercontent.com/dhvcc/configs/master/.cfg/install.sh | /bin/sh
```

You may want to add
`0 0 * * * cfg pull --rebase` as a cron job (`crontab -e`)

**Warning**, Bash configs may be outdated, use `zsh` as your default

## Configuration

- Any additional rc stuff for your `.zshrc` you can add into `.config/.rc_extend.sh`

### Neofetch
- `neofetch` can be turned off with `NEOFETCH=0` (in something like `.config/.rc_extend.sh`)
- you can override default neofetch settings with your own theme. Just add `export NEOFETCH_THEME=name_of_your_theme` to `.rc_extend.sh` and add your settings into `~/.config/neofetch/themes/name_of_your_theme.sh` file

## Dependencies

### System

Dependencies and software on ubuntu

```bash
sudo apt-get install -y htop xclip make vim curl \
       python3-dev python3-pip python3-venv \
       libpq-dev libsqlite3-dev
```

GNOME setup

```bash
# Install usefull software
sudo apt-get install -y gnome-tweaks gnome-shell-extension-manager dconf-editor
# Change layout on Alt+Shift
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true # show app button on the top/left
gsettings set org.gnome.desktop.default-applications.terminal exec kitty # set kitty as default terminal
gsettings reset org.gnome.desktop.input-sources xkb-options # allow to Alt+Shift+Tab to Alt+Tab backwards
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']" >> /etc/profile
```

Software

- [pyenv](https://github.com/pyenv/pyenv-installer)
  ```bash
  curl https://pyenv.run | bash
  ```
- [fnm](https://github.com/Schniz/fnm)
  ```bash
  curl -fsSL https://fnm.vercel.app/install | bash
  # Might also want to install current lts version
  fnm install 16
  ```
- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) (Hack Nerd Font Mono)
  ```bash
  sudo mkdir -p /usr/share/fonts/hack
  cd /usr/share/fonts/hack && sudo curl -fLo "Hack Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
  sudo fc-cache -f -v
  ```
- [fzf](https://github.com/junegunn/fzf) (used for shell/ipython history search, vim/ranger file search, but can also be used fore many more things)
  ```bash
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all
  ```
- [btop](https://github.com/aristocratos/btop) (fancier htop)
- [ctop](https://github.com/bcicen/ctop) (docker monitoring tool)
  ```bash
  sudo wget https://github.com/bcicen/ctop/releases/download/v0.7.7/ctop-0.7.7-linux-amd64 -O /usr/local/bin/ctop
sudo chmod +x /usr/local/bin/ctop
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
- [ansible](https://github.com/ansible/ansible)
- [docker-pretty-ps](https://github.com/politeauthority/docker-pretty-ps) (pretty print `docker ps`)
- [ranger](https://github.com/ranger/ranger) (terminal file manager)
- [ipython](https://github.com/ipython/ipython) (better python REPL)


```bash
pip install pipx
pipx install poetry --include-deps
pipx install ansible --include-deps
pipx install git+https://github.com/politeauthority/docker-pretty-ps.git#egg=docker-pretty-ps
pipx install ranger-fm --include-deps
pipx install ipython --include-deps
```

**You may want to also automatically update pipx-installed utils**
Updates all utils every week
`0 0 * * 0 pipx upgrade-all` as a cron job (`crontab -e`)

#### Cargo

- [rgipgrep](https://github.com/BurntSushi/ripgrep) (better `grep`)
- [lsd](https://github.com/Peltoche/lsd) (better `ls`)
- [bat](https://github.com/sharkdp/bat) (better `cat`)
- [starship](https://starship.rs/) (shell prompt)

```bash
cargo install ripgrep lsd bat fd
# Starship cargo install is super slow
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

### Shell

- [oh-my-bash](https://github.com/ohmybash/oh-my-bash) (install for consistency when you'll have to use bash, but use zsh as default)
- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) (`zsh` config framework)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-completions](https://github.com/zsh-users/zsh-completions)

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
mv ~/.bashrc.omb-backup ~/.bashrc

sudo apt install zsh

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
  ```bash
  sudo apt install kitty
  ```
- [kitty-themes](https://github.com/dexpota/kitty-themes) (Broadcast)

    ```bash
    THEME=Broadcast
    wget "https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/$THEME.conf" -P ~/.config/kitty/kitty-themes/themes
    cd ~/.config/kitty
    ln -s ./kitty-themes/themes/$THEME.conf ~/.config/kitty/theme.conf
    ```
