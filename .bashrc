# FZF
source /usr/share/doc/fzf/examples/key-bindings.bash
source /usr/share/doc/fzf/examples/completion.bash

# Enable pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


###############
# Completions #
eval "$(gh completion -s bash)"
complete -C $(which aws_completer) aws
completions=(
  git
  composer
  ssh
)
#             #
###############

aliases=(
  general
)

plugins=(
  git
  bashmarks
)


##############
# Oh-my-bash #
export OSH=$HOME/.oh-my-bash
OSH_THEME="dhvcc"
source $OSH/oh-my-bash.sh
#            #
##############


# Mon2cam
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"

# NVM config
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias mon2cam="deno run --unstable -A -r -q https://raw.githubusercontent.com/ShayBox/Mon2Cam/master/src/mod.ts"
