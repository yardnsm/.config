#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "./initializer.sh"

# ---------------------------------------------

# Check that we're on a good os
check_os() {
  local -r os="$(os::get_name)"

  if [[ "$os" == 'dafuk' ]]; then
    output::error "Don't even try."
    exit 1
  fi

  output::success "Running on $os"
}

# Check if Xcode CLI is installed
check_xcode_tools() {
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

# Initializing git submodules
check_git_submodules() {
  pushd "$DOTFILES" &> /dev/null \
    || return 1

  commands::execute "git submodule update --init --recursive --remote -q" \
    "Initializing git modules"

  popd &> /dev/null \
    || return 1
}

# ---------------------------------------------

main() {
  check_os
  check_xcode_tools
  check_git_submodules
}

main "$@"
