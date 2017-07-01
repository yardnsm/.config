# Enable aliases to be sudo’ed
alias sudo="sudo "

# Reload zsh config
alias reload='source ~/.zshrc'

# Quick navigation
alias hm="cd ~"
alias dt="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias dev="cd ~/dev"
alias ghb="cd ~/dev/github"
alias glb="cd ~/dev/gitlab"

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

# ls
alias ls="ls -G"
alias l="ls -lah"
alias la="ls -AF"
alias ll="ls -lFh"
alias lla="ls -lAFh"
alias lld="ls -l | grep ^d"

# Clear!
alias cl="clear"

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# chmod
alias x+="chmod +x"

# vim4life
alias :q="exit"
