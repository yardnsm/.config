#!/usr/bin/env bash

# ---------------------------------------------

main() {
  if [[ "$(get_os)" == "macos" ]]; then

    print_title "Setting up xcode command line tools"
    print_status "Please proceed manually"

    xcode-select --install

  fi
}

main "$@"
