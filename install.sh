#!/bin/bash

# --------------------------------------------- #
# | Import stuff from _setup
# --------------------------------------------- #
source ./_setup/utils/messages.sh
source ./_setup/utils/ask.sh
source ./_setup/utils/commands.sh
source ./_setup/utils/installs.sh
source ./_setup/utils/spinner.sh
source ./_setup/variables.sh

# --------------------------------------------- #
# | First Check that we're on a Mac
# --------------------------------------------- #
if ! [ "$(uname -s)" == "Darwin" ]; then
    print_error "Sorry brah, these dotfiles are mac-only!"
    exit 1
fi

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

# Print some info
print_info_secondary "This proccess will setup the dotfiles repository: symlink files, change configurations, etc.

  NOTE: This script is installing everything needed. It can override some settings.
  For updating apps/dependencies, fire-up the 'update.sh' script."

# --------------------------------------------- #
# | Confirmation before starting
# --------------------------------------------- #

# Ask if it's okay
ask_for_confirmation "Continue? "

# Check if answer is yes
if answer_is_yes; then

    # Get sudo permissions
    ask_for_sudo

    # Let's begin..
    source ./_setup/execute.sh

else

    # wow. did you just wat?
    print_error "aborted"
    exit 1
fi
