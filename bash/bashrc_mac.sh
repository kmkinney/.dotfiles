# BASH CONFIG MACOS
# Author: Kevin Kinney

# Load aliases
[ -f $HOME/.bash_aliases ] && source $HOME/.bash_aliases

# Setup bash completion
[ -f /usr/local/etc/bash_completion ] && source /usr/local/etc/bash_completion
[ -f $HOME/.git-completion.bash ] && source $HOME/.git-completion.bash
# Set Prompt
export PS1="\[\033[01;32m\]\W>\[\e[00m\] "
# export PS1="\[\e[01;42m\]\W\[\e[00m\]\[\e[01;32m\]\[\e[00m\]  "

# Silence ZSH warning
export BASH_SILENCE_DEPRECATION_WARNING=1

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# Java Home
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
export JDK_HOME=$JAVA_HOME

# Android Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Maven
export M3_HOME=/usr/local/opt/maven@3.8
export M3=$M3_HOME/bin
export PATH=$PATH:$M3
