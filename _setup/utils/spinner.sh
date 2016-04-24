#!/bin/bash

# --------------------------------------------- #
# | Spinner
# --------------------------------------------- #

# USAGE:
# some_long_task & show_spinner $! "doing some long task"

# Show the spinner
show_spinner() {

    # The process
    local pid=$1

    # The message
    local msg=$2

    # Delay per frame
    local delay=0.05

    # Spinner frames (from: http://github.com/sindresorhus/cli-spinners/)
    local frames="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"

    # As long the process is running
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do

        # Extract the last charcter from the frames
        # and save the rest for later
        local temp=${frames#?}

        # Print the current frame and message (in yellow, taken from 'utils/messages.sh')
        printf "\e[0;34m      [running] %s [%s]\e[0m" "${msg}" "${frames::1}"

        # Update the frames to normal
        local frames=$temp${frames%"$temp"}

        # Wait for the next frame..
        sleep $delay

        # Clear the last line
        echo -en "\r"
    done

    # Done! Clear it.
    tput el
}
