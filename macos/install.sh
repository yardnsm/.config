#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

os::verify "macos" \
  || return 1

# ---------------------------------------------

main() {
  source "./tasks/run_configurations.sh"
  source "./tasks/set_applications_settings.sh"
}

main "$@"
