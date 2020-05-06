#!/usr/bin/env bash

# ---------------------------------------------

declare -r applications=(
  'iterm2'
  'sequel-pro'
  'wireshark'
  'hex-fiend'

  'android-studio'
  'visual-studio-code'


  '1password'
  '1password-cli'

  'java'
  'virtualbox'
  'android-platform-tools'

  'google-chrome'
  'google-chrome-canary'
  'firefox-developeredition'

  'kap'
  'keybase'
  'caption'
  'puush'
  'gifski'
  'keepingyouawake'
  'scroll-reverser'
  'spectacle'
  'beardedspice'
  'transmission'
  'slack'
  'spotify'
  'vlc'
  'discord'
  'tunnelblick'

  'syncthing'
  'google-backup-and-sync'

  # ------------------------------------------------------------------------------------------------
  # Retired
  # ------------------------------------------------------------------------------------------------

  # 'adobe-photoshop-cc'
  # 'intellij-idea'
  # 'firefox-nightly'
  # 'opera'
  # 'android-file-transfer'
  # 'keycastr'
  # 'skype'
  # 'firefox'
  # 'vimr'
  # 'gitup'
  # 'github-desktop'
  # 'postman'
  # 'atom'
  # 'meld'
  # 'zeplin'
)

declare -r fonts=(
  'font-hack'
  'font-fira-code'
  'font-source-code-pro'
  'font-ubuntu'
  'font-cousine'
  'font-mononoki'
  'font-iosevka'

  'font-open-sans'
  'font-open-sans-condensed'
  'font-open-sans-hebrew'
  'font-open-sans-hebrew-condensed'
)

# --------------------------------------------------------------------------------------------------

main() {
  output::info "Install applications"

  for app in "${applications[@]}"; do
    brew::install "$app" 'cask'
  done

  output::info "Install fonts"

  for font in "${fonts[@]}"; do
    brew::install "$font" 'cask'
  done
}

main "$@"
