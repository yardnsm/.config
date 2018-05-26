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
  'typescript'

  'javascript-typescript-langserver'
  'vscode-css-languageserver-bin'
  'typescript-language-server'
  'vscode-html-languageserver-bin'
  'vscode-json-languageserver-bin'

  'speed-test'
  'fast-cli'
  'emoj'
)

for dep in "${dependencies[@]}"; do
  npm_install "$dep"
done
