#!/usr/bin/env bash

# --------------------------------------------- #
# | Source all the stuff
# --------------------------------------------- #
source ./_setup/initializer.sh

# --------------------------------------------- #
# | Warn if needed
# --------------------------------------------- #
if cmd_exists 'dotfiles'; then
  print_title "Warning!"
  print_status "It looks like you have already executed this script. If you
        re-run this script, some actions you did may be
        overriden. Use the 'dotfiles' command instead.
"

  if ! [[ $1 = '-f' ]]; then
    print_status "To force the execution of this script, use the '-f' flag."
    exit 1
  else
    print_status "Used forced install. Continue in 3 seconds..."
    sleep 3
    print_divider
  fi
fi

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
