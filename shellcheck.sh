#!/usr/bin/env bash

current_dir="$(dirname "${BASH_SOURCE[0]}")"

# ---------------------------------------------

source "$current_dir/_setup/initializer.sh"

# ---------------------------------------------

# I realy don't want to add shellcheck as a submodule,
# so this script assume you got it installed on your machine.

if ! cmd_exists "shellcheck"; then
  print_error "shellcheck is not installed!"
fi

find . \
  -type f \
  ! -path './_config/*' \
  ! -path './_misc/*' \
  ! -path './nvim/nvim.conf/plugged/*' \
  -name '*.sh' \
  -exec shellcheck \
    -e SC1090 \
    -e SC2015 \
    -e SC2143 \
  {} +

print_result $? "Shellcheck"
