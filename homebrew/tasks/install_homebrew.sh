#!/usr/bin/env bash

# Install Homebrew
if ! cmd_exists 'brew'; then
  printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
fi
print_result $? 'homebrew'

# Tap stuff
if cmd_exists 'brew'; then
  execute "brew tap caskroom/cask" "cask"
  execute "brew tap caskroom/versions" "cask-versions"
  execute "brew tap caskroom/fonts" "cask-fonts"
else
  print_error "homebrew is not installed!"
fi
