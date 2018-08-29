#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

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
  print_info "Installing Gems"

  for gem in "${gems[@]}"; do
    gem_install "$gem"
  done
}

main "$@"
