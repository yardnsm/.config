#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

declare -r pips=(
  'yapf'
  'flake8'
  'jedi'
  'neovim'
  'pypcap'
  'python-language-server[all]'

  'virtualenv'
  'pipenv'

  'scapy'
  'pyx'
)

# ---------------------------------------------

main() {
  output::info "Installing pips"

  for pip in "${pips[@]}"; do
    pip::install "$pip"
  done
}

main "$@"
