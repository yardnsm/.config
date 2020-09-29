#!/bin/zsh

# --------------------------------------------------------------------------------------------------

if [[ "$OSTYPE" != "darwin"* ]]; then

  # Start graphical server on tty1 if not already running.
  if [[ "$(tty)" = "/dev/tty1" ]] && ! pidof Xorg &> /dev/null; then
    exec startx "${XDG_CONFIG_HOME:-$HOME/.config}/xorg/.xinitrc"
  fi
fi
