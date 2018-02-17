#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

print_info "Installing NPM global dependencies"

declare -r dependencies=(
  'bower'
  'http-server'
  'gulp'
  'nodemon'
  'json-server'
  'yo'
  'npm-upgrade'
  'trymodule'
  'np'
  'firebase-tools'
  'tern'
  'tern-jsx'
  'ava'
  'hicat'
  'javascript-typescript-langserver'
  'typescript'

  'speed-test'
  'fast-cli'
  'emoj'
)

for dep in "${dependencies[@]}"; do
  yarn_install "$dep"
done
