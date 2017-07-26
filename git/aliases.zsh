alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias gl='git pull'
alias gp='git push'
alias gpyolo='git push --no-verify'
alias gd='git diff'
alias gac='git add . && git commit'

# How many commits?
alias git-count='git shortlog -sn'

# Go back to the root of the git repo
alias gr='git rev-parse 2>/dev/null && cd "./$(git rev-parse --show-cdup)"'
