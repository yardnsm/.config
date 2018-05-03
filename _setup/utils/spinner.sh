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

  local -r PID="$1"                # The process
  local -r MESSAGE="$2"            # The message

  local -r FRAMES="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"     # Frames
  local -r DELAY=0.05              # Delay per frame

  local i
  local current_frame

  i=0

  # As long as the process is running
  while kill -0 "$PID" &> /dev/null; do
    current_frame="${FRAMES:i++%${#FRAMES}:1}"

    print_in_blue "     $current_frame" && printf "  %s" "$MESSAGE"

    # Clear it
    printf "\\r"

    # Wait till next frame
    sleep $DELAY
  done

  # Return the status code
  wait "$PID"
  return $?
}
