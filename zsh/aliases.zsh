# Enable aliases to be sudo’ed
alias sudo="sudo "

# Using the common $TERM for SSH as the remote server probably won't have my
# current one
alias ssh='TERM=xterm-256color ssh'

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
alias ls="ls --color"
alias l="ls -lah"
alias la="ls -AF"
alias ll="ls -lFh"
alias lla="ls -lAFh"
alias lld="ls -l | grep ^d"

# Clear!
alias cl="clear"
alias cls="clear"

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# chmod
alias x+="chmod +x"

# Exit quick
alias qq="exit"

# Revert back to defauly base16 theme
alias deft='base16_classic-dark'

# 🤔
alias mp3='youtube-dl --extract-audio --audio-format mp3 --no-playlist -o "~/Downloads/%(title)s-%(id)s.%(ext)s"'
