#  _              _    _
# | |            | |  (_)
# | | ___ __ ___ | | ___ _ __  _ __   ___ _   _
# | |/ / '_ ` _ \| |/ / | '_ \| '_ \ / _ \ | | |
# |   <| | | | | |   <| | | | | | | |  __/ |_| |
# |_|\_\_| |_| |_|_|\_\_|_| |_|_| |_|\___|\__, |
#   | |             | |              | (_) __/ |
#   | |__   __ _ ___| |__ ______ __ _| |_ |___/ ___  ___  ___
#   | '_ \ / _` / __| '_ \______/ _` | | |/ _` / __|/ _ \/ __|
#  _| |_) | (_| \__ \ | | |    | (_| | | | (_| \__ \  __/\__ \
# (_)_.__/ \__,_|___/_| |_|     \__,_|_|_|\__,_|___/\___||___/

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Workflows
alias dotfiles="cd ~/.dotfiles && nvim ."
alias roofw="cd ~/workspace/roofworx/roofworx-monorepo/ && tmux"
alias android-emulator="~/Android/Sdk/emulator/emulator"

# FZF fun stuff
alias sd='cd $(fd . '/home/kevin' -t d | fzf)'
alias sa='cd $(fd . '/home/kevin' -t d -H -I | fzf)'

# Pacman stuff
alias pacmanlist="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias pacexport="pacman -Qqen > ~/pkglist.txt"

# Hyprland stuff
alias ch="hyprpicker | tr -d '\n' | wl-copy"

# Shorthands
alias v="nvim"
alias k="kattis"
alias ki="kattis -i"
alias kw="kattis -w"
alias gst="git status"
alias lg="lazygit"
alias py="python3"
alias pyserve="python3 -m http.server"
alias chkports="sudo netstat -natp | grep LISTEN"
alias cls="clear"

# fhtl stuff
alias tfmt="terraform fmt --recursive"
alias tf="terraform"
alias awslogin-dev="export AWS_PROFILE=dev && aws sso login --profile dev"
alias awslogin-prd="export AWS_PROFILE=prd && aws sso login --profile prd"
