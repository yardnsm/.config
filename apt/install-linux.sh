#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

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

# ---------------------------------------------

apt_update() {
  print_info "Updating apt"

  commands::execute "sudo apt-get update -qqy" \
    "apt-get (update)"
}

# ---------------------------------------------

apt_install_packages() {
  print_info "Install APT packages"

  for package in "${packages[@]}"; do
    apt::install "$package"
  done
}

# ---------------------------------------------

apt_cleanup() {
  print_info "Cleanup"

  commands::execute "sudo apt-get autoremove -qqy" \
    "apt-get (autoremove)"
}

# ---------------------------------------------

main() {
  apt_update
  apt_install_packages
  apt_cleanup
}

main "$@"
