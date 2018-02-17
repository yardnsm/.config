#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../../_setup/initializer.sh"

# ---------------------------------------------

print_info "Transmission"

execute "defaults write org.m0k.transmission DeleteOriginalTorrent -bool true" \
"Delete the original torrent files"

execute "defaults write org.m0k.transmission DownloadChoice -string 'Constant' &&
  defaults write org.m0k.transmission DownloadFolder -string '$HOME/torrents'" \
"Use ~/torrents to store complete downloads"

execute "defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true &&
  defaults write org.m0k.transmission IncompleteDownloadFolder -string '$HOME/torrents/queued'" \
"Use ~/torrents/queued to store incomplete downloads"

execute "defaults write org.m0k.transmission WarningDonate -bool false" \
"Hide the donate message"

execute "defaults write org.m0k.transmission WarningLegal -bool false" \
"Hide the legal disclaimer"

# ---------------------------------------------

print_info "Google Chrome"

execute "defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false" \
"Disable backswipe"

execute "defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true" \
"Expand print dialog by default"

execute "defaults write com.google.Chrome DisablePrintPreview -bool true" \
"Use system-native print preview dialog"

# ---------------------------------------------

print_info "iTerm2"

execute "defaults write com.googlecode.iterm2 PromptOnQuit -bool false" \
"Do not display the annoying prompt when quitting iTerm"
