#!/usr/bin/env bash

# ---------------------------------------------

declare __COMMANDS_OUTPUT_FILE

# ---------------------------------------------

commands::init_output_file() {

  # Use DEBUG_LOG_PATH variable if exists
  if [[ -n "$DEBUG_LOG_PATH" ]]; then
    __COMMANDS_OUTPUT_FILE="$DEBUG_LOG_PATH"
  else

    # Use a temporary file
    __COMMANDS_OUTPUT_FILE="$(mktemp)-$(date --iso-8601=seconds).dotfiles.log"
  fi

  # Add a modeline for enabling Vim folds
  echo -e "vim: set foldmethod=marker foldlevel=0:\n" >> "$__COMMANDS_OUTPUT_FILE"

  echo
  output::status "Output file is set to $__COMMANDS_OUTPUT_FILE"
}

# Check if a command exists
commands::exists() {
  command -v "$1" &> /dev/null
  return $?
}

# Execute a command and print a message (and show a spinner!)
commands::execute() {
  local -r CMD="$1"
  local -r MSG="$2"

  local exit_code=0
  local pid=""

  # Fill up output file
  if [[ -n "$__COMMANDS_OUTPUT_FILE" ]]; then
    cat >> "$__COMMANDS_OUTPUT_FILE" <<EOF
'$CMD' in ${BASH_SOURCE[1]}:${BASH_LINENO[0]} ${FUNCNAME[1]} {{{

EOF
  fi

  # Run command and append output to output file
  eval "$CMD" >> "${__COMMANDS_OUTPUT_FILE:-/dev/null}" 2>&1 &
  pid="$!"

  spinner:show_for_process $pid "${MSG:-$CMD}"

  wait $pid &> /dev/null
  exit_code=$?

  # Write exit code to output file
  if [[ -n "$__COMMANDS_OUTPUT_FILE" ]]; then
    cat >> "$__COMMANDS_OUTPUT_FILE" <<EOF

Finished with exit code $exit_code

}}}
EOF
  fi

  output::result $exit_code "${MSG:-$CMD}"
  return $exit_code
}
