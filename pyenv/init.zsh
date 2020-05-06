# pyenv default version
export PYENV_VERSION="3.7.7"

# Lazy load pyenv
if command -v "pyenv" &> /dev/null; then
  function pyenv() {
    unset pyenv

    eval "$(command pyenv init -)"
    pyenv $@
  }
fi
