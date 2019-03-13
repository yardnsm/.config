#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

main() {
  print_info "Setting ZSH"

  if [[ -n "$ZSH_VERSION" ]]; then
    print_success "ZSH is already your shell"
  elif command -v zsh &> /dev/null; then
    print_status "Change shell to ZSH (re-login is required)\\n"

    chsh -s "$(command -v zsh)" && echo
    print_result $? "ZSH is now your shell"
  else
    print_status "zsh is not installed"
  fi
}

main "$@"
