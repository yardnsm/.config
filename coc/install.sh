#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

main() {
  cd extensions \
    || return 1

  output::info "Installing extensions"

  commands::execute \
    "npm install --global-style --no-bin-links  --no-package-lock --only=prod" \
    "Installing all coc extensions"
}

main "$@"
