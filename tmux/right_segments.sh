#!/usr/bin/env bash

# ---------------------------------------------

tm_segment() {
  icon=$1
  color=$2
  text=$3

  res=""

  [[ -z $color ]] && color="colour237"

  [[ -n $icon ]] && res+="#[ fg=${color}, noreverse] ${icon}"
  [[ -n $text ]] && res+="#[fg=${color} bg=default, noreverse] ${text} "
  res+="#[bg=default, fg=default]"

  echo -ne "$res"
}

tm_divider() {
  echo -ne "#[fg=colour237]|#[bg=default, fg=default]"
}


# ---------------------------------------------

# Music

if [[ $(command -v osascript) ]]; then
  spotify="$(osascript "$DOTFILES"/_misc/applescripts/spotify.scpt)"
  is_playing="$(osascript "$DOTFILES"/_misc/applescripts/spotify_is_playing.scpt)"

  # Animate the music icon cuz i got no life
  # ¯\_(ツ)_/¯
  frames=( "⢄" "⢂" "⢁" "⡁" "⡈" "⡐" "⡠" )
  epoch="$(date +%s)"
  frame_index="$(( $epoch % ${#frames[@]} ))"

  [[ "$is_playing" == 1 ]] && \
    music_icon="${frames[$frame_index]}" || \
    music_icon=""

  if [[ -n "$spotify" ]]; then
    tm_segment "$music_icon" "cyan" "$spotify"
    tm_divider
  fi
fi

# ---------------------------------------------

# Bettery status

if [[ $(command -v pmset) ]]; then
  battery_percentage="$(pmset -g batt | awk '{print $3}' | grep '%')"
  battery_status="$(pmset -g batt | awk '{print $4}' | grep 'char')"
  battery_color="yellow"

  [[ $battery_status == 'discharging;' ]] && battery_color="magenta"

  tm_segment "" "$battery_color" "${battery_percentage%?}"
  tm_divider
fi

# ---------------------------------------------

# Date and time

tm_segment "" "colour243" "$(date +'%d %b %Y %H:%M')"
tm_divider

# ---------------------------------------------

# Machine name

tm_segment "" "blue" "#h"
