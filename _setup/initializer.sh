#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  || exit 1

# ---------------------------------------------

# Check if sourced before
if [[ -z ${sourced+x} ]]; then

  sourced=true

  source "./utils/functions/apt.sh"
  source "./utils/functions/brew.sh"
  source "./utils/functions/gem.sh"
  source "./utils/functions/npm.sh"
  source "./utils/functions/pip.sh"
  source "./utils/functions/yarn.sh"

  source "./utils/ask.sh"
  source "./utils/commands.sh"
  source "./utils/topics.sh"
  source "./utils/messages.sh"
  source "./utils/os.sh"
  source "./utils/spinner.sh"

  source "./variables.sh"
fi
