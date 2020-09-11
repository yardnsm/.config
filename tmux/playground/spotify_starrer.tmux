# Spotify starrer

# This allows to "save" the current track playing in Spotify by using a keybinding.
# This is still a POC, I'll probably wrap it as a plugin later on.
#
# `prefix + v` to star the current track
# `prefix + V` to unstar the current track
#
# You can use https://github.com/spotify/web-api-auth-examples to retrieve a token.
#
# TODO:
# =============
# - Wrap this thing as a plugin
# - Avoid re-starring, since it'll move the current track to the top of the library
# - Provide an indicator for starred tracks
# - Proper error handling

set-environment -g TMUX_SPOTIFY_API_KEY $TMUX_SPOTIFY_API_KEY

bind-key v run-shell \
  'tmux display-message "Starring current track..." \
    && curl -X "PUT" \
      "https://api.spotify.com/v1/me/tracks?ids=$(osascript "$XDG_CONFIG_HOME"/tmux/theme/applescripts/spotify_get_track_id.scpt)" \
      -d "" \
      -H "Accept: application/json" \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $TMUX_SPOTIFY_API_KEY"  \
    && tmux display-message "Starred!"'

bind-key V confirm-before -p 'Unstar current track? (y/n)' \
  'run-shell \
    "tmux display-message \"Unstarring current track...\" \
      && curl -X \"DELETE\" \
        \"https://api.spotify.com/v1/me/tracks?ids=$(osascript \"$XDG_CONFIG_HOME\"/tmux/theme/applescripts/spotify_get_track_id.scpt)\" \
        -d \"\" \
        -H \"Accept: application/json\" \
        -H \"Content-Type: application/json\" \
        -H \"Authorization: Bearer $TMUX_SPOTIFY_API_KEY\"  \
      && tmux display-message \"Unstarred!\""'
