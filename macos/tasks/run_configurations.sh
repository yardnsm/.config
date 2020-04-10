#!/usr/bin/env bash

# Based on alrra"s .osx file, with a few custom settings:
# https://github.com/alrra/dotfiles/raw/master/os/os_x/preferences/set_ui_and_ux_preferences.sh

# ---------------------------------------------

output::info "General UI/UX"

commands::execute "defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true" \
  "Avoid creating '.DS_Store' files on network volumes"

commands::execute "defaults write com.apple.menuextra.battery ShowPercent -string 'YES'" \
  "Show battery percentage from the menu bar"

commands::execute "defaults write com.apple.CrashReporter UseUNC 1" \
  "Make crash reports appear as notifications"

commands::execute "defaults write com.apple.LaunchServices LSQuarantine -bool false" \
  "Disable 'Are you sure you want to open this application?' dialog"

commands::execute "defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true" \
  "Automatically quit the printer app once the print jobs are completed"

commands::execute "defaults write com.apple.screencapture disable-shadow -bool false" \
  "Enable shadow in screenshots"

commands::execute "defaults write com.apple.screencapture type -string 'png'" \
  "Save screenshots as PNGs"

commands::execute "defaults write com.apple.screencapture location -string '$HOME/Desktop'" \
  "Save screenshots to the Desktop"

commands::execute "defaults write NSGlobalDomain AppleFontSmoothing -int 2" \
  "Enable subpixel font rendering on non-Apple LCDs"

commands::execute "defaults write NSGlobalDomain AppleShowScrollBars -string 'Always'" \
  "Always show scrollbars"

commands::execute "defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true" \
  "Expand save panel by default"

commands::execute "defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true" \
  "Expand print panel by default"

# ---------------------------------------------

output::info "Trackpad and keyboard"

commands::execute "defaults write NSGlobalDomain AppleKeyboardUIMode -int 3" \
  "Enable full keyboard access for all controls"

commands::execute "defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false" \
  "Disable press-and-hold in favor of key repeat"

commands::execute "defaults write NSGlobalDomain 'InitialKeyRepeat_Level_Saved' -int 10" \
  "Set delay until repeat"

commands::execute "defaults write NSGlobalDomain KeyRepeat -float 1" \
  "Set the key repeat rate to fast"

commands::execute "defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false" \
  "Disable smart quotes"

commands::execute "defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false" \
  "Disable smart dashes"

commands::execute "defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true &&
  defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144" \
  "Use scroll gesture with the Ctrl (^) modifier key to zoom"

# ---------------------------------------------

output::info "Language and Region"

commands::execute "defaults write NSGlobalDomain AppleLanguages -array 'en'" \
  "Set language"

commands::execute "defaults write NSGlobalDomain AppleMeasurementUnits -string 'Centimeters'" \
  "Set measurement units"

commands::execute "defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false" \
  "Disable auto-correct"

# ---------------------------------------------

output::info "Finder"

commands::execute "defaults write com.apple.finder ShowRecentTags -bool false" \
  "Do not show recent tags"

commands::execute "defaults write NSGlobalDomain AppleShowAllExtensions -bool true" \
  "Show all filename extensions"

commands::execute "defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'" \
  "Use list view in all Finder windows by default"

commands::execute "defaults write com.apple.finder NewWindowTarget -string 'PfDe' &&
  defaults write com.apple.finder NewWindowTargetPath -string 'file://${HOME}/Desktop/'" \
  "Set 'Desktop' as the default location for new Finder windows"

commands::execute "defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'" \
  "Search the current directory by default"

commands::execute "defaults write com.apple.finder ShowPathbar -bool true" \
  "Show path bar"

commands::execute "defaults write com.apple.finder ShowStatusBar -bool true" \
  "Show status bar"

commands::execute "defaults write com.apple.finder QLEnableTextSelection -bool true" \
  "Allow text selection in Quick Look"

# ---------------------------------------------

output::info "Dock and Dashboard"

commands::execute "defaults write com.apple.dashboard mcx-disabled -bool true" \
  "Disable Dashboard"

commands::execute "defaults write com.apple.dock expose-group-by-app -bool false" \
  "Do not Group windows by application in Mission Control"

commands::execute "defaults write com.apple.dock show-process-indicators -bool true" \
  "Show indicator lights for open applications"

commands::execute "defaults write com.apple.dock tilesize -int 55" \
  "Set Dock icon size"

commands::execute "defaults write com.apple.dock dashboard-in-overlay -bool true" \
  "Do not show Dashboard as space"

commands::execute "defaults write com.apple.dock show-recents -bool false" \
  "Do not show recent applications in Dock"

commands::execute "defaults write com.apple.dock autohide-time-modifier -float 0.5" \
  "Speed-up the animation when hiding/showing the Dock"

# ---------------------------------------------

output::info "Safari"

commands::execute "defaults write com.apple.Safari AutoOpenSafeDownloads -bool false" \
  "Disable opening 'safe' files automatically"

commands::execute "defaults write com.apple.Safari AutoOpenSafeDownloads -bool false" \
  "Disable opening 'safe' files automatically"

commands::execute "defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true &&
  defaults write com.apple.Safari IncludeDevelopMenu -bool true &&
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true" \
  "Enable the 'Develop' menu and the 'Web Inspector'"

commands::execute "defaults write com.apple.Safari HomePage -string 'about:blank'" \
  "Set home page to 'about:blank'"

commands::execute "defaults write com.apple.Safari IncludeInternalDebugMenu -bool true" \
  "Enable 'Debug' menu"

commands::execute "defaults write com.apple.Safari ShowFavoritesBar -bool false" \
  "Hide bookmarks bar by default"

commands::execute "defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true" \
  "Show the full URL in the address bar"

commands::execute "defaults write com.apple.Safari SuppressSearchSuggestions -bool true &&
  defaults write com.apple.Safari UniversalSearchEnabled -bool false" \
  "Don’t send search queries to Apple"

commands::execute "defaults write NSGlobalDomain WebKitDeveloperExtras -bool true" \
  "Add a context menu item for showing the 'Web Inspector' in web views"

# ---------------------------------------------

output::info "Mac Applications"

commands::execute "defaults write com.apple.TextEdit PlainTextEncoding -int 4 &&
  defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4" \
  "Open and save files as UTF-8 encoded in TextEdit"

commands::execute "defaults write com.apple.TextEdit RichText -" \
  "Use plain text mode for new documents in TextEdit"

commands::execute "defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true" \
  "Prevent Photos from opening automatically when devices are plugged in"

# ---------------------------------------------

output::info "Time Machine"

commands::execute "defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true" \
  "Prevent Time Machine from prompting to use new hard drives as backup volume"
