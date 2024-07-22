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
export ANDROID_HOME=~/Android/Sdk/

# Fix Ctl-S
stty -ixon

# Aliases
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# pnpm
export PNPM_HOME="/home/kevin/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/usr/etc/profile.d/conda.sh" ]; then
		. "/usr/etc/profile.d/conda.sh"
	else
		export PATH="/usr/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<
. "$HOME/.cargo/env"
