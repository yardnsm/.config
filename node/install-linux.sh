#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# ---------------------------------------------

print_info "Installing node"

if ! cmd_exists 'node'; then
  execute "curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -" \
    "Installing node"

  echo ""
  print_status "Installing from apt-get \n"

  apt_install "nodejs"
else
  print_success 'Already installed!'
fi
