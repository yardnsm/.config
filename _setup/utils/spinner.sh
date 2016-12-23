#!/usr/bin/env bash

# --------------------------------------------- #
# | Spinner
# --------------------------------------------- #

# USAGE:
# some_long_task & show_spinner $! "doing some long task"

# Show the spinner
show_spinner() {

  local pid=$1       # The process
  local msg=$2       # The message

  local delay=0.05   # Delay per frame
  local maxDots=3    # How many dots to show

  local dot="."      # a dot.
  local count=0      # counter

  print_running "${msg}"

  # As long as the process is running
  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    print_in_blue "$dot"
    [[ $((count++)) -eq maxDots ]] && printf "\b\b\b\b    \b\b\b\b" && count=0
    sleep $delay
  done

  # Done! Clear it.
  echo -en "\r"
  tput el

  # Return the status code
  wait $pid
  return $?
}
