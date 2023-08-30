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
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/kevin/Downloads/installers/google-cloud-sdk/path.zsh.inc' ]; then . '/home/kevin/Downloads/installers/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/kevin/Downloads/installers/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/kevin/Downloads/installers/google-cloud-sdk/completion.zsh.inc'; fi
