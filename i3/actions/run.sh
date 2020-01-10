#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------

main() {
  rofi -show run -theme rofi_bar -theme-str '*{--accent: #0390fc;}'
}

main "$@"
