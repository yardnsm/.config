# Lazy load rbenv
if command -v "pyenv" &> /dev/null; then
  function rbenv() {
    unset rbenv
    eval "$(command rbenv init -)"
    pyenv $@
  }
fi
