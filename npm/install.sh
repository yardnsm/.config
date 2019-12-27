#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

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
  'bs-platform'

  'javascript-typescript-langserver'
  'vscode-css-languageserver-bin'
  'typescript-language-server'
  'vscode-html-languageserver-bin'
  'bash-language-server'
  'stylable-intelligence'

  'speed-test'
  'fast-cli'
  'emoj'

  'stylelint-config-standard'
)

# ---------------------------------------------

main() {
  output::info "Installing NPM global dependencies"

  for dep in "${dependencies[@]}"; do
    npm::install "$dep"
  done
}

main "$@"
