#!/bin/bash

# --------------------------------------------- #
# | IMPOTING STUFF FROM _setup
# --------------------------------------------- #
source _setup/utils/messages.sh
source _setup/utils/ask.sh

# --------------------------------------------- #
# | SHOW WELCOME INFO
# --------------------------------------------- #

# Some info message
print_info $'Hey! This will install the WHOLE Dotfiles configurations. \n Fire up \'dotfiles-menu\' to select what to install.'

# Wait for 2 sec. (cool)
sleep 2

# Print welcome message
print_welcome

# --------------------------------------------- #
# | CONFIRMATION
# --------------------------------------------- #

# Show divider
print_divider

# Print some info
print_info_secondary $'This proccess will setup the following:
  1) Setup shell configurations (symlink)
  2) Setup git configurations (symlink)
  3) Add \'bin\' folder to PATH
  4) Setup Atom configurations (symlink)
  5) Setup OSX configurations
  6) Install Homebrew and dependencies
  7) Install Brew-Cask, Applications and their settings'

# Ask if it's okay
ask_for_confirmation "Continue? "

if answer_is_yes; then

    # Get sudo permissions
    ask_for_sudo

    # Show text
    print_info "Executing..."

    # Let's begin..
    ./_setup/execute.sh
fi
