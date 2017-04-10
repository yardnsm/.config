#!/usr/bin/env bash

# ---------------------------------------------

# Check if a command exists
cmd_exists() {
  command -v "$1" &> /dev/null
  return $?
}

# Execute a command and print a message
execute() {
  eval "$1" &> /dev/null & show_spinner $! "${2}"
  print_result $? "${2:-$1}"
}
