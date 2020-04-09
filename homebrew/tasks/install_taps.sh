#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------

main() {

  # Tap stuff
  if commands::exists 'brew'; then
    brew::tap "homebrew/cask-versions"
    brew::tap "homebrew/cask-fonts"
    brew::tap "ravenac95/sudolikeaboss"
  else
    output::error "Homebrew is not installed!"
  fi
}

main "$@"
