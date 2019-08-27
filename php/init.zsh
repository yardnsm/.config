# Lazy load phpbrew
if command -v "phpbrew" &> /dev/null; then
  function phpbrew() {
    unset phpbrew

    source $HOME/.phpbrew/bashrc
    phpbrew $@
  }
fi
