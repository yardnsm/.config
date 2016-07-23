#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | Antibody
# --------------------------------------------- #
print_info "Installing antibody"
source $current_dir/scripts/install_antibody.sh
