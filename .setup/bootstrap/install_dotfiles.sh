#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../initializer.sh"

# ---------------------------------------------

main() {
  print_title "Installing dotfiles"

  print_status "Bootstraping has finished. Installing dotfiles..."
  sleep 3

  source '../../install.sh'
}

main "$@"
