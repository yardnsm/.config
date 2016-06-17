#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | Atom
# --------------------------------------------- #
print_info "Installing Atom packages"
source $current_dir/scripts/install_packages.sh
