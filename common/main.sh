#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | Common
# --------------------------------------------- #
print_info "Create symlinks"
source $current_dir/scripts/symlink.sh

print_info "Create copies"
source $current_dir/scripts/copy.sh

print_info "Setup workspace folders"
source $current_dir/scripts/workspace.sh
