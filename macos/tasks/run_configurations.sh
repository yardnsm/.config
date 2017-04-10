#!/usr/bin/env bash

# Based on alrra's .osx file, with a few custom settings:
# https://github.com/alrra/dotfiles/raw/master/os/os_x/preferences/set_ui_and_ux_preferences.sh

# ---------------------------------------------

print_info "General UI/UX"

execute 'defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true' \
'Avoid creating ".DS_Store" files on network volumes'

execute 'defaults write com.apple.menuextra.battery ShowPercent -string "YES"' \
'Show battery percentage from the menu bar'

execute 'defaults write com.apple.CrashReporter UseUNC 1' \
'Make crash reports appear as notifications'

execute 'defaults write com.apple.LaunchServices LSQuarantine -bool false' \
'Disable "Are you sure you want to open this application?" dialog'

execute 'defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true' \
'Automatically quit the printer app once the print jobs are completed'

execute 'defaults write com.apple.screencapture disable-shadow -bool false' \
'Enable shadow in screenshots'

execute 'defaults write com.apple.screencapture type -string "png"' \
'Save screenshots as PNGs'

execute 'defaults write com.apple.screencapture location -string "$HOME/Desktop"' \
'Save screenshots to the Desktop'

execute 'defaults write NSGlobalDomain AppleFontSmoothing -int 2' \
'Enable subpixel font rendering on non-Apple LCDs'

execute 'defaults write NSGlobalDomain AppleShowScrollBars -string "Always"' \
'Always show scrollbars'

execute 'defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true' \
'Expand save panel by default'

execute 'defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true' \
'Expand print panel by default'

# ---------------------------------------------

print_info "Trackpad and keyboard"

execute 'defaults write NSGlobalDomain AppleKeyboardUIMode -int 3' \
'Enable full keyboard access for all controls'

execute 'defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false' \
'Disable press-and-hold in favor of key repeat'

execute 'defaults write NSGlobalDomain "InitialKeyRepeat_Level_Saved" -int 10' \
'Set delay until repeat'

execute 'defaults write NSGlobalDomain KeyRepeat -float 0.000000000001' \
'Set the key repeat rate to fast'

execute 'defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false' \
'Disable smart quotes'

execute 'defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false' \
'Disable smart dashes'

execute 'defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true &&
  defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144' \
'Use scroll gesture with the Ctrl (^) modifier key to zoom'

# ---------------------------------------------

print_info "Language and Region"

execute 'defaults write NSGlobalDomain AppleLanguages -array "en"' \
'Set language'

execute 'defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"' \
'Set measurement units'

execute 'defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false' \
'Disable auto-correct'

# ---------------------------------------------

print_info "Finder"

execute 'defaults write com.apple.finder ShowRecentTags -bool false' \
'Do not show recent tags'

execute 'defaults write NSGlobalDomain AppleShowAllExtensions -bool true' \
'Show all filename extensions'

execute 'defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"' \
'Use list view in all Finder windows by default'

execute 'defaults write com.apple.finder NewWindowTarget -string "PfDe" &&
  defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"' \
'Set "Desktop" as the default location for new Finder windows'

execute 'defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"' \
'Search the current directory by default'

execute 'defaults write com.apple.finder ShowPathbar -bool true' \
'Show path bar'

execute 'defaults write com.apple.finder ShowStatusBar -bool true' \
'Show status bar'

execute 'defaults write com.apple.finder QLEnableTextSelection -bool true' \
'Allow text selection in Quick Look'

# ---------------------------------------------

print_info "Dock and Dashboard"

execute 'defaults write com.apple.dashboard mcx-disabled -bool true' \
'Disable Dashboard'

execute 'defaults write com.apple.dock expose-group-by-app -bool false' \
'Do not Group windows by application in Mission Control'

execute 'defaults write com.apple.dock show-process-indicators -bool true' \
'Show indicator lights for open applications'

execute 'defaults write com.apple.dock tilesize -int 55' \
'Set Dock icon size'

execute 'defaults write com.apple.dock dashboard-in-overlay -bool true' \
'Do not show Dashboard as space'

# --------------------------------------------- #
# | Safari
# --------------------------------------------- #
print_info "Safari"

execute 'defaults write com.apple.Safari AutoOpenSafeDownloads -bool false' \
'Disable opening "safe" files automatically'

execute 'defaults write com.apple.Safari AutoOpenSafeDownloads -bool false' \
'Disable opening "safe" files automatically'

execute 'defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true &&
  defaults write com.apple.Safari IncludeDevelopMenu -bool true &&
  defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true' \
'Enable the "Develop" menu and the "Web Inspector"'

execute 'defaults write com.apple.Safari HomePage -string "about:blank"' \
'Set home page to "about:blank"'

execute 'defaults write com.apple.Safari IncludeInternalDebugMenu -bool true' \
'Enable "Debug" menu'

execute 'defaults write com.apple.Safari ShowFavoritesBar -bool false' \
'Hide bookmarks bar by default'

execute 'defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true' \
'Show the full URL in the address bar'

execute 'defaults write com.apple.Safari SuppressSearchSuggestions -bool true &&
  defaults write com.apple.Safari UniversalSearchEnabled -bool false' \
'Don’t send search queries to Apple'

execute 'defaults write NSGlobalDomain WebKitDeveloperExtras -bool true' \
'Add a context menu item for showing the "Web Inspector" in web views'

# ---------------------------------------------

print_info "Mac Applications"

execute 'defaults write com.apple.TextEdit PlainTextEncoding -int 4 &&
  defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4' \
'Open and save files as UTF-8 encoded in TextEdit'

execute 'defaults write com.apple.TextEdit RichText -' \
'Use plain text mode for new documents in TextEdit'

execute 'defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true' \
'Prevent Photos from opening automatically when devices are plugged in'

# ---------------------------------------------

print_info "Time Machine"

execute 'defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true' \
'Prevent Time Machine from prompting to use new hard drives as backup volume'
