# vim: set foldmethod=marker foldlevel=0:

# ---[ Base ]---------------------------------------------------------------------------------------

# Enable aliases to be sudo’ed
alias sudo="sudo "

# Using the common $TERM for SSH as the remote server probably won't have my
# current one
alias ssh='TERM=xterm-256color ssh'

# Reload zsh config
alias reload='source $ZDOTDIR/.zshrc'

# Quick navigation
alias dt="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias dev="cd ~/dev"

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

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

# 🤔
alias mp3='youtube-dl --extract-audio --audio-format mp3 --no-playlist -o "~/Downloads/%(title)s-%(id)s.%(ext)s"'

# Default to neovim
if hash nvim 2>/dev/null; then
  alias vim="nvim"
fi

# ---[ ls ]-----------------------------------------------------------------------------------------

LSCMD='ls'

if [[ -n $IS_MACOS ]]; then

  # Use GNU tools on OSX instead of BSD
  hash gdircolors 2>/dev/null && alias dircolors='gdircolors'
  hash gfind 2>/dev/null && alias find='gfind'
  hash gsort 2>/dev/null && alias sort='gsort'
  hash gstat 2>/dev/null && alias stat='gstat'
  hash gls 2>/dev/null && LSCMD='gls'
fi

# Listing directory contents
alias ls="LC_COLLATE=C ${LSCMD} --color=auto --group-directories-first"
unset LSCMD

alias l="ls -lah"
alias la="ls -AF"
alias ll="ls -lFh"
alias lla="ls -lAFh"
alias lld="ls -l | grep ^d"

# ---[ git ]----------------------------------------------------------------------------------------

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

# ---[ macOS specifics ]----------------------------------------------------------------------------

if [[ -n $IS_MACOS ]]; then

  # Open stuff
  alias o="open"
  alias oo="open ."

  # https://stackoverflow.com/questions/64951024/how-can-i-run-two-isolated-installations-of-homebrew/64951025#64951025
  alias brow='arch --x86_64 /usr/local/Homebrew/bin/brew'
  alias ib='PATH=/usr/local/bin:$PATH'

  # Start the screen saver
  alias afk="/System/Library/CoreServices/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine"

  # Hide/Show desktop icons
  alias hdesk="defaults write com.apple.finder CreateDesktop -bool false; killall Finder"
  alias sdesk="defaults write com.apple.finder CreateDesktop -bool true; killall Finder"

  # Hide/Show hidden files in finder
  alias hfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
  alias sfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
fi

# ---[ npm ]----------------------------------------------------------------------------------------

# Make npm fast (use the cache)
alias npmo="npm --cache-min 9999999"

alias npmt="npm test"
alias npms="npm start"
alias npmb="npm run build"
alias npml="npm run lint"

alias npmi="npm install"
alias npmis="npm install --save"
alias npmid="npm install --save-dev"
alias npmig="npm install -g"
