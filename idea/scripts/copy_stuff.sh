#!/bin/bash

# --------------------------------------------- #
# | Copying stuff
# --------------------------------------------- #

# Modified version of https://github.com/square/java-code-styles/blob/master/install.sh

for i in $HOME/Library/Preferences/IntelliJIdea*  \
         $HOME/Library/Preferences/IdeaIC*        \
         $HOME/Library/Preferences/AndroidStudio* \
         $HOME/.IntelliJIdea*/config              \
         $HOME/.IdeaIC*/config                    \
         $HOME/.AndroidStudio*/config
do
  if [[ -d $i ]]; then

    print_info_secondary "Acting for $(basename $i)"

    # Copy themes
    execute 'mkdir -p $i/colors && cp -f "$current_dir/files/colors"/* $i/colors' \
    'Copy themes'

    # Copy 'disabled_plugins'
    execute 'cp -f "$current_dir/files/disabled_plugins.txt" $i/disabled_plugins.txt' \
    'Copy disabled_plugins'

  fi
done
