# --------------------------------------- #
# | ZSH Aliases
# --------------------------------------- #

# Enable aliases to be sudo’ed
alias sudo="sudo "

# Reload zsh config
alias reloadd='source ~/.zshrc'

# --------------------------------------- #
# | Quick navigation
# --------------------------------------- #

aliad hm="cd ~"
aliad dt="cd ~/Desktop"
aliad dl="cd ~/Downloads"
aliad dev="cd ~/dev"
aliad ghb="cd ~/dev/github"
aliad glb="cd ~/dev/gitlab"

# --------------------------------------- #
# | Other stuff
# --------------------------------------- #

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

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# chmod
alias chmx="chmod +x"
alias x+="chmod +x"
