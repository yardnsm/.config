#!/bin/bash

# Check if a coomand exists
cmd_exists() {
    command -v "$1" &> /dev/null
    return $?
}

# Execute command and print a message
execute() {
    eval "$1" &> /dev/null
    print_result $? "${2:-$1}"
}
