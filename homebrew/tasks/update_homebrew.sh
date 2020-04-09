#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------

main() {

  # Updating Homebrew
  if commands::exists 'brew'; then
    commands::execute "brew update"
  else
    output::status "Homebrew is not installed, can't update"
  fi
}

main "$@"
