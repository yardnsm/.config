#!/usr/bin/env bash

declare __TOPICS=()

# --------------------------------------------------------------------------------------------------

__consume_topics() {
  while [[ -n "$1" ]]; do
    if topics::exists "$1"; then
      __TOPICS+=( "$1" )
    else
      echo
      output::error "Error: topic $1 does not exist!"
      exit 1
    fi

    shift
  done
}

# --------------------------------------------------------------------------------------------------

__check_os() {
  local -r os="$(os::get_name)"

  if [[ "$os" == 'dafuk' ]]; then
    output::error "Don't even try."
    exit 1
  fi

  output::success "Running on $os"
}

__check_xcode_tools() {
  if [[ "$(os::get_name)" == 'macos' ]]; then
    if ! xcode-select --print-path &> /dev/null; then
      output::error "Xcode Command Line tools are not installed!"

      cat <<EOF

          Install them via:

            $ xcode-select --install

EOF
    else
      output::success "Xcode Command Line tools are installed"
    fi
  fi
}

__init_submodules() {
  pushd "$DOTFILES" &> /dev/null \
    || return 1

  commands::execute "git submodule update --init --recursive --remote -q" \
    "Initializing git modules"

  popd &> /dev/null \
    || return 1
}
# --------------------------------------------------------------------------------------------------

command::install() {

  __consume_topics "$@"

  output::welcome_message

  if [[ "$OPT_DEBUG_LOG" -eq 1 ]]; then
    commands::init_output_file
  fi

  if [[ ${#__TOPICS} -ne 0 ]]; then
    echo

    if [[ "$OPT_EXCLUDE" -eq 1 ]]; then
      output::status "Topics to exclude: ${__TOPICS[*]}"
    else
      output::status "Topics to install: ${__TOPICS[*]}"
    fi
  fi

  echo

  # Run checks
  __check_os
  __check_xcode_tools

  if [[ "$OPT_INIT" -eq 1 ]]; then
    __init_submodules
  fi

  # Ask if it's okay
  if ! [[ "$OPT_YES" -eq 1 ]]; then
    output::info "Just to make sure"
    ask::prompt_confirmation "Continue? "
  fi

  # Check if answer is yes
  if ! ( ask::answer_is_yes || [[ $OPT_YES -eq 1 ]] ); then
    output::error "Error: aborted"
    exit 1
  fi

  ask::check_sudo

  if [[ "$OPT_EXCLUDE" -eq 1 ]]; then
    topics::install_multiple "" "${__TOPICS[*]}"
  else
    topics::install_multiple "${__TOPICS[*]}"
  fi

  output::info "Setup is done! You might need to restart your system to see full changes."
}
