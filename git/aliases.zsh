# Git aliases (in addition to `.gitconfig`)
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gb='git branch'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias glog="git l"
alias git-undo='git reset --soft HEAD~1'
alias git-count='git shortlog -sn'
alias git-undopush="git push -f origin HEAD^:master"
alias gitac='git add . ; git commit'
alias gr='git rev-parse 2>/dev/null && cd "./$(git rev-parse --show-cdup)"' # `cd` to a Git repo root
