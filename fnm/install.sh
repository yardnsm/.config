#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

declare -r FNM_DIR="$HOME/.fnm"
declare -r FNM_INSTALL_FILE="https://raw.githubusercontent.com/Schniz/fnm/master/.ci/install.sh"

# ---------------------------------------------

main() {
  print_info "Installing fnm"

  if [[ -d "$FNM_DIR" ]]; then
    print_success "fnm is installed"
  else
    execute "curl $FNM_INSTALL_FILE | bash -s -- --install-dir $FNM_DIR --skip-shell"
  fi
}

main "$@"