#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

print_info "Installing Gems"

declare -r gems=(
  'bundler'
  'sass'
  'compass'
  'haml'
  'teamocil'
)

for gem in "${gems[@]}"; do
  gem_install "$gem"
done
