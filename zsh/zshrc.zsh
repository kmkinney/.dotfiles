#  _              _    _
# | |            | |  (_)
# | | ___ __ ___ | | ___ _ __  _ __   ___ _   _ 
# | |/ / '_ ` _ \| |/ / | '_ \| '_ \ / _ \ | | |
# |   <| | | | | |   <| | | | | | | |  __/ |_| |
# |_|\_\_| |_| |_|_|\_\_|_| |_|_| |_|\___|\__, |
#                                          __/ |
#                                         |___/ 
# .zshrc config file


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#   ___ _ ____   __
#  / _ \ '_ \ \ / /
# |  __/ | | \ V /
#  \___|_| |_|\_/

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export ANDROID_HOME=$HOME/Android/Sdk/
export KATTIS_HOME=$HOME/workspace/competitive-programming/kattis/problems/
export DOTFILES_HOME=$HOME/.dotfiles/
export MOZ_ENABLE_WAYLAND=1

# Theme
# powerlevel10k/powerlevel10k
# eastwood
ZSH_THEME="powerlevel10k/powerlevel10k"

#        _             _
#       | |           (_)
#  _ __ | |_   _  __ _ _ _ __  ___
# | '_ \| | | | |/ _` | | '_ \/ __|
# | |_) | | |_| | (_| | | | | \__ \
# | .__/|_|\__,_|\__, |_|_| |_|___/
# | |             __/ |
# |_|            |___/

plugins=(
  git
  git-open
  zsh-autosuggestions
  cp
)

[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

# Options
set -o vi

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/kevin/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
