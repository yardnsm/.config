#!/usr/bin/env bash

# ---------------------------------------------

main() {
  if which zsh &> /dev/null; then
    execute "chsh -s $(which zsh)" \
      "Change shell to zsh (re-login is required)"
  else
    print_status "zsh is not installed"
  fi
}

main "$@"
