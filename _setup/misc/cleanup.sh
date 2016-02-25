#!/bin/bash

# --------------------------------------------- #
# | Cleans some homebrew data
# --------------------------------------------- #
if cmd_exists 'brew'; then
    execute 'brew cleanup' 'brew (cleanup)'
    execute 'brew cask cleanup' 'brew cask (cleanup)'
fi
