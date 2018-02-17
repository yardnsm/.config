#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../initializer.sh"

# ---------------------------------------------

main() {
  print_title "Setting ZSH"

  if [[ -n "$ZSH_VERSION" ]]; then
    print_success "ZSH is already your shell"
  elif which zsh &> /dev/null; then
    print_status "Change shell to ZSH (re-login is required)\\n"

    chsh -s "$(which zsh)" && echo
    print_result $? "ZSH is now your shell"
  else
    print_status "zsh is not installed"
  fi
}

main "$@"
