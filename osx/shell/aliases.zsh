# --------------------------------------- #
# | ZSH Aliases for OSX
# --------------------------------------- #

# Open stuff
alias o="open"
alias oo="open ."

# Hide/Show desktop icons
alias hdesk="defaults write com.apple.finder CreateDesktop -bool false;killall Finder"
alias sdesk="defaults write com.apple.finder CreateDesktop -bool true;killall Finder"
