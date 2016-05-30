#!/bin/bash

# --------------------------------------------- #
# | Print in Colors
# --------------------------------------------- #
print_in_green() {
  printf "\e[0;32m$1\e[0m"
}

print_in_blue() {
  printf "\e[0;34m$1\e[0m"
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
# | Messages
# --------------------------------------------- #
print_title() {
  print_in_purple "\n  $(tput bold)$1$(tput sgr0)\n\n"
}

print_info() {
  print_in_purple "\n  $1\n\n"
}

print_info_secondary() {
  print_in_cyan "\n    $1\n\n"
}

print_error() {
  print_in_red "    [damn it] $1 $2\n"
}

print_running() {
  print_in_blue "    [running] $1"
}

print_question() {
  print_in_yellow "    [?] $1"
}

print_status() {
  print_in_yellow "    [!] $1\n"
}

print_success() {
  print_in_green "    [yay] $1\n"
}

# --------------------------------------------- #
# | Misc
# --------------------------------------------- #

# Print the message based the last exit
print_result() {
  [ $1 -eq 0 ] \
    && print_success "$2" \
    || print_error "$2"

  return $1
}

# --------------------------------------------- #
# | Other stuff
# --------------------------------------------- #

# Print a divider
function print_divider() {
  print_title "+---------------------------------------------------------------------------+";
}

# Print dotfiles Welcome message
print_welcome_message() {

  # Print that ascii thing
cat <<'EOF'
   _____        _    __ _ _
  |  __ \      | |  / _(_) |
  | |  | | ___ | |_| |_ _| | ___  ___
  | |  | |/ _ \| __|  _| | |/ _ \/ __|
  | |__| | (_) | |_| | | | |  __/\__ \
  |_____/ \___/ \__|_| |_|_|\___||___/

EOF

  print_in_yellow "  yardnsm's Dotfiles - Version 1.0 \n"
  print_in_purple "  Currently compatible with OSX Only \n\n"
  print_divider

  print_info_secondary "This proccess will setup the dotfiles repository: symlink files, change configurations, etc.

    NOTE: This script is installing everything needed. It can override some settings.
    For updating apps/dependencies, fire-up the 'update.sh' script."
}

# Print finish message
print_finish_message() {
  print_in_cyan "  DONE. Enjoy your new system :)
  Go to '~/dotfiles/_misc/manuals' for manual installs
  Restart your system to see full changes. \n\n"
}
