# Lazy load phpbrew
if command -v "phpbrew" &> /dev/null; then
  function phpbrew() {
    unset phpbrew

    source $PHPBREW_HOME/bashrc
    phpbrew $@
  }
fi
