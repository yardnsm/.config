#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

main() {
  source "./tasks/run_configurations.sh"
  source "./tasks/set_applications_settings.sh"
}

main "$@"
