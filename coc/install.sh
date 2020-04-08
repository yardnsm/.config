#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

main() {
  commands::execute \
    "npm install $ext --global-style --no-bin-links  --no-package-lock --only=prod" \
    "Installing all coc extensions"
}

main "$@"
