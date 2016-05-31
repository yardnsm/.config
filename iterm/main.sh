#!/bin/bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | iTerm2 installs
# --------------------------------------------- #
print_info "Setup profile"
source $current_dir/scripts/setup_profile.sh
