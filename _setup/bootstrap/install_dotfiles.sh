#!/usr/bin/env bash

# ---------------------------------------------

main() {
  print_title "Installing dotfiles"

  print_status "Bootstraping has finished. Installing dotfiles..."
  sleep 3

  cd "$(dirname "${BASH_SOURCE[0]}")" \
    && source '../../install.sh'
}

main "$@"
