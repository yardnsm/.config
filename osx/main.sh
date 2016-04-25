#!/bin/bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | OSX
# --------------------------------------------- #
print_info "Setup OSX configurations"
source $current_dir/scripts/run_configurations.sh

print_info "Change applications settings"
source $current_dir/scripts/set_applications_settings.sh
