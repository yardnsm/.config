#!/bin/bash

# --------------------------------------------- #
# | COLORS
# --------------------------------------------- #
print_in_green() {
    printf "\e[0;32m$1\e[0m"
}

print_in_purple() {
    printf "\e[0;35m$1\e[0m"
}

print_in_cyan() {
    printf "\e[36m$1\e[0m"
}

print_in_red() {
    printf "\e[0;31m$1\e[0m"
}

print_in_yellow() {
    printf "\e[0;33m$1\e[0m"
}

# --------------------------------------------- #
# | MESSAGES
# --------------------------------------------- #
print_error() {
    print_in_red "  [damn it] $1 $2\n"
}

print_info() {
    print_in_purple "\n $1\n\n"
}

print_info_secondary() {
    print_in_cyan "\n $1\n\n"
}

print_question() {
    print_in_yellow "  [?] $1"
}

print_success() {
    print_in_green "  [yay] $1\n"
}

# --------------------------------------------- #
# | MISC
# --------------------------------------------- #

# Print the message based the last exit
print_result() {
    [ $1 -eq 0 ] \
        && print_success "$2" \
        || print_error "$2"

    return $1
}

# Print dotfiles Welcome message
print_welcome() {
    echo "   _____        _    __ _ _            "
    echo "  |  __ \      | |  / _(_) |           "
    echo "  | |  | | ___ | |_| |_ _| | ___  ___  "
    echo "  | |  | |/ _ \| __|  _| | |/ _ \/ __| "
    echo "  | |__| | (_) | |_| | | | |  __/\__ \ "
    echo "  |_____/ \___/ \__|_| |_|_|\___||___/ "
    echo ""

    print_in_yellow "  YardNsm's Dotfiles - Version 1.0"; echo ""
    print_in_purple "  Currently compatible with OSX Only"

    echo ""
    echo $'\n  ---------------------'
}
