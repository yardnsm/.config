#!/usr/bin/env bash

# --------------------------------------------- #
# | Questions
# --------------------------------------------- #

# Check if the last reply is yes
answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
}

# Ask a question
ask() {
  print_question "$1"
  read
}

# Ask a question for confirmation
ask_for_confirmation() {
  print_question "$1 [y/N] "
  read -n 1
  printf "\n"
}

# Get the last answer
get_answer() {
  printf "$REPLY"
}

# --------------------------------------------- #
# | Permissions
# --------------------------------------------- #

# Ask for sudo permission
ask_for_sudo() {

  # Ask for the administrator password
  sudo -v &> /dev/null

  # Update existing `sudo` time stamp until this script has finished
  # https://gist.github.com/cowboy/3118588
  while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
  done &> /dev/null &

}
