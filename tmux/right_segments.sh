#!/usr/bin/env bash

# ---------------------------------------------

tm_segment() {
  icon=$1
  color=$2
  text=$3

  res=""

  [[ $icon == "" ]] || res+="#[bg=${color}, fg=brightblack, noreverse] ${icon} "

  res+="#[bg=brightblack, fg=${color}, noreverse] ${text} #[bg=default, fg=default]   #[none]"

  echo -ne $res
}

# ---------------------------------------------

# Music

itunes="$(osascript $DOTFILES/_misc/applescripts/itunes.scpt)"
spotify="$(osascript $DOTFILES/_misc/applescripts/spotify.scpt)"
soundcloud="$(osascript $DOTFILES/_misc/applescripts/soundcloud.js)"

music_res="N/A"

[[ $soundcloud != "" ]] && music_res=$soundcloud
[[ $spotify != "" ]] && music_res=$spotify
[[ $itunes != "" ]] && music_res=$itunes

tm_segment "♫" cyan "$music_res"

# ---------------------------------------------

# Bettery status

battery_percentage="$(pmset -g batt | awk '{print $3}' | grep '%')"
battery_status="$(pmset -g batt | awk '{print $4}' | grep 'char')"
battery_res=""
battery_color="yellow"
battery_symbol="⇋"


[[ $battery_status == 'discharging;' ]] && battery_color="magenta" && battery_symbol="↼"

tm_segment "$battery_symbol" $battery_color "${battery_percentage%?}"

# ---------------------------------------------

# Machine name

tm_segment "♦︎" blue "#h"
tm_segment "" blue "$(whoami)"

# ---------------------------------------------

# Date and time

tm_segment "" blue "$(date +'%d %b - %R')"

