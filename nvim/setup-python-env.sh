#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

setup_python3() {
  output::info "Installing Python 3.6.3"
  pyenv install 3.6.3

  output::info "Creating a virtualenv"
  pyenv virtualenv 3.6.3 neovim3
  pyenv activate neovim3

  output::info "Installing neovim pip module"
  pip install neovim pynvim

  output::info "Installing additional pipes"
  pip install python-language-server jedi

  pyenv deactivate
}

setup_python2() {
  output::info "Installing Python 2.7.13"
  pyenv install 2.7.13

  output::info "Creating a virtualenv"
  pyenv virtualenv 2.7.13 neovim2
  pyenv activate neovim2

  output::info "Installing neovim pip module"
  pip install neovim pynvim

  output::info "Installing additional pipes"
  pip install python-language-server jedi

  pyenv deactivate
}

main() {
  eval "$(command pyenv init -)"
  setup_python3
  setup_python2
}

main "$@"
