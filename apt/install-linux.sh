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

_apt_update() {
  print_info "Updating apt"

  execute "sudo apt-get update -qqy" \
    "apt-get (update)"
}

# ---------------------------------------------

_apt_install_packages() {
  print_info "Install APT packages"

  for package in "${packages[@]}"; do
    apt_install "$package"
  done
}

# ---------------------------------------------

_apt_cleanup() {
  print_info "Cleanup"

  execute "sudo apt-get autoremove -qqy" \
    "apt-get (autoremove)"
}

# ---------------------------------------------

main() {
  _apt_update
  _apt_install_packages
  _apt_cleanup
}

main "$@"
