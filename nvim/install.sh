#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

print_info "Symlink nvim config"

mkdir -p "$HOME/.config"
ln -s "$DOTFILES/nvim/nvim.conf" "$HOME/.config/nvim" &> /dev/null
print_result $? "Creating symlink for nvim.conf"

# ---------------------------------------------

print_info "Installing plugins"

execute "printf '\\n' | nvim -c 'PlugInstall' -c 'UpdateRemotePlugins' -c 'qall'" \
  "Installing plugins"
