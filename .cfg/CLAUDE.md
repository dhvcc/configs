# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository using a **bare Git repository** pattern. The repository is stored in `~/.cfg/` and manages dotfiles across the home directory (`~`) as the working tree. This allows version control of configuration files without turning the entire home directory into a git repository.

### Key Architecture Pattern

The repository uses the alias `cfg` (defined in `.config/.aliasrc.sh`) to interact with git:
```bash
alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
```

**Important**: When making git operations on this repository, always use:
- `git --git-dir=$HOME/.cfg --work-tree=$HOME <command>`
- OR the `cfg` alias if available in the shell environment

Standard `git` commands will not work correctly as this is a bare repository with a separate work-tree.

## Working with This Repository

### Common Commands

**Check status of dotfiles:**
```bash
git --git-dir=$HOME/.cfg --work-tree=$HOME status
```

**Add a new config file:**
```bash
git --git-dir=$HOME/.cfg --work-tree=$HOME add <file-path>
```

**Commit changes:**
```bash
git --git-dir=$HOME/.cfg --work-tree=$HOME commit -m "message"
```

**Push to remote:**
```bash
git --git-dir=$HOME/.cfg --work-tree=$HOME push
```

**View tracked files:**
```bash
git --git-dir=$HOME/.cfg ls-tree -r master --name-only
```

### Installation & Setup

**Fresh installation (on a new machine):**
```bash
curl -Lks https://raw.githubusercontent.com/dhvcc/configs/master/.cfg/install.sh | /bin/sh
exec bash
```

**Run setup to install all dependencies:**
```bash
"$HOME/.cfg/setup.sh"
```

The setup script orchestrates installation of:
1. Homebrew (via `scripts/install-brew.sh`)
2. Homebrew packages (via `scripts/install-packages.sh`)
3. uv tools (poetry, ansible)
4. Node.js LTS (via nvm)
5. Rust toolchain
6. Oh-My-Bash (via `scripts/install-omb.sh`)
7. Oh-My-Zsh + plugins (via `scripts/install-omz.sh`)

**Build Docker image for testing:**
```bash
docker build -f ./.cfg/Dockerfile -t dotfiles-test .
docker run -it dotfiles-test
```

The Dockerfile includes additional system packages for development:
- Build tools: `build-essential`, `make`
- Utilities: `htop`, `xclip`
- Python development: `python3-dev`, `python3-pip`, `python3-venv`
- Database libraries: `libpq-dev`, `libsqlite3-dev`

## Configuration Architecture

### Shell Configuration (.zshrc)

The main shell configuration is in `.zshrc`, which:
- Loads Oh-My-Zsh with plugins (zsh-autosuggestions, zsh-syntax-highlighting, fzf, git, docker, python, node, rust, etc.)
- Initializes Starship prompt
- Sources additional configs from `.config/.aliasrc.sh` and `.config/.completionrc.sh`
- Optionally sources `.config/.rc_extend.sh` for user-specific extensions

**Customization pattern**: User-specific additions should go in `~/.config/.rc_extend.sh` (not tracked in git) rather than modifying `.zshrc` directly.

### Starship Prompt (.config/starship.toml)

Custom prompt configuration showing:
- Username (always visible)
- Hostname (SSH only)
- Current directory
- Git branch and status
- Python version/virtualenv
- Current time

### Key Aliases (.config/.aliasrc.sh)

- `cfg` - Git operations on the dotfiles repo
- `vim` → `lvim` - LunarVim as default editor
- `ls` → `lsd -A --group-dirs first` - Modern ls replacement
- `lg` → `lazygit` - Terminal UI for git
- `ipy` - IPython REPL launcher
- `gbn` - Get current git branch name
- `dus` - Display directory sizes sorted
- `lss` - List files sorted by size

### Environment Variables

- `EDITOR` and `VISUAL` → `lvim` (LunarVim)
- `FZF_DEFAULT_COMMAND` - Configured to use ripgrep with sensible ignores (`.venv/`, `venv/`, `node_modules/`)
- `BAT_THEME` → `"Nord"`
- Path includes: `~/.local/bin`, `~/go/bin`, `~/.cargo/bin`, Homebrew paths

## Package Management

### Homebrew Packages (scripts/install-packages.sh)

Core utilities installed via Homebrew:
- **Editors**: vim, neovim, LunarVim (lvim)
- **Shell tools**: starship, neofetch, fzf, btop, wget, gh, lazygit, unzip
- **Development**: uv, nvm, go
- **Container tools**: oxker (Docker monitoring), k9s (Kubernetes monitoring)
- **Rust utilities**: lsd (ls), fd (find), ripgrep (grep), bat (cat)
- **Fonts**: font-hack-nerd-font (for terminal icons)

**Note**: The install script installs `unzip` first and reloads the brew environment before installing other packages to ensure font casks can be installed successfully.

### Python Tools (via uv)

- `poetry` - Python dependency management
- `ansible` - Infrastructure automation

### Zsh Plugins (via Oh-My-Zsh)

Plugins installed in `~/.oh-my-zsh-custom/plugins/`:
- `zsh-syntax-highlighting`
- `zsh-autosuggestions`
- `zsh-completions`

## File Organization

**Scripts directory** (`.cfg/scripts/`):
- `install-brew.sh` - Homebrew installation
- `install-packages.sh` - Homebrew package installation (installs unzip first, then other packages)
- `install-lvim.sh` - LunarVim installation (checks for neovim, gracefully skips if not found)
- `install-omb.sh` - Oh-My-Bash setup
- `install-omz.sh` - Oh-My-Zsh + plugins setup
- `import-bash-history-to-zsh.py` - Migration utility

**Config directory** (`~/.config/`):
- `.aliasrc.sh` - Shell aliases
- `.completionrc.sh` - Shell completions
- `starship.toml` - Prompt configuration
- `bat/config` - Bat (cat replacement) config
- `lvim/` - LunarVim configuration
- `neofetch/` - Neofetch themes and resources

## Special Considerations

1. **Git status is configured to not show untracked files** (`status.showUntrackedFiles no`) to avoid clutter from home directory files
2. **Commit verbose mode is enabled** for better commit message context
3. **The repository uses `master` as the default branch**
4. **Neofetch can be disabled** by setting `NEOFETCH=0` in `.config/.rc_extend.sh`
5. **Custom neofetch themes** can be used by setting `NEOFETCH_THEME` environment variable

## CI/CD

GitHub Actions workflow (`.github/workflows/docker-publish.yml`) builds and publishes a Docker image to GitHub Container Registry on version tags (`v*`). The image uses the Dockerfile at `.cfg/Dockerfile` to create a complete testing environment with all dotfiles and dependencies installed.
