# Bash aliases
if [ -f "$HOME/.bash_aliases" ]; then
	. "$HOME/.bash_aliases"
fi

# Set path to include local binaries
export PATH=$PATH:$HOME/.local/bin

# Custom prompt
export PS1="\[\e[01;37m\]\u\[\e[01;34m\]@\h:\[\e[01;36m\]\w\[\e[01;33m\]\$\[\e[00m\]"

# Custom env variables
export KEVIN_ENV_VAR=7

# Disable Ctl-s
stty -ixon
