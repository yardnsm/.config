#!/bin/bash

# --------------------------------------------- #
# | Updating Homebrew
# --------------------------------------------- #
if cmd_exists 'brew'; then
    execute "brew update" "brew update"
    execute "brew cask update" "brew cask update"
else
    print_status "Homebrew is not installed, no need to update"
fi
