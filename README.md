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
- [ ] Don't default editor to VIM
- [ ] Fix aliases when command is not found (ls/vim)
- [ ] Better extensibility support (redo .rc_extend.sh and friends)
- [ ] Better docs
- [ ] Revert config script
- [ ] Helper command (something like cfg help?)

## Dependencies

### System

Dependencies and software on ubuntu

```bash
sudo apt-get install -y htop xclip make vim curl \
       python3-dev python3-pip python3-venv \
       libpq-dev libsqlite3-dev
```

### Shell

Software

- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) (Hack Nerd Font Mono)
- [fzf](https://github.com/junegunn/fzf) (used for shell history search, vim file search, but can also be used fore many more things)
- [btop](https://github.com/aristocratos/btop) (fancier htop)
- [oxker](https://github.com/mrjackwills/oxker) (docker monitoring tool)
- [k9s](https://github.com/derailed/k9s) (k8s monitoring tool)

```bash
brew install font-hack-nerd-font fzf btop oxker
```

### VIM / NEOVIM

- [nvim](https://github.com/neovim/neovim)
- [LunarVIM](https://www.lunarvim.org/)

```bash
brew install nvim
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
```

#### Pip

Install uv

```bash
wget -qO- https://astral.sh/uv/install.sh | sh
```

- [poetry](https://github.com/python-poetry/poetry)
- [ansible](https://github.com/ansible/ansible)
- [ipython](https://github.com/ipython/ipython) (better python REPL, invoke with ipy inside of a venv)


```bash
uv install poetry --include-deps
uv install ansible --include-deps
```

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
```

### Terminal

- [Warp](https://github.com/warpdotdev/Warp)
  ```bash
  brew install --cask warp
  ```

