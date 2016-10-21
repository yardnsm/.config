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
brew_install 'hyper' 'cask'
brew_install 'robomongo' 'cask'
#brew_install 'android-studio' 'cask'
#brew_install 'intellij-idea' 'cask' # I have a license lol

# Browsers
brew_install 'google-chrome' 'cask'
brew_install 'google-chrome-canary' 'cask'
brew_install 'firefox' 'cask'
#brew_install 'firefox-nightly' 'cask'
#brew_install 'firefox-developeredition' 'cask'
#brew_install 'opera' 'cask'

# Syncing
brew_install 'google-drive' 'cask'
brew_install 'puush' 'cask'

# Productive
brew_install 'bestres' 'cask'
brew_install 'keepingyouawake' 'cask'
brew_install 'scroll-reverser' 'cask'
brew_install 'keycastr' 'cask'

# Misc
brew_install 'keeweb' 'cask'
brew_install 'skype' 'cask'
brew_install 'beardedspice' 'cask'
brew_install 'caprine' 'cask'
brew_install 'vlc' 'cask'
brew_install 'transmission' 'cask'
brew_install 'mojibar' 'cask'
brew_install 'numi' 'cask'
brew_install 'slack' 'cask'
brew_install 'spotify' 'cask'
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
brew_install 'font-cousine' 'cask'
brew_install 'font-mononoki' 'cask'

# Others
brew_install 'font-open-sans' 'cask'
brew_install 'font-open-sans-condensed' 'cask'
brew_install 'font-open-sans-hebrew' 'cask'
brew_install 'font-open-sans-hebrew-condensed' 'cask'
