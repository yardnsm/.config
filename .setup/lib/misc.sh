#!/usr/bin/env bash

# ---------------------------------------------

# Copy smth to clipboard
copy_to_clipboard() {
  if commands::exists "pbcopy"; then
    echo "$1" | pbcopy
  elif commands::exists "xclip"; then
    echo "$1" | xclip -selection clip
  else
    return 1
  fi
}

# Open smth in browser
open_in_browser() {
  if commands::exists "xdg-open"; then
    xdg-open "$1"
  elif commands::exists "open"; then
    open "$1"
  else
    return 1
  fi
}
