#!/usr/bin/env bash

# ---------------------------------------------

# Spinner for long tasks
#
# USAGE:
#
#    some_long_task & \
#      spinner:show_for_process $! "doing some long task"
#

spinner:show_for_process() {

  local -r PID="$1"                # The process
  local -r MESSAGE="$2"            # The message

  local -r FRAMES="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"     # Frames
  local -r DELAY=0.05              # Delay per frame

  local i
  local current_frame

  i=0

  # We're inside CI? Don't bloat the output!
  if ! os::is_ci; then

    # As long as the process is running
    while kill -0 "$PID" &> /dev/null; do
      current_frame="${FRAMES:i++%${#FRAMES}:1}"

      output::blue "     $current_frame" && printf "  %s" "$MESSAGE"

      # Clear it
      printf "\\r"

      # Wait till next frame
      sleep $DELAY
    done
  fi

  # Return the status code
  wait "$PID"
  return $?
}
