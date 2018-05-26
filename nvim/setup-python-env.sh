#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

setup_python3() {
  print_info "Creating a virtualenv"
  pyenv virtualenv 3.6.3 neovim3
  pyenv activate neovim3

  print_info "Installing neovim pip module"
  pip install neovim

  print_info "Installing additional pipes"
  pip install python-language-server jedi

  pyenv deactivate
}

setup_python2() {
  print_info "Creating a virtualenv"
  pyenv virtualenv 2.7.13 neovim2
  pyenv activate neovim2

  print_info "Installing neovim pip module"
  pip install neovim

  print_info "Installing additional pipes"
  pip install python-language-server jedi

  pyenv deactivate
}

main() {
  setup_python3
  setup_python2
}

main "$@"
