#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "./initializer.sh"

# ---------------------------------------------

# Check that we're on a good os
check_os() {
  local -r os="$(get_os)"

  if [[ "$os" == 'dafuk' ]]; then
    print_error "Don't even try."
    exit 1
  fi

  print_success "Running on $os"
}

# Check if Xcode CLI is installed
check_xcode_tools() {
  if [[ "$(get_os)" == 'macos' ]]; then
    if ! xcode-select --print-path &> /dev/null; then
      print_error "Xcode Command Line tools are not installed!"

      cat <<EOF

          Install them via:

            $ xcode-select --install

EOF
    else
      print_success "Xcode Command Line tools are installed"
    fi
  fi
}

# Initializing git submodules
check_git_submodules() {
  pushd "$DOTFILES" &> /dev/null \
    || return 1

  execute "git submodule update --init --recursive --remote -q" \
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
