#!/usr/bin/env bash

# ---------------------------------------------

main() {

  # Install Homebrew
  if ! cmd_exists 'brew'; then
    printf "\\n" \
      | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
      &> /dev/null
  fi

  print_result $? 'homebrew'

  # Tap stuff
  if cmd_exists 'brew'; then
    brew::tap "caskroom/cask"
    brew::tap "caskroom/versions"
    brew::tap "caskroom/fonts"
    brew::tap "ravenac95/sudolikeaboss"
  else
    print_error "Homebrew is not installed!"
  fi
}

main "$@"
