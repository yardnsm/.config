#!/bin/bash

# --------------------------------------------- #
# | Spinner
# --------------------------------------------- #

# Show the spinner
show_spinner() {

    # The process
    local pid=$1

    # The message
    local msg=$2

    # Delay per frame
    local delay=0.1

    # Spinner frames
    local frames="⠄⠆⠇⠋⠙⠸⠰⠠⠰⠸⠙⠋⠇⠆"

    # As long the process is running
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do

        # Extract the last charcter from the frames
        # and save the rest for later
        local temp=${frames#?}

        # Print the current frame and message
        printf "\e[0;33m    [running] %s [%s]\e[0m" "${msg}" "${frames::1}"

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
