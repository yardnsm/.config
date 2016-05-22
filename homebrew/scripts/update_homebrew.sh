#!/bin/bash

# --------------------------------------------- #
# | Updating Homebrew
# --------------------------------------------- #
if cmd_exists 'brew'; then
    execute "brew update" "brew update"
    execute "brew cask update" "brew cask update"
fi
