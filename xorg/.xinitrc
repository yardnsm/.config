#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------
# ~/.xinitrc
# --------------------------------------------------------------------------------------------------

# Load the currently set profile for xrandr, if set.
# shellcheck disable=SC1090
[[ -f "$XDG_CONFIG_HOME/xorg/xrandr/current" ]] \
  && source "$XDG_CONFIG_HOME/xorg/xrandr/current"

# ---[ Xresources ]---------------------------------------------------------------------------------

# Merge existing .Xresources
xrdb -merge "$XDG_CONFIG_HOME/xorg/Xresources"

# ---[ xset ]---------------------------------------------------------------------------------------

# X11 Key repeat (delay / rate)
xset r rate 230 35

# DPMS monitor setting (Standby -> Suspend -> Off, in seconds)
xset dpms 500 700 900

# Disable PC speaker beeps
xset -b

# ---[ Starting shit up ]---------------------------------------------------------------------------

[[ -z "$(pgrep tmux)" ]] && tmux start &

# This is from /etc/X11/xinit/xinitrc
if [[ -d "/etc/X11/xinit/xinitrc.d" ]]; then
  for f in /etc/X11/xinit/xinitrc.d/?*.sh; do

    # shellcheck disable=SC1090
    [[ -x "$f" ]] && . "$f"
  done
  unset f
fi

# Start i3!
exec i3
