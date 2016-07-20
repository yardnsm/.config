#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | Ruby
# --------------------------------------------- #
print_info "Installing Gems"
source $current_dir/scripts/install_gems.sh
