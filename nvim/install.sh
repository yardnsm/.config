#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# --------------------------------------------------------------------------------------------------

declare -r VIM_PLUG_PATH="$DOTFILES/nvim/autoload/plug.vim"
declare -r VIM_PLUG_FILE="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# --------------------------------------------------------------------------------------------------

install_vim_plug() {
  if [[ -e "$VIM_PLUG_PATH" ]]; then
    output::success "vim-plug is installed"
  else
    commands::execute "curl -fLo $VIM_PLUG_PATH --create-dirs $VIM_PLUG_FILE" \
      "Installing vim-plug"
  fi
}

install_plugins() {
  if os::is_ci; then
    output::status "Skipping inside a CI"
  else
    commands::execute "nvim -c 'PlugInstall' -c 'UpdateRemotePlugins' -c 'qall'" \
      "Installing plugins"
  fi
}

# ---------------------------------------------

main() {
  output::info "Installing vim-plug"
  install_vim_plug

  output::info "Installing plugins"
  install_plugins
}

main "$@"
