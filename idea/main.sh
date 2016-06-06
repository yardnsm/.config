#!/bin/bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | intelliJ stuff
# --------------------------------------------- #
print_info "Copying IntelliJ Stuff"
source $current_dir/scripts/copy_stuff.sh
