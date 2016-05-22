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
    execute "brew install caskroom/cask/brew-cask && brew install caskroom/cask" "cask"
    execute "brew install caskroom/versions" "cask-fonts"
    execute "brew install caskroom/fonts" "cask-versions"
else
    print_success "cask"
fi

# --------------------------------------------- #
# | Other taps
# --------------------------------------------- #
if cmd_exists 'brew'; then
    execute "brew tap beeftornado/rmtree && brew install beeftornado/rmtree/brew-rmtree" "rmtree"
fi
