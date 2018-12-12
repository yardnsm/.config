# Lazy load phpbrew
if command -v "phpbrew" &> /dev/null; then
  function phpbrew() {
    unset phpbrew
    source /Users/yardensm/.phpbrew/bashrc
    phpbrew $@
  }
fi
