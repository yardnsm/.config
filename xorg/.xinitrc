#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# ~/.xinitrc
# ------------------------------------------------------------------------------

main() {

  # Merge existing .Xresources
  xrdb -merge "$XDG_CONFIG_HOME/xorg/Xresources"

  # Merge from the local dotfiles
  if [[ -d "$DOTFILES_LOCAL" ]]; then
    source "$DOTFILES_LOCAL/xorg/.xinitrc"
  fi

  # Start i3!
  exec i3
}

main "$@"
