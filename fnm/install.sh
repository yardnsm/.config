#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

declare -r FNM_DIR="$HOME/.fnm"
declare -r FNM_INSTALL_FILE="https://raw.githubusercontent.com/Schniz/fnm/master/.ci/install.sh"

# ---------------------------------------------

main() {
  output::info "Installing fnm"

  if [[ -d "$FNM_DIR" ]]; then
    output::success "fnm is installed"
  else
    commands::execute "curl $FNM_INSTALL_FILE | bash -s -- --install-dir $FNM_DIR --skip-shell" \
      "Installing fnm"
  fi
}

main "$@"
