# rbenv version
export RBENV_VERSION="2.2.4"

# Lazy load rbenv
if command -v "rbenv" &> /dev/null; then
  function rbenv() {
    unset rbenv

    eval "$(command rbenv init -)"
    rbenv $@
  }
fi
