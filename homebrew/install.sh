#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# --------------------------------------------------------------------------------------------------

os::verify "macos" \
  || return 1

# --------------------------------------------------------------------------------------------------

main() {
  output::info "Install Homebrew"
  source "./tasks/install_homebrew.sh"

  output::info "Install Taps"
  source "./tasks/install_taps.sh"

  output::info "Updating Homebrew"
  source "./tasks/update_homebrew.sh"

  output::info "Install Homebrew dependencies"
  source "./tasks/install_dependencies.sh"

  # Title printing is in that script
  source "./tasks/install_applications.sh"

  output::info "Cleaning up"
  source "./tasks/cleanup.sh"
}

main "$@"
