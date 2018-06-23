#!/usr/bin/env bash

# ---------------------------------------------

tm_segment() {
  local -r icon=$1
  local -r color=$2
  local -r text=$3

  local res=""

  # Default color
  [[ -z $color ]] \
    && color="colour237"

  # Icon
  [[ -n $icon ]] \
    && res+="#[fg=${color}, noreverse]${icon} "

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

# Music
segment_music() {
  [[ $(command -v osascript) ]] \
    || return 1

  spotify="$(osascript "$DOTFILES"/_misc/applescripts/spotify.scpt)"
  is_playing="$(osascript "$DOTFILES"/_misc/applescripts/spotify_is_playing.scpt)"

  # Animate the music icon cuz i got no life
  # ¯\_(ツ)_/¯
  frames=( "⢄" "⢂" "⢁" "⡁" "⡈" "⡐" "⡠" )
  epoch="$(date +%s)"
  frame_index="$(( epoch % ${#frames[@]} ))"

  [[ "$is_playing" == 1 ]] && \
    music_icon="${frames[$frame_index]}" || \
    music_icon=""

  # Truncate the result
  [[ ${#spotify} -gt 25 ]] && \
    spotify="$(echo "$spotify" | cut -c 1-25)..."

  if [[ -n "$spotify" ]]; then
    tm_segment "$music_icon" "cyan" "$spotify"
    tm_divider
  fi
}

# ---------------------------------------------

# Adapted from yoavmmn's dotfiles:
# https://github.com/yoavmmn/dotfiles/blob/master/tmux/tmux_local/right_segments.sh#L23-L60

_load_weather() {
  curl -s http://wttr.in/Tel%20Aviv\?0TmQ > "$TMP_WEATHER_FILE"
  date +%s >> "$TMP_WEATHER_FILE"
}

# Weather
segment_weather() {
  local -r TMP_WEATHER_FILE="$HOME/.tmux_weather.tmp"
  local -r REFRESH_RATE=$(( 20 * 60 ))
  local -r HOT_POINT=17

  [[ -f "$TMP_WEATHER_FILE" ]] \
    || _load_weather

  local last_epoch; last_epoch="$(tail -n 1 "$TMP_WEATHER_FILE")"
  local epoch; epoch="$(date +%s)"
  local delta; delta=$(( epoch - last_epoch ))

  [[ $delta -gt $REFRESH_RATE ]] \
    && _load_weather

  local weather; weather="$(grep -o "[0-9]* °C" < "$TMP_WEATHER_FILE")"
  local temprature; temprature=$(echo "$weather" | grep -o "[0-9]*")

  local weather_icon="❆"
  local weather_color="blue"

  if [[ "$temprature" -gt "$HOT_POINT" ]]; then
    weather_icon="☀"
    weather_color="yellow"
  fi

  tm_segment "$weather_icon " "$weather_color" "$weather"
  tm_divider
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

  tm_segment "ϟ" "$battery_color" "${battery_percentage%?}"
  tm_divider
}

# ---------------------------------------------

# Date and time
segment_date() {
  tm_segment "" "brightblack" "$(date +'%d %b %Y %H:%M')"
  tm_divider
}

# ---------------------------------------------

# Machine name
segment_host() {
  local user

  [[ -n "$SSH_CONNECTION" ]] \
    && user="$(whoami)@"


  tm_segment "" "colour243" "$user#h"
}

# ---------------------------------------------

segment_music
# segment_weather
segment_battery
segment_date
segment_host
