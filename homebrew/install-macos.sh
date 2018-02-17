#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

print_info "Install Homebrew and its taps"
source "./tasks/install_homebrew.sh"

print_info "Updating Homebrew"
source "./tasks/update_homebrew.sh"

print_info "Install Homebrew dependencies"
source "./tasks/install_dependencies.sh"

print_info "Install applications and fonts"
source "./tasks/install_applications.sh"

print_info "Cleaning up"
source "./tasks/cleanup.sh"
