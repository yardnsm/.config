if application "Spotify" is running then
  tell application "Spotify"
    try
      set trackId to the id of the current track
      set AppleScript's text item delimiters to ":"

      return text item 3 of trackId
      on error err
    end try
  end tell
end if
