#!/usr/bin/env bash

# This script will be sourced in other scripts, so we don't want
# it to mess with the cwd
pushd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null \
  || exit 1

declare __initialized=${__initialized:-}

# ---------------------------------------------

# Check if sourced before
if [[ -z "$__initialized" ]]; then

  __initialized=1

  source "./utils/functions/apt.sh"
  source "./utils/functions/brew.sh"
  source "./utils/functions/gem.sh"
  source "./utils/functions/npm.sh"
  source "./utils/functions/pip.sh"

  source "./utils/ask.sh"
  source "./utils/commands.sh"
  source "./utils/topics.sh"
  source "./utils/messages.sh"
  source "./utils/os.sh"
  source "./utils/spinner.sh"
  source "./utils/symlink.sh"

  source "./variables.sh"
fi

# ---------------------------------------------

popd &> /dev/null \
  || return 1
