#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# ---------------------------------------------

print_info "Installing Atom packages"
apm_install 'package-sync'
