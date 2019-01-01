#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

main() {
  print_info "Installing rustup"
  curl https://sh.rustup.rs -sSf | sh

  print_info "Cloning Alacritty repository"
  git clone https://github.com/jwilm/alacritty.git
  cd alacritty || exit 1

  print_info "Setting up Rust"
  rustup override set stable
  rustup update stable

  print_info "Building Alacritty"
  make app

  print_info "Copying Alacritty.app to the Applications folder"
  cp -r target/release/osx/Alacritty.app /Applications/
}

main "$@"
