#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

print_info "Installing antibody"

if ! cmd_exists 'antibody'; then
  execute "curl -s https://raw.githubusercontent.com/getantibody/installer/master/install | bash -s" \
    "Installing antibody"
else
  print_success 'antibody'
fi
