#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# --------------------------------------------------------------------------------------------------

os::verify "linux" \
  || return 1

# --------------------------------------------------------------------------------------------------

declare -r packages=(
  'sudo'
  'git'
  'make'
  'curl'
  'tmux'
  'zsh'
  'ruby-full'
  'rbenv'
  'python3.6'
  'neovim'
  'python3-neovim'
  'nodejs'
  'npm'
)

# --------------------------------------------------------------------------------------------------

apt_update() {
  commands::execute "sudo apt-get update -qqy" \
    "apt-get (update)"
}

apt_install_packages() {
  for package in "${packages[@]}"; do
    apt::install "$package"
  done
}

apt_cleanup() {
  commands::execute "sudo apt-get autoremove -qqy" \
    "apt-get (autoremove)"
}

# --------------------------------------------------------------------------------------------------

main() {
  output::info "Updating apt"
  apt_update

  output::info "Install APT packages"
  apt_install_packages

  output::info "Cleanup"
  apt_cleanup
}

main "$@"
