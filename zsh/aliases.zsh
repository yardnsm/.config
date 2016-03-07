# --------------------------------------- #
# | ZSH Aliases
# --------------------------------------- #

# Reload zsh config
alias reloadd='source ~/.zshrc'

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Git aliases
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

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU
    colorflag="--color"
else # OSX
    colorflag="-G"
fi

# ls
alias ls="ls ${colorflag}"
alias l="ls -lah"
alias la="ls -AF"
alias ll="ls -lFh"
alias lla="ls -lAFh"
alias lld="ls -l | grep ^d"

# Always open atom in the current dir
alias atom='atom .'

# My IP
alias myip="ifconfig | grep 'inet ' | grep -v 127.0.0.1 | awk '{print \$2}'"

# chmod
alias chmx="chmod +x"
