#!/usr/bin/env bash

# ---------------------------------------------

tm_segment() {
  local -r text=$1
  local -r color=$2

  local res

  # Default color
  [[ -z $color ]] \
    && color="colour237"

  # Text
  [[ -n $text ]] \
    && res+="#[fg=${color} bg=default, noreverse]${text}"

  # Reset
  res+="#[bg=default, fg=default]"

  echo -ne "$res"
}

tm_divider() {
  echo -ne "#{window-status-separator}"
}

# ---------------------------------------------

# Detect if headphones are connected
# This is for macOS only
segment_headphones() {
  [[ "$(uname -s)" == "Darwin" ]] \
    || return 1

  if system_profiler SPAudioDataType | grep Headphones &> /dev/null; then
    tm_segment "0(o.o)0" "cyan"
    tm_divider
  fi
}

# ---------------------------------------------

# Music
segment_music() {
  [[ $(command -v osascript) ]] \
    || return 1

  spotify="$(osascript "$DOTFILES"/.misc/applescripts/spotify.scpt)"
  is_playing="$(osascript "$DOTFILES"/.misc/applescripts/spotify_is_playing.scpt)"

  # Animate the music icon cuz i got no life
  # ¯\_(ツ)_/¯
  frames=( "⢄" "⢂" "⢁" "⡁" "⡈" "⡐" "⡠" )
  epoch="$(date +%s)"
  frame_index="$(( epoch % ${#frames[@]} ))"

  [[ "$is_playing" == 1 ]] && \
    music_icon="${frames[$frame_index]} " || \
    music_icon=""

  # Truncate the result
  [[ ${#spotify} -gt 25 ]] && \
    spotify="$(echo "$spotify" | cut -c 1-25)..."

  if [[ -n "$spotify" ]]; then
    tm_segment "${music_icon}${spotify}" "cyan"
    tm_divider
  fi
}

# ---------------------------------------------

# Bettery status
segment_battery() {
  [[ $(command -v pmset) ]] \
    || return 1

  battery_percentage="$(pmset -g batt | awk '{print $3}' | grep '%')"
  battery_status="$(pmset -g batt | awk '{print $4}' | grep 'char')"
  battery_color="yellow"

  [[ $battery_status == 'discharging;' ]] && battery_color="magenta"

  tm_segment "ϟ ${battery_percentage%?}" "$battery_color"
  tm_divider
}

# ---------------------------------------------

# Date and time
segment_date() {
  tm_segment "$(date +'%d %b %Y %H:%M')" "brightblack"
  tm_divider
}

# ---------------------------------------------

# Machine name
segment_host() {
  local user

  [[ -n "$SSH_CONNECTION" ]] \
    && user="$(whoami)@"


  tm_segment "$user#h" "colour243"
}

# ---------------------------------------------

# segment_headphones
segment_music
segment_battery
segment_date
segment_host
