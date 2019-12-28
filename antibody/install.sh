#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

main() {
  output::info "Installing Antibody"

  if ! commands::exists 'antibody'; then
    commands::execute "curl -s https://raw.githubusercontent.com/getantibody/installer/master/install | bash -s - -b /usr/local/bin" \
      "Installing Antibody"
  else
    output::success 'Antibody is already installed'
  fi
}

main "$@"
