# Configs

![desktop](https://github.com/user-attachments/assets/2516724b-2140-493f-8b81-6d1be886348f)

## Quick Install

**Prerequisites are only `bash` / `curl` / `git` (macOS should have them installed by default, although git would need user input to install after prompt)**

This will move every conflicting file from home into ~/.config-backup directory, so you can return to backup if needed

```shell
curl -Lks https://raw.githubusercontent.com/dhvcc/configs/master/.cfg/install.sh | /bin/sh
exec bash
```

This will run the setup for all of the utils that you need to run this config

```shell
"$HOME/.cfg/setup.sh"
```

**Warning**, Bash configs may be outdated, use `zsh` as your default

## Configuration

- Any additional rc stuff for your `.zshrc` you can add into `.config/.rc_extend.sh`

### Neofetch
- `neofetch` can be turned off with `NEOFETCH=0` (in something like `.config/.rc_extend.sh`)
- you can override default neofetch settings with your own theme. Just add `export NEOFETCH_THEME=name_of_your_theme` to `.rc_extend.sh` and add your settings into `~/.config/neofetch/themes/name_of_your_theme.sh` file

----------------

# Sections below will be re-written because of the new installer

----------------

## TODO
- Don't default editor to VIM
- Fix aliases when command is not found (ls/vim)
- Better extensibility support (redo .rc_extend.sh and friends)
- Better docs
- Revert config script
- Helper command (something like cfg help?)

## Dependencies

### System

Dependencies and software on ubuntu

```bash
sudo apt-get install -y htop xclip make vim curl \
       python3-dev python3-pip python3-venv \
       libpq-dev libsqlite3-dev
sudo apt install zsh cargo
wget https://github.com/lsd-rs/lsd/releases/download/v1.0.0/lsd-musl_1.0.0_amd64.deb && sudo dpkg -i lsd-musl_1.0.0_amd64.dev && rm lsd-musl_1.0.0_amd64.deb
sudo apt-get insatll -y neofetch unzip bat lsd fd-find ripgrep
ln -s $(which fdfind) ~/.local/bin/fd
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```

Software

- [pyenv](https://github.com/pyenv/pyenv-installer)
  ```bash
  curl https://pyenv.run | bash
  ```
- [fnm](https://github.com/Schniz/fnm)
  ```bash
  curl -fsSL https://fnm.vercel.app/install | bash
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
- [thinkfan](https://github.com/vmatare/thinkfan) (utility to control fan speeds of your ThinkPad)

### VIM / NEOVIM

- [nvim](https://github.com/neovim/neovim)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [coc.nvim](https://github.com/neoclide/coc.nvim)

#### Ubuntu install v0.7.2 from github

```bash
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
mv -f .bashrc.omb* .bashrc

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --keep-zshrc --unattended

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

exec zsh

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
