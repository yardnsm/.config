#!/bin/bash

# --------------------------------------------- #
# | Import stuff from _setup
# --------------------------------------------- #
source ./_setup/utils/messages.sh
source ./_setup/utils/ask.sh

# --------------------------------------------- #
# | Check if Xcode CLI is installed
# --------------------------------------------- #
if ! xcode-select --print-path &> /dev/null; then
    print_error "Xcode Command Line tools are not installed!"
    exit 1
fi

# --------------------------------------------- #
# | Show welcome message
# --------------------------------------------- #

# Print welcome message
print_welcome
sleep 1

# --------------------------------------------- #
# | Confirmation before starting
# --------------------------------------------- #

# Print some info
print_info_secondary $'This proccess will setup the dotfiles repository: symlink files, change configurations, etc.'

# Ask if it's okay
ask_for_confirmation "Continue? "

# Check if answer is yes
if answer_is_yes; then

    # Get sudo permissions
    ask_for_sudo

    # Let's begin..
    source ./_setup/execute.sh
fi
