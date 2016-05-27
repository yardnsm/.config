#!/bin/bash

# --------------------------------------------- #
# | Copying stuff
# --------------------------------------------- #
execute 'cp -n $current_dir/files/custom.icls $HOME/Library/Preferences/IntelliJIdea2016.1/colors/custom.icls' \
'Copy theme'

execute 'cp -n $current_dir/files/disabled_plugins.txt $HOME/Library/Preferences/IntelliJIdea2016.1/disabled_plugins.txt' \
'Copy disabled_plugins'
