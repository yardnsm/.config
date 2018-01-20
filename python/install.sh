#!/usr/bin/env bash

# ---------------------------------------------

print_info "Installing pips"

declare -r pips=(
  'yapf'
  'flake8'
  'jedi'
  'neovim'
  'pypcap'

  'virtualenv'
  'pew'
  'pipenv'

  'scapy'
  'pyx'
)

for pip in "${pips[@]}"; do
  pip_install "$pip"
done
