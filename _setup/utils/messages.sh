#!/usr/bin/env bash

# ---------------------------------------------

# Print in colors

print_in_green() {
  printf "\\e[0;32m%b\\e[0m" "$1"
}

print_in_blue() {
  printf "\\e[0;34m%b\\e[0m" "$1"
}

print_in_purple() {
  printf "\\e[0;35m%b\\e[0m" "$1"
}

print_in_cyan() {
  printf "\\e[36m%b\\e[0m" "$1"
}

print_in_red() {
  printf "\\e[0;31m%b\\e[0m" "$1"
}

print_in_yellow() {
  printf "\\e[0;33m%b\\e[0m" "$1"
}

print_in_darkgrey() {
  printf "\\e[0;90m%b\\e[0m" "$1"
}

print_in_white() {
  printf "\\e[1;37m%b\\e[0m" "$1"
}

# ---------------------------------------------

# Mesages

print_title() {
  print_in_white "\\n$(tput bold) -  $1$(tput sgr0)\\n"
}

print_info() {
  print_in_cyan "\\n     $1\\n\\n"
}

print_error() {
  # shellcheck disable=SC2059
  print_in_red "     ✘" && printf "  $1\\n"
}

print_question() {
  # shellcheck disable=SC2059
  print_in_yellow "     ?" && printf "  $1"
}

print_status() {
  # shellcheck disable=SC2059
  print_in_yellow "     ℹ" && printf "  $1\\n"
}

print_success() {
  # shellcheck disable=SC2059
  print_in_green "     ✔︎" && printf "  $1\\n"
}

# ---------------------------------------------

# Print the message based the last exit
print_result() {
  [ "$1" -eq 0 ] \
    && print_success "$2" \
    || print_error "$2"

  return "$1"
}

# Print a divider (newline)
function print_divider() {
  printf "\\n"
}

# Print welcome message
print_welcome_message() {

  tput cl

  # shellcheck disable=SC1117
  print_in_blue "
          __        __   ____ __ __
     ____/ /____   / /_ / __//_// /___   _____
    / __  // __ \ / __// /_ / // // _ \ / ___/
   / /_/ // /_/ // /_ / __// // //  __//__  /
   \__,_/ \____/ \__//_/  /_//_/ \___//____/

"

  print_in_blue "  Base Dir: "; printf "%s\\n" "$DOTFILES"
  print_in_cyan "  $(tput bold)Note:$(tput sgr0) Mostly compatible with macOS \\n"

  printf "\\n"
}

# Print finish message
print_finish_message() {
  print_info " Setup is done! You might need to restart your system to see full changes."
}
