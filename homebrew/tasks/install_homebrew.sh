#!/usr/bin/env bash

# Install Homebrew
if ! cmd_exists 'brew'; then
  printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
fi
print_result $? 'homebrew'

# Tap stuff
if cmd_exists 'brew'; then
  brew_tap "caskroom/cask"
  brew_tap "caskroom/versions"
  brew_tap "caskroom/fonts"
  brew_tap "ravenac95/sudolikeaboss"
else
  print_error "homebrew is not installed!"
fi
