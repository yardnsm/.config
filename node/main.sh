#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | Node
# --------------------------------------------- #
print_info "Installing NPM global dependencies"
source $current_dir/scripts/npm.sh
