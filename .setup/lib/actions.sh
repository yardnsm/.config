#!/usr/bin/env bash

# ---------------------------------------------

# Copy smth to clipboard
actions::copy_to_clipboard() {
  if commands::exists "pbcopy"; then
    echo "$1" | pbcopy
  elif commands::exists "xclip"; then
    echo "$1" | xclip -selection clip
  else
    return 1
  fi
}

# Open smth in browser
actions::open() {
  if commands::exists "xdg-open"; then
    xdg-open "$1"
  elif commands::exists "open"; then
    open "$1"
  else
    return 1
  fi
}
