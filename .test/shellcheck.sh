#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

# I realy don't want to add shellcheck as a submodule,
# so this script assume you got it installed on your machine.

main() {
  print_info "Running shellcheck"

  if ! cmd_exists "shellcheck"; then
    print_error "shellcheck is not installed!"
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

  print_result $? "Shellcheck"
}

main "$@"
