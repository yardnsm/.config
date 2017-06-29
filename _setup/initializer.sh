#!/usr/bin/env bash

current_dir="$(dirname "$BASH_SOURCE")"

# ---------------------------------------------

# Check if sourced before
if [[ -z ${sourced+x} ]]; then

  sourced="true"

  source $current_dir/utils/functions/brew.sh
  source $current_dir/utils/functions/gem.sh
  source $current_dir/utils/functions/npm.sh

  source $current_dir/utils/ask.sh
  source $current_dir/utils/commands.sh
  source $current_dir/utils/messages.sh
  source $current_dir/utils/os.sh
  source $current_dir/utils/spinner.sh

  source $current_dir/variables.sh
fi
