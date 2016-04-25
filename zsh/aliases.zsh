# --------------------------------------- #
# | ZSH Aliases
# --------------------------------------- #

# Enable aliases to be sudo’ed
alias sudo="sudo "

# Reload zsh config
alias reloadd='source ~/.zshrc'

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

# chmod
alias chmx="chmod +x"
alias x+="chmod +x"

# Open stuff
alias o="open"
alias oo="open ."
