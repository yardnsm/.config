#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# ---------------------------------------------

print_info "Install Homebrew and its taps"
source $current_dir/tasks/install_homebrew.sh

print_info "Updating Homebrew"
source $current_dir/tasks/update_homebrew.sh

print_info "Install Homebrew dependencies"
source $current_dir/tasks/install_dependencies.sh

print_info "Install applications and fonts"
source $current_dir/tasks/install_applications.sh

print_info "Cleaning up"
source $current_dir/tasks/cleanup.sh
