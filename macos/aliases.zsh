# Open stuff
alias o="open"
alias oo="open ."

alias afk="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"

# Hide/Show desktop icons
alias hdesk="defaults write com.apple.finder CreateDesktop -bool false; killall Finder"
alias sdesk="defaults write com.apple.finder CreateDesktop -bool true; killall Finder"

# Hide/Show hidden files in finder
alias hfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
alias sfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
