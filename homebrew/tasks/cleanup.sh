#!/usr/bin/env bash

# ---------------------------------------------

main() {
  if cmd_exists 'brew'; then
    execute 'brew cleanup' 'brew (cleanup)'
    execute 'brew cask cleanup' 'brew cask (cleanup)'
  fi
}

main "$@"
