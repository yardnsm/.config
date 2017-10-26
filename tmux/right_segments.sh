#!/usr/bin/env bash

# ---------------------------------------------

tm_segment() {
  icon=$1
  color=$2
  text=$3

  res=""

  [[ -z $color ]] && color="colour237"

  [[ -n $icon ]] && res+="#[fg=${color}, noreverse] ${icon} "
  [[ -n $text ]] && res+="#[fg=${color}, noreverse] ${text} "
  res+="#[bg=default, fg=default]"

  echo -ne "$res"
}

tm_divider() {
  echo -ne "#[fg=colour237] • #[bg=default, fg=default]"
}


# ---------------------------------------------

# Music

if [[ $(command -v osascript) ]]; then
  itunes="$(osascript "$DOTFILES"/_misc/applescripts/itunes.scpt)"
  spotify="$(osascript "$DOTFILES"/_misc/applescripts/spotify.scpt)"
  # soundcloud="$(osascript "$DOTFILES"/_misc/applescripts/soundcloud.js)"

  music_res=""

  [[ $soundcloud != "" ]] && music_res=$soundcloud
  [[ $spotify != "" ]] && music_res=$spotify
  [[ $itunes != "" ]] && music_res=$itunes

  if [[ -n "$music_res" ]]; then
    tm_segment "♫" "cyan" "$music_res"
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

# Machine name

tm_segment "" "blue" "#h"
tm_divider

# ---------------------------------------------

# Date and time

tm_segment "" "colour243" "$(date +'%d %b %Y %H:%M')"
