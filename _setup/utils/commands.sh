#!/bin/bash

# --------------------------------------- #
# | Commands Utils
# --------------------------------------- #

# Check if a coomand exists
cmd_exists() {
    command -v "$1" &> /dev/null
    return $?
}

# Execute command and print a message
execute() {

    # Execute and show a spinner
    eval "$1" &> /dev/null & show_spinner $! "${2}"

    # Print the result
    print_result $? "${2:-$1}"
}
