#!/usr/bin/env bash

# ---------------------------------------------

main() {

  # Updating Homebrew
  if cmd_exists 'brew'; then
    execute "brew update"
  else
    print_status "Homebrew is not installed, can't update"
  fi
}

main "$@"
