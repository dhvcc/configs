FROM ubuntu:22.04

WORKDIR /root

# ubuntu only
RUN apt update --fix-missing
RUN apt install -y curl git build-essential zsh

# Install brew
ENV NONINTERACTIVE=1
ENV HOMEBREW_NO_AUTO_UPDATE=1
RUN curl -Lks -o install.sh https://raw.githubusercontent.com/dhvcc/configs/master/.cfg/install.sh && \
    chmod +x install.sh && \
    ./install.sh && \
    zsh -c "$HOME/.cfg/setup.sh"

#RUN echo 'export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"' >> "$HOME/.bashrc"
#ENV PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"

#RUN "$HOME/.cfg/setup.sh"

CMD bash
