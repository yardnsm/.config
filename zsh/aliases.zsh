# Enable aliases to be sudo’ed
alias sudo="sudo "

# Reload zsh config
alias reload='source ~/.zshrc'

# Quick navigation
alias dt="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias dev="cd ~/dev"

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

# Exit quick
alias qq="exit"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Revert back to defauly base16 theme
alias deft='base16_classic-dark'
