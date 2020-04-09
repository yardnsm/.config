#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------

main() {
  if commands::exists 'brew'; then
    commands::execute 'brew cleanup' 'brew (cleanup)'
    commands::execute 'brew cask cleanup' 'brew cask (cleanup)'
  fi
}

main "$@"
