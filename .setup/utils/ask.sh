#!/usr/bin/env bash

# ---------------------------------------------

# Check if the last reply was yes
answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}

# Ask a question
ask() {
  print_question "$1"
  read -r
}

# Ask a question for confirmation
ask_for_confirmation() {
  print_question "$1 [y/N] "
  read -r -n 1
  printf "\\n"
}

# Get the last answer
get_answer() {
  printf "%s" "$REPLY"
}

# Ask for sudo permission
ask_for_sudo() {

  # Travis has an issue with `sudo` on mac, so we'll just wont use it for now.
  [[ -n "$CI" ]] && \
    [[ -n "$TRAVIS" ]] && \
    [[ "$(get_os)" == "macos" ]] && \
    return 1

  tput sc              # Save the cursor position
  sudo -v &> /dev/null # Ask for sudo
  tput rc              # Return the saved cursor position
  tput ed              # Clear the screen from the cursor to the bottom

  # Update the sudo timestamp till the script will finish
  while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
  done &> /dev/null &
}

# Check for sudo permissions. Ask for one if not granted before.
check_for_sudo() {
  print_info "Checking for sudo permissions"
  ask_for_sudo
  print_result $? "Permission to destroy this machine was granted"
}
