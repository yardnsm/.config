#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# ---------------------------------------------

source $current_dir/_setup/initializer.sh

# ---------------------------------------------

print_welcome_message

# ---------------------------------------------

print_title "Getting ready"

# Run preinstall script
print_info "Make sure everything alright"
source $DOTFILES/_setup/preinstall.sh

# Ask if it's okay
print_info "Just to make sure"
ask_for_confirmation "Continue? "
print_divider

# Check if answer is yes
if answer_is_yes; then
  check_for_sudo
  source $DOTFILES/_setup/execute.sh
else
  print_error "aborted"
  exit 1
fi

# ---------------------------------------------

print_finish_message
