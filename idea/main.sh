#!/bin/bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | Copy IntelliJ themes
# --------------------------------------------- #
print_info "Copying IntelliJ Stuff"

execute 'cp -n $current_dir/files/custom.icls $HOME/Library/Preferences/IntelliJIdea2016.1/colors' \
'Copy theme'

execute 'cp -n $current_dir/files/disabled_plugins.txt $HOME/Library/Preferences/IntelliJIdea2016.1' \
'Copy disabled_plugins'
