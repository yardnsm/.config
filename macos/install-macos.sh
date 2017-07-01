#!/usr/bin/env bash

current_dir="$(dirname "${BASH_SOURCE[0]}")"

# ---------------------------------------------

print_info "Setup OSX configurations"
source "$current_dir/tasks/run_configurations.sh"

print_info "Change applications settings"
source "$current_dir/tasks/set_applications_settings.sh"
