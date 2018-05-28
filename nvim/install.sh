#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../_setup/initializer.sh"

# ---------------------------------------------

declare -r VIM_PLUG_PATH="$HOME/.local/share/nvim/site/autoload/plug.vim"
declare -r VIM_PLUG_FILE="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

# ---------------------------------------------

main() {
  print_info "Installing vim-plug"

  if [[ -e "$VIM_PLUG_PATH" ]]; then
    print_success "vim-plug is installed"
  else
    execute "curl -fLo $VIM_PLUG_PATH --create-dirs $VIM_PLUG_FILE" \
      "Installing vim-plug"
  fi

  print_info "Installing plugins"

  execute "printf '\\n' | nvim -c 'PlugInstall' -c 'UpdateRemotePlugins' -c 'qall'" \
    "Installing plugins"
}

main "$@"
