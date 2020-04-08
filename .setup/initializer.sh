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

  source "./lib/functions/apt.sh"
  source "./lib/functions/brew.sh"
  source "./lib/functions/gem.sh"
  source "./lib/functions/npm.sh"
  source "./lib/functions/pip.sh"

  source "./lib/actions.sh"
  source "./lib/ask.sh"
  source "./lib/commands.sh"
  source "./lib/topics.sh"
  source "./lib/os.sh"
  source "./lib/output.sh"
  source "./lib/spinner.sh"

  source "./variables.sh"
fi

# ---------------------------------------------

popd &> /dev/null \
  || return 1
