#!/usr/bin/env bash

# ---------------------------------------------

# Check if a command exists
commands::exists() {
  command -v "$1" &> /dev/null
  return $?
}

# Execute a command and print a message (and show a spinner!)
commands::execute() {
  local -r CMD="$1"
  local -r MSG="$2"

  local exit_code=0
  local pid=""

  eval "$CMD" &> /dev/null &
  pid="$!"

  spinner:show_for_process $pid "${MSG}"

  wait $pid &> /dev/null
  exit_code=$?

  output::result $exit_code "${MSG:-$CMD}"
  return $exit_code
}
