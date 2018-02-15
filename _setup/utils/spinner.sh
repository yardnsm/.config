#!/usr/bin/env bash

# ---------------------------------------------

# Spinner for long tasks
#
# USAGE:
#
#    some_long_task & \
#      show_spinner $! "doing some long task"
#

show_spinner() {

  local -r PID="$1"       # The process
  local -r MSG="$2"       # The message

  local -r FRAMES="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"    # Frames
  local -r DELAY=0.05   # Delay per frame

  local i=0
  local curr_frame=""

  # As long as the process is running
  while [[ "$(ps a | awk '{print $1}' | grep "$PID")" ]]; do
    curr_frame="${FRAMES:i++%${#FRAMES}:1}"

    print_in_blue "     $curr_frame  $MSG"

    # Clear it
    printf "\r"

    # Wait till next frame
    sleep $DELAY
  done

  # Return the status code
  wait "$PID"
  return $?
}
