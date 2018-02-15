#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source '../initializer.sh'

# ---------------------------------------------

main() {
  cd "$DOTFILES_HOME" \
    || exit 1

  print_divider

  print_status "Bootstraping has finished. Installing dotfiles..."
  sleep 3

  source '../../install.sh'
}

main "$@"
