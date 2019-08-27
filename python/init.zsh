# Lazy load pyenv
if command -v "pyenv" &> /dev/null; then
  function pyenv() {
    unset pyenv

    eval "$(command pyenv init -)"
    pyenv $@
  }
fi
