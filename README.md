# Configs

## Install

```shell
curl -Lks https://raw.githubusercontent.com/dhvcc/configs/master/.cfg/install.sh | /bin/sh
```

**Warning**, Bash configs are outdated

## Dependencies

### System

- [pyenv](https://github.com/pyenv/pyenv-installer)
- [nvm](https://github.com/nvm-sh/nvm)
- [nerd-fonts](https://github.com/ryanoasis/nerd-fonts) (Hack Nerd Font Mono)
- [mon2cam](https://github.com/ShayBox/Mon2Cam) (for dual-monitor linux setup)
- [matter](https://github.com/mateosss/matter) (GRUB theme)

```bash
sudo ./matter.py -i manjaro linux manjaro manjaro microsoft-windows cog microsoft-windows memory \
-hl ef233c -fg 2b2d42 -bg edf2f4 \
-ff /usr/share/fonts/Josefin_Sans/static/JosefinSans-Regular.ttf \
-fn Josefin Sans Regular -fs 16
```

### VIM

- [nvim](https://github.com/theniceboy/nvim)
- [vim-plug](https://github.com/junegunn/vim-plug)
- [coc.nvim](https://github.com/neoclide/coc.nvim)

### Shell

- [docker-pretty-ps](https://github.com/politeauthority/docker-pretty-ps) (pretty print `docker ps`)

    ```bash
    pip install git+https://github.com/politeauthority/docker-pretty-ps.git#egg=docker-pretty-ps --upgrade
    ```

- [htop](https://github.com/htop-dev/htop/) (better `top`)
- [fzf](https://github.com/junegunn/fzf) (`Ctrl+R` shell history search)
- [rgipgrep](https://github.com/BurntSushi/ripgrep) (better `grep`) `cargo`
- [lsd](https://github.com/Peltoche/lsd) (better `ls`)
- [bat](https://github.com/sharkdp/bat) (better `cat`) `cargo`
- [ranger](https://github.com/ranger/ranger) (terminal file manager)
- [most](http://www.jedsoft.org/most/) (better pager than `less`, used for `man`)
- [spaceship](https://github.com/denysdovhan/spaceship-prompt) (shell prompt)

### ZSH

- [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) (`zsh` config framework)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-completions](https://github.com/zsh-users/zsh-completions)
- [poetry completion](https://python-poetry.org/docs/#enable-tab-completion-for-bash-fish-or-zsh)

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
```

### Terminal

- [kitty](https://github.com/kovidgoyal/kitty) (fast and feature-rich terminal emulator)
- [kitty-themes](https://github.com/dexpota/kitty-themes) (Broadcast)
- [nautilus-terminal](https://github.com/flozz/nautilus-terminal#ubuntu-2004-and-later)
