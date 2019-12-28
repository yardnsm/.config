#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

# I realy don't want to add shellcheck as a submodule,
# so this script assume you got it installed on your machine.

main() {
  output::info "Running shellcheck"

  if ! commands::exists "shellcheck"; then
    output::error "shellcheck is not installed!"
    return 1
  fi

  find .. \
    -type f \
    ! -path '../.submodules/*' \
    ! -path '../.misc/*' \
    ! -path '../nvim/nvim.conf/plugged/*' \
    ! -path '../alacritty/alacritty/*' \
    ! -path '../zsh/completions/*' \
    -name '*.sh' \
    -exec shellcheck \
      -e SC1091 \
      -e SC1090 \
      -e SC2015 \
    {} +

  output::result $? "Shellcheck"
}

main "$@"
