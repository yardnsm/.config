#!/usr/bin/env bash

# ---------------------------------------------

# Check if a command exists
cmd_exists() {
  command -v "$1" &> /dev/null
  return $?
}

# Execute a command and print a message (and show a spinner!)
execute() {
  local -r CMD="$1"
  local -r MSG="$2"

  local exit_code=0
  local pid=""

  eval "$CMD" &> /dev/null &
  pid="$!"

  show_spinner $pid "${MSG}"

  wait $pid &> /dev/null
  exit_code=$?

  print_result $exit_code "${MSG:-$CMD}"
  return $exit_code
}
