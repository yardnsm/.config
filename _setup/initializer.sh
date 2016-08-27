#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# --------------------------------------------- #
# | Source the following if needed
# --------------------------------------------- #

# Check if sourced before
if [ -z ${sourced+x} ]; then

  sourced="yep"

  source $current_dir/utils/messages.sh
  source $current_dir/utils/ask.sh
  source $current_dir/utils/commands.sh
  source $current_dir/utils/installs.sh
  source $current_dir/utils/spinner.sh
  source $current_dir/variables.sh
fi
