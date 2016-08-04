#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | npm
# --------------------------------------------- #
print_info "Installing NPM global dependencies"
source $current_dir/scripts/npm.sh
