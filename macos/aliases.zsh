# Open stuff
alias o="open"
alias oo="open ."

alias afk="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"

# Hide/Show desktop icons
alias hdesk="defaults write com.apple.finder CreateDesktop -bool false; killall Finder"
alias sdesk="defaults write com.apple.finder CreateDesktop -bool true; killall Finder"
