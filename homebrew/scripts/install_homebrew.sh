#!/bin/bash

# --------------------------------------------- #
# | Install Homebrew
# --------------------------------------------- #
if ! cmd_exists 'brew'; then
  printf "\n" | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
fi
print_result $? 'homebrew'

# --------------------------------------------- #
# | Tapping Cask
# --------------------------------------------- #
if cmd_exists 'brew'; then
  execute "brew tap caskroom/cask" "cask"
  execute "brew tap caskroom/versions" "cask-fonts"
  execute "brew tap caskroom/fonts" "cask-versions"
else
  print_error "homebrew is not installed!"
fi

# --------------------------------------------- #
# | Other taps
# --------------------------------------------- #
if cmd_exists 'brew'; then
  execute "brew tap beeftornado/rmtree && brew install beeftornado/rmtree/brew-rmtree" "rmtree"
fi
