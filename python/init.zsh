# pyenv root
export PYENV_ROOT="$HOME/.pyenv"

# pyenv shims
export PATH=$PYENV_ROOT/bin:$PATH

# pyenv default version
export PYENV_VERSION="3.6.3"

# Lazy load pyenv
if command -v "pyenv" &> /dev/null; then
  function pyenv() {
    unset pyenv

    eval "$(command pyenv init -)"
    pyenv $@
  }
fi
