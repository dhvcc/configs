FROM ubuntu:22.04

WORKDIR /root

RUN apt-get update

RUN apt-get install -y curl wget git gcc g++ libffi-dev

RUN apt-get install -y htop xclip make vim curl \
    python3-dev python3-pip python3-venv \
    libpq-dev libsqlite3-dev \
    lzma-dev libreadline6-dev libbz2-dev

RUN apt-get install -y cargo bash zsh neofetch unzip ripgrep

RUN mkdir -p ~/.local/bin
RUN wget https://github.com/lsd-rs/lsd/releases/download/v1.0.0/lsd-musl_1.0.0_amd64.deb && \
    dpkg -i lsd-musl_1.0.0_amd64.deb && rm lsd-musl_1.0.0_amd64.deb
RUN  apt-get install -y fd-find && ln -s $(which fdfind) ~/.local/bin/fd
RUN apt-get install -y bat && ln -s $(which batcat) ~/.local/bin/bat

COPY . .

RUN curl https://pyenv.run | bash
RUN curl -fsSL https://fnm.vercel.app/install | bash && /bin/zsh -i -c 'fnm install 16'
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all

RUN ./.cfg/scripts/install-neovim.sh
RUN ./.cfg/scripts/install-omb.sh
RUN ./.cfg/scripts/install-omz.sh
RUN sh -c "$(curl -fsSL https://starship.rs/install.sh)" "" -f
RUN pip install pipx && \
    pipx install ansible --include-deps && \
    pipx install git+https://github.com/politeauthority/docker-pretty-ps.git#egg=docker-pretty-ps && \
    pipx install ranger-fm --include-deps && \
    pipx install poetry --include-deps && \
    pipx install ipython --include-deps

COPY .bashrc .zshrc ./
RUN rm -rf .cfg

CMD zsh
