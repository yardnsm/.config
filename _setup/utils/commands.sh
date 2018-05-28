#!/usr/bin/env bash

# ---------------------------------------------

# Check if a command exists
cmd_exists() {
  command -v "$1" &> /dev/null
  return $?
}

# Execute a command and print a message
execute() {
  local -r CMD="$1"
  local -r MSG="$2"

  local exit_code=0
  local pid=""

  eval "$CMD" &> /dev/null &
  pid=$!

  show_spinner $pid "${MSG}"

  wait $pid &> /dev/null
  exit_code=$?

  print_result $exit_code "${MSG:-$CMD}"
  return $exit_code
}

# Copy smth to clipboard
copy_to_clipboard() {
  if cmd_exists "pbcopy"; then
    echo "$1" | pbcopy
  elif cmd_exists "xclip"; then
    echo "$1" | xclip -selection clip
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
