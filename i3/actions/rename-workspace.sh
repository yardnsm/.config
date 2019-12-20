#!/usr/bin/env bash

# ---------------------------------------------

get_workspace() {
  i3-msg -t get_workspaces | jq '.[] | select(.focused == true).num'
}

main() {
  local name
  local workspace

  name=$(rofi -dmenu -lines 0 -p "Rename" -theme rofi_bar)
  workspace=$(get_workspace)

  [[ -n "$name" ]] && \
    i3-msg "rename workspace to \"$workspace:+$name\""
}

main "$@"
