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

# Copy smth to clipboard
copy_to_clipboard() {
  if cmd_exists "pbcopy"; then
    pbcopy < "$1"
  elif cmd_exists "xclip"; then
    xclip -selection clip < "$1"
  else
    return 1
  fi
}

# Open smth in browser
open_in_browser() {
  if cmd_exists "xdg-open"; then
    xdg-open "$1"
  elif cmd_exists "open"; then
    open "$1"
  else
    return 1
  fi
}
