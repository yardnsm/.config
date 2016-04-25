#!/bin/bash

# --------------------------------------------- #
# | Source all the stuff
# --------------------------------------------- #
source ./_setup/initializer.sh

# --------------------------------------------- #
# | Preinstall stuff
# --------------------------------------------- #
print_info "Checking up your system"
source ./_setup/preinstall/system_check.sh

print_info "Initializing git modules"
source ./_setup/preinstall/gitmodules.sh

# --------------------------------------------- #
# | Show welcome message
# --------------------------------------------- #
print_welcome_message

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

# --------------------------------------------- #
# | Done!
# --------------------------------------------- #
print_finish_message
