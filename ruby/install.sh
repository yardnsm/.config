#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

declare -r gems=(
  'bundler'
  'sass'
  'compass'
  'haml'
  'teamocil'
)

# ---------------------------------------------

main() {
  output::info "Installing Gems"

  for gem in "${gems[@]}"; do
    gem::install "$gem"
  done
}

main "$@"
