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
  [[ -n "$CI" ]] && \
    [[ -n "$TRAVIS" ]] && \
    [[ "$(get_os)" == "macos" ]] && \
    return 1

  sudo -v &> /dev/null
  while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
  done &> /dev/null &
}

check_for_sudo() {
  print_info "Checking for sudo permissions"
  ask_for_sudo
  print_result $? "Permission to destroy this machine was granted"
}
