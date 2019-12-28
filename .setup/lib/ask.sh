#!/usr/bin/env bash

# ---------------------------------------------

# Check if the last reply was yes
ask::answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}

# Ask a question
ask::prompt() {
  output::question "$1"
  read -r
}

# Ask a question for confirmation
ask::prompt_confirmation() {
  output::question "$1 [y/N] "
  read -r -n 1
  printf "\\n"
}

# Get the last answer
ask::get_answer() {
  printf "%s" "$REPLY"
}

# Ask for sudo permission
ask::prompt_sudo() {

  # Travis has an issue with `sudo` on mac, so we'll just wont use it for now.
  if os::is_ci; then
    return 1
  fi

  sudo -v &> /dev/null

  # Update the sudo timestamp till the script will finish
  while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
  done &> /dev/null &
}

# Check for sudo permissions. Ask for one if not granted before.
ask::check_sudo() {
  output::info "Checking for sudo permissions"
  ask::prompt_sudo
  output::result $? "Permission to destroy this machine was granted"
}
