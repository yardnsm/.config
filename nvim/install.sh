#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

print_info "Symlink nvim config"

ln -s "$DOTFILES/nvim/nvim.conf" "$HOME/.config/nvim" &> /dev/null
print_result $? "Creating symlink for nvim.conf"

# ---------------------------------------------

print_info "Installing plugins"

nvim -c 'PlugInstall' -c 'UpdateRemotePlugins' -c 'qa!'
print_result $? "Installed plugins"
