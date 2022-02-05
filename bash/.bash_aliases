# Bash alias file

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# dotfiles aliases

# my custom aliases
alias gst="git status"
alias py="python3"
alias pyserve="python3 -m http.server"
alias cls="clear"
alias tfmt="terraform fmt --recursive"
alias tf="terraform"
alias awslogin-dev="export AWS_PROFILE=dev && aws sso login --profile dev"
alias awslogin-prd="export AWS_PROFILE=prd && aws sso login --profile prd"
