#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

print_info "Installing plugins"

execute "$DOTFILES/_submodules/tpm/scripts/install_plugins.sh" \
  "Installing tmux plugins (using tpm)"
