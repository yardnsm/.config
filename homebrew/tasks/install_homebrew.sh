#!/usr/bin/env bash

# ---------------------------------------------

main() {

  # Install Homebrew
  if ! commands::exists 'brew'; then
    printf "\\n" \
      | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
      &> /dev/null
  fi

  output::result $? 'homebrew'

  # Tap stuff
  if commands::exists 'brew'; then
    brew::tap "caskroom/cask"
    brew::tap "caskroom/versions"
    brew::tap "caskroom/fonts"
    brew::tap "ravenac95/sudolikeaboss"
  else
    output::error "Homebrew is not installed!"
  fi
}

main "$@"
