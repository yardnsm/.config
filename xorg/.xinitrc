#!/usr/bin/env bash

# ------------------------------------------------------------------------------
# ~/.xinitrc
# ------------------------------------------------------------------------------

main() {

  # Set xrandr
  # TODO: remove from here, this is very specific to the VirtualBox VM
  xrandr --output Virtual1 --mode 2560x1600 --dpi 220

  # Merge existing .Xresources
  xrdb -merge ~/.Xresources

  # Start i3!
  exec i3
}

main "$@"
