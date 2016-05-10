#!/bin/bash

# --------------------------------------------- #
# | Source all the stuff
# --------------------------------------------- #
source ./_setup/initializer.sh

# --------------------------------------------- #
# | Preinstall stuff
# --------------------------------------------- #
print_info "Doing some preinstall stuff"
source ./_setup/preinstall.sh
print_divider

# --------------------------------------------- #
# | Show welcome message
# --------------------------------------------- #
print_welcome_message
print_divider

# --------------------------------------------- #
# | Confirmation before starting
# --------------------------------------------- #

# Ask if it's okay
print_info "Just to make sure"
ask_for_confirmation "Continue? "
print_divider

# Check if answer is yes
if answer_is_yes; then

    # Get sudo permissions
    print_title "Checking for sudo permissions"
    ask_for_sudo
    print_result $? "I AM YOUR MASTER"
    print_divider

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
