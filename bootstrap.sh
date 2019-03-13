#!/usr/bin/env bash

# ---------------------------------------------

declare -r DOTFILES_GITHUB_REPO="https://github.com/yardnsm/dotfiles"
declare -r DOTFILES_DIR="$HOME/dotfiles"

declare -a REQUIRED_COMMANDS=(
  'git'
  'ssh'
)

# ---------------------------------------------

step() {
  echo "  > $1"
}

# ---------------------------------------------

main() {

  # Check if dotfiles exists
  if [[ -d $DOTFILES_DIR ]]; then
    step "Dotfiles directory exists. Aborting..."
    exit 1
  fi

  # Verify that the required commands are available
  for cmd in "${REQUIRED_COMMANDS[@]}"; do
    if ! command -v "$cmd" &> /dev/null; then
      step "$cmd is not installed. Aborting..."
      exit 1
    fi
  done

  step "Cloning dotfiles to $DOTFILES_DIR"
  git clone "$DOTFILES_GITHUB_REPO" "$DOTFILES_DIR"

  cd "$DOTFILES_DIR" \
    || exit 1

  # Let's get the party started.
  source './install.sh'
}

main "$@"
