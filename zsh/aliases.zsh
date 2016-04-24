# --------------------------------------- #
# | ZSH Aliases
# --------------------------------------- #

# Enable aliases to be sudo’ed
alias sudo="sudo "

# Reload zsh config
alias reloadd='source ~/.zshrc'

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Git aliases (in addition to `.gitconfig`)
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

# `cd` to Git repo root
alias gr='git rev-parse 2>/dev/null && cd "./$(git rev-parse --show-cdup)"'

# ls
alias ls="ls -G"
alias l="ls -lah"
alias la="ls -AF"
alias ll="ls -lFh"
alias lla="ls -lAFh"
alias lld="ls -l | grep ^d"

# Always open atom in the current dir
alias atom='atom .'

# chmod
alias chmx="chmod +x"
alias x+="chmod +x" # idk

# Open stuff
alias o="open"
alias oo="open ."
