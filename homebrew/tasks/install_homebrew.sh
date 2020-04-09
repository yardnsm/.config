#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------

main() {

  # Install Homebrew
  if ! commands::exists 'brew'; then
    printf "\\n" \
      | ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" \
      &> /dev/null
  fi

  output::result $? 'Homebrew'
}

main "$@"
