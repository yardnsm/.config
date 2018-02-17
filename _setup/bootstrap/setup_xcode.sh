#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../initializer.sh"

# ---------------------------------------------

main() {
  if [[ "$(get_os)" == "macos" ]] && ! xcode-select --print-path &> /dev/null; then

    print_title "Setting up xcode command line tools"
    print_status "Please proceed manually"

    xcode-select --install

  fi
}

main "$@"
