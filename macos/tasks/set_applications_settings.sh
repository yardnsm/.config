#!/usr/bin/env bash

# ---------------------------------------------

output::info "Transmission"

commands::execute "defaults write org.m0k.transmission DeleteOriginalTorrent -bool true" \
  "Delete the original torrent files"

commands::execute "defaults write org.m0k.transmission DownloadChoice -string 'Constant' &&
  defaults write org.m0k.transmission DownloadFolder -string '$HOME/Downloads/torrents'" \
  "Use ~/Downloads/torrents to store complete downloads"

# commands::execute "defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true &&
#   defaults write org.m0k.transmission IncompleteDownloadFolder -string '$HOME/torrents/queued'" \
#   "Use ~/torrents/queued to store incomplete downloads"

commands::execute "defaults write org.m0k.transmission WarningDonate -bool false" \
  "Hide the donate message"

commands::execute "defaults write org.m0k.transmission WarningLegal -bool false" \
  "Hide the legal disclaimer"

# ---------------------------------------------

output::info "Google Chrome"

commands::execute "defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false" \
  "Disable backswipe"

commands::execute "defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true" \
  "Expand print dialog by default"

commands::execute "defaults write com.google.Chrome DisablePrintPreview -bool true" \
  "Use system-native print preview dialog"

# ---------------------------------------------

output::info "iTerm2"

commands::execute "defaults write com.googlecode.iterm2 PromptOnQuit -bool false" \
  "Do not display the annoying prompt when quitting iTerm"
