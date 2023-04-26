#  _              _    _
# | |            | |  (_)
# | | ___ __ ___ | | ___ _ __  _ __   ___ _   _
# | |/ / '_ ` _ \| |/ / | '_ \| '_ \ / _ \ | | |
# |   <| | | | | |   <| | | | | | | |  __/ |_| |
# |_|\_\_| |_| |_|_|\_\_|_| |_|_| |_|\___|\__, |
#                                          __/ |
#                                         |___/
# simple bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# env
export PATH=$PATH:$HOME/.local/bin
export PS1="\[\e[01;37m\]\u\[\e[01;34m\]@\h:\[\e[01;36m\]\w\[\e[01;33m\]\$\[\e[00m\]"
export MOZ_ENABLE_WAYLAND=1

# Fix Ctl-S
stty -ixon

# Aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
