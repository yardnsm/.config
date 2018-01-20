#!/usr/bin/env bash

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
