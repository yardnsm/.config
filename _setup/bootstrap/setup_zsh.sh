#!/usr/bin/env bash

# ---------------------------------------------

main() {
  print_title "Setting ZSH"

  if [[ "$SHELL" -eq "$(which zsh)" ]]; then
    print_success "ZSH is already your shell"
  elif which zsh &> /dev/null; then
    print_status "Change shell to ZSH (re-login is required)\n"

    chsh -s "$(which zsh)" && echo
    print_result $? "ZSH is now your shell"
  else
    print_status "zsh is not installed"
  fi
}

main "$@"
