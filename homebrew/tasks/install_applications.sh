#!/usr/bin/env bash

# ---------------------------------------------

print_info "Applications"

declare -r applications=(
  'java'
  'github-desktop'
  'postman'
  'iterm2'
  'gitup'
  'sequel-pro'
  'vimr'
  'visual-studio-code'
  'wireshark'
  'hex-fiend'

  '1password'
  '1password-cli'

  'google-chrome'
  'google-chrome-canary'

  'puush'
  'keepingyouawake'
  'scroll-reverser'
  'spectacle'

  'beardedspice'
  'transmission'
  'slack'
  'spotify'

  # 'adobe-photoshop-cc'
  # 'android-studio'
  # 'intellij-idea'
  # 'firefox-nightly'
  # 'firefox-developeredition'
  # 'opera'
  # 'android-file-transfer'
  # 'vlc'
  # 'keycastr'
  # 'skype'
  # 'firefox'
  # 'google-drive'
)

for app in "${applications[@]}"; do
  brew_install "$app" 'cask'
done

# ---------------------------------------------

print_info "Fonts"

declare -r fonts=(
  'font-hack'
  'font-fira-code'
  'font-source-code-pro'
  'font-ubuntu'
  'font-cousine'
  'font-mononoki'

  'font-open-sans'
  'font-open-sans-condensed'
  'font-open-sans-hebrew'
  'font-open-sans-hebrew-condensed'
)

for font in "${fonts[@]}"; do
  brew_install "$font" 'cask'
done
