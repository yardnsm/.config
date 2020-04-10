#!/usr/bin/env bash

# ---------------------------------------------

output::green() {
  printf "\\e[0;32m%b\\e[0m" "$1"
}

output::blue() {
  printf "\\e[0;34m%b\\e[0m" "$1"
}

output::purple() {
  printf "\\e[0;35m%b\\e[0m" "$1"
}

output::cyan() {
  printf "\\e[36m%b\\e[0m" "$1"
}

output::red() {
  printf "\\e[0;31m%b\\e[0m" "$1"
}

output::yellow() {
  printf "\\e[0;33m%b\\e[0m" "$1"
}

output::darkgrey() {
  printf "\\e[0;90m%b\\e[0m" "$1"
}

output::white() {
  printf "\\e[1;37m%b\\e[0m" "$1"
}

# ---------------------------------------------

output::title() {
  output::white "\\n$(tput bold)  -  $1$(tput sgr0)\\n"
}

output::info() {
  output::cyan "\\n     $1\\n\\n"
}

output::error() {
  # shellcheck disable=SC2059
  output::red "     ✘" && printf "  $1\\n"
}

output::question() {
  # shellcheck disable=SC2059
  output::yellow "     ?" && printf "  $1"
}

output::status() {
  # shellcheck disable=SC2059
  output::yellow "     ℹ" && printf "  $1\\n"
}

output::success() {
  # shellcheck disable=SC2059
  output::green "     ●" && printf "  $1\\n"
}

# ---------------------------------------------

# Print the message based the last exit
output::result() {
  [[ "$1" -eq 0 ]] \
    && output::success "$2" \
    || output::error "$2"

  return "$1"
}

# Print a divider (newline)
output::divider() {
  printf "\\n"
}

# Print welcome message
output::welcome_message() {

  tput cl

  # shellcheck disable=SC1117
  output::blue "
          __        __   ____ __ __
     ____/ /____   / /_ / __//_// /___   _____
    / __  // __ \ / __// /_ / // // _ \ / ___/
   / /_/ // /_/ // /_ / __// // //  __//__  /
   \__,_/ \____/ \__//_/  /_//_/ \___//____/

     https://github.com/yardnsm/dotfiles/

"

  output::cyan "     $(tput bold)Base dir:$(tput sgr0) \\t ~${DOTFILES#$HOME} \\n"
}
