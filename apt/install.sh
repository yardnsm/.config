#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

os::verify "linux" \
  || return 1

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
  output::info "Updating apt"

  commands::execute "sudo apt-get update -qqy" \
    "apt-get (update)"
}

# ---------------------------------------------

apt_install_packages() {
  output::info "Install APT packages"

  for package in "${packages[@]}"; do
    apt::install "$package"
  done
}

# ---------------------------------------------

apt_cleanup() {
  output::info "Cleanup"

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
