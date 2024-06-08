FROM archlinux:latest

RUN pacman --noconfirm -Syu
RUN pacman --noconfirm -S git zsh

RUN useradd -m kevin
RUN git clone --depth=1 https://github.com/kmkinney/.dotfiles /home/kevin/.dotfiles/

USER kevin
WORKDIR /home/kevin/.dotfiles

# Test dotfiles setup commands for terminal apps
RUN sh ./zsh/setup.sh

CMD zsh

