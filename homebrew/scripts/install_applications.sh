#!/usr/bin/env bash

# --------------------------------------------- #
# | Install applications
# --------------------------------------------- #
print_info_secondary "Applications"

# Dev stuff
brew_install 'android-file-transfer' 'cask'
brew_install 'atom' 'cask'
brew_install 'java' 'cask'
brew_install 'github-desktop' 'cask'
brew_install 'postman' 'cask'
brew_install 'iterm2' 'cask'
brew_install 'robomongo' 'cask'
#brew_install 'android-studio' 'cask'
#brew_install 'intellij-idea' 'cask' # I have a license lol

# Browsers
brew_install 'google-chrome' 'cask'
brew_install 'google-chrome-canary' 'cask'

# Syncing
brew_install 'google-drive' 'cask'
brew_install 'puush' 'cask'

# Productive
brew_install 'bestres' 'cask'
brew_install 'keepingyouawake' 'cask'
brew_install 'scroll-reverser' 'cask'
brew_install 'keycastr' 'cask'

# Misc
brew_install 'skype' 'cask'
brew_install 'cumulus' 'cask'
brew_install 'caprine' 'cask'
brew_install 'vlc' 'cask'
brew_install 'drop-to-gif' 'cask'
brew_install 'transmission' 'cask'
brew_install 'mojibar' 'cask'
#brew_install 'adobe-photoshop-cc' 'cask'


# --------------------------------------------- #
# | Install fonts
# --------------------------------------------- #
print_info_secondary "Fonts"

# Dev fonts
brew_install 'font-hack' 'cask'
brew_install 'font-fira-code' 'cask'
brew_install 'font-source-code-pro' 'cask'
brew_install 'font-ubuntu' 'cask'

# Others
brew_install 'font-open-sans' 'cask'
brew_install 'font-open-sans-condensed' 'cask'
brew_install 'font-open-sans-hebrew' 'cask'
brew_install 'font-open-sans-hebrew-condensed' 'cask'

#########
# FROM OTHER SOURCES:
################
# 1) sip
# 2) Popcorn Time
# 3) CleanMyMac
# 4) Parallels Desktop
# 5) Transmit
# 6) iStat Mini
# 7) Paragon NTFS
# 8) Alfred
