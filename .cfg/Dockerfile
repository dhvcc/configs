FROM ubuntu:24.04

WORKDIR /root
RUN apt update --fix-missing
RUN apt install -y curl git build-essential zsh sudo

RUN useradd -m user
RUN usermod -aG sudo user
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Install brew
ENV NONINTERACTIVE=1
ENV HOMEBREW_NO_AUTO_UPDATE=123

WORKDIR /home/user
USER user

RUN mkdir ./.cfg
COPY .zshrc .bashrc ./
COPY ./.config ./.config
COPY ./.cfg ./.cfg


ENV PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"
ENV HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"
ENV HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"
ENV HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"
RUN echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> "$HOME/.bashrc" && \
    echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH"' >> "$HOME/.zshenv"

RUN bash -c 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" && "$HOME/.cfg/setup.sh"'

CMD zsh
