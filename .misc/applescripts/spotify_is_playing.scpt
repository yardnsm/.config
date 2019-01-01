if application "Spotify" is running then
  tell application "Spotify"
    if player state is playing then
      return 1
    else
      return 0
    end if
  end tell
end if
