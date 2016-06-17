#!/usr/bin/env bash

# --------------------------------------------- #
# | Check that we're on a Mac
# --------------------------------------------- #
if ! [ "$(uname -s)" == "Darwin" ]; then
  print_error "Sorry brah, these dotfiles are mac-only!"
  exit 1
fi
print_success "Running on OSX"

# --------------------------------------------- #
# | Check if Xcode CLI is installed
# --------------------------------------------- #
if ! xcode-select --print-path &> /dev/null; then
  print_error "Xcode Command Line tools are not installed!"
  exit 1
fi
print_success "Xcode Command Line tools are installed"


# --------------------------------------------- #
# | Initializing git modules
# --------------------------------------------- #
git submodule update --init --recursive
print_result $? "Initializing git modules"
