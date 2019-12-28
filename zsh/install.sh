#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

main() {
  output::info "Setting ZSH"

  if os::is_ci; then
    output::status "Skipping inside a CI"
    return 1
  fi

  if [[ -n "$ZSH_VERSION" ]]; then
    output::success "ZSH is already your shell"
  elif command -v zsh &> /dev/null; then
    output::status "Change shell to ZSH (re-login is required)\\n"

    chsh -s "$(command -v zsh)" && echo
    output::result $? "ZSH is now your shell"
  else
    output::status "zsh is not installed"
  fi
}

main "$@"
