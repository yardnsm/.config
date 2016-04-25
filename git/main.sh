#!/bin/bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | Git
# --------------------------------------------- #
print_info "Setup local gitconfig"
source $current_dir/scripts/gitconfig.sh
