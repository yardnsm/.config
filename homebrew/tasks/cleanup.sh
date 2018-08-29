#!/usr/bin/env bash

# ---------------------------------------------

main() {

  # Clean some Homebrew stuff
  if cmd_exists 'brew'; then
    execute 'brew cleanup' 'brew (cleanup)'
    execute 'brew cask cleanup' 'brew cask (cleanup)'
  fi
}

main "$@"
