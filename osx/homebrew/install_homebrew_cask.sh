#!/bin/bash

# --------------------------------------------- #
# | Install Homebrew
# --------------------------------------------- #
if ! cmd_exists 'brew'; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &> /dev/null
fi
print_result $? 'Homebrew'

# --------------------------------------------- #
# | Install Cask
# --------------------------------------------- #
if ! cmd_exists 'brew cask'; then
    brew install caskroom/cask/brew-cask &> /dev/null && brew tap caskroom/cask &> /dev/null
fi
print_result $? 'Cask'
