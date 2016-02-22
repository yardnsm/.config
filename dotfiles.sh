#!/bin/bash

# --------------------------------------------- #
# | IMPOTING STUFF FROM _setup
# --------------------------------------------- #
source _setup/utils/messages.sh
source _setup/utils/ask.sh

# --------------------------------------------- #
# | CHECK IF XCODE CLI TOOLS ARE INSTALLED
# --------------------------------------------- #
if ! xcode-select --print-path &> /dev/null; then
    print_error "Xcode Command Line tools are not installed!"
    exit 1
fi

# --------------------------------------------- #
# | SHOW WELCOME INFO
# --------------------------------------------- #

# Print welcome message
print_welcome

# --------------------------------------------- #
# | CONFIRMATION
# --------------------------------------------- #

# Print some info
print_info_secondary $'This proccess will setup the following:
  * Setup shell configurations
  * Setup git configurations
  * Setup Atom configurations
  * Setup OSX configurations
  * Install Homebrew and Cask
  * Install Homebrew dependencies
  * Install Applications
  * Set applications settings'

# Ask if it's okay
ask_for_confirmation "Continue? "

# Check if answer is yes
if answer_is_yes; then

    # Get sudo permissions
    ask_for_sudo

    # Show text
    print_info "Executing..."

    # Let's begin..
    ./_setup/execute.sh
fi
