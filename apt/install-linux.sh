#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

print_info "Updating apt"

execute "sudo apt-get update -qqy" "apt-get (update)"

# ---------------------------------------------

print_info "Install APT packages"

declare -r packages=(
  'sudo'
  'git'
  'make'
  'curl'
  'tmux'
  'zsh'
  'ruby-full'
  'rbenv'
)

for package in "${packages[@]}"; do
  apt_install "$package"
done


# ---------------------------------------------

print_info "Cleanup"

execute "sudo apt-get autoremove -qqy" "apt-get (autoremove)"
