#!/usr/bin/env bash

# ---------------------------------------------

print_info "Symlink nvim config"

ln -s "$DOTFILES/nvim/nvim.conf" "$HOME/.config/nvim" &> /dev/null
print_result $? "Creating symlink for nvim.conf"

# ---------------------------------------------

print_info "Installing plugins"

nvim -c 'PlugInstall' -c 'qa!'
print_result $? "Installed plugins"

# ---------------------------------------------

print_info "Configuring YCM"

execute "$DOTFILES/nvim/nvim.conf/plugged/YouCompleteMe/install.py --tern-completer" \
  "Installing YCM"
