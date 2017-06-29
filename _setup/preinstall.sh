#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# ---------------------------------------------

# Check that we're on a Mac
if [[ "$(get_os)" == 'dafuk' ]]; then
  print_error "Don't even try."
  exit 1
fi
print_success "Running on $(get_os)"

# Check if Xcode CLI is installed
if [[ "$(get_os)" == 'macos' ]] && ! xcode-select --print-path &> /dev/null; then
  print_error "Xcode Command Line tools are not installed!"
  exit 1
fi
print_success "Xcode Command Line tools are installed"

# Initializing git modules
[[ $(pwd) == $DOTFILES ]] && git submodule update --recursive --remote
print_result $? "Initializing git modules"
