function gitzip() {
  git archive -o $(basename `git rev-parse --show-toplevel`).zip HEAD
}

function gittgz() {
  git archive -o $(basename `git rev-parse --show-toplevel`).tgz HEAD
}

function gsync() {
  git add .
  git commit -m "Sync ($(date))"
  git push origin master
}

alias g='git'
alias gs='git status -sb'
alias ga='git add'
alias gap='git add --patch'
alias gaa='git add .'
alias gc='git commit'
alias gac='git add . && git commit'
alias gcl='git clone'
alias gco='git checkout'
alias gb='git branch'
alias gl='git pull'
alias gp='git push'
alias gpyolo='git push --no-verify'
alias gd='git diff'
alias gdc='git diff --cached'

# Go back to the root of the git repo
alias gr='git rev-parse 2>/dev/null && cd "./$(git rev-parse --show-cdup)"'
