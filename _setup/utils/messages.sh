#!/usr/bin/env bash

# ---------------------------------------------

# Print in colors

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

print_in_darkgrey() {
  printf "\e[0;90m$1\e[0m"
}

print_in_white() {
  printf "\e[1;37m$1\e[0m"
}

# ---------------------------------------------

# Mesages

print_title() {
  print_in_white "\n $(tput bold; tput smul)$1$(tput sgr0)\n"
}

print_info() {
  print_in_cyan "\n  $1\n"
}

print_error() {
  print_in_red "   [✘] $1\n"
}

print_running() {
  print_in_blue "   [.] $1"
}

print_question() {
  print_in_yellow "   [?] $1"
}

print_status() {
  print_in_yellow "   [!] $1\n"
}

print_success() {
  print_in_green "   [✓︎] $1\n"
}

# ---------------------------------------------


# Print the message based the last exit
print_result() {
  [ $1 -eq 0 ] \
    && print_success "$2" \
    || print_error "$2"

  return $1
}

# Print a divider (newline)
function print_divider() {
  printf "\n"
}

# Print welcome message
print_welcome_message() {

  clear

  print_in_blue "
          __        __   ____ __ __
     ____/ /____   / /_ / __//_// /___   _____
    / __  // __ \ / __// /_ / // // _ \ / ___/
   / /_/ // /_/ // /_ / __// // //  __//__  /
   \__,_/ \____/ \__//_/  /_//_/ \___//____/

"

  print_in_blue "  Base Dir: "; printf "$DOTFILES\n\n"

  print_in_cyan "\n  $(tput bold)Note:$(tput sgr0) Currently compatible with macOS Only \n"
}

# Print finish message
print_finish_message() {
  print_info " Setup is done! You might neet to restart your system to see full changes"
}
