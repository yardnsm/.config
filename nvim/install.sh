#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

declare -r VIM_PLUG_PATH="$HOME/.local/share/nvim/site/autoload/plug.vim"
declare -r VIM_PLUG_FILE="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

declare -a COC_EXTENSIONS=(
  'coc-tsserver'
  'coc-html'
  'coc-json'
  'coc-css'
  'coc-pyls'
  'coc-snippets'
  'coc-eslint'
  'coc-prettier'
  'coc-ultisnips'
)

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

  execute "nvim -c 'PlugInstall' -c 'UpdateRemotePlugins' -c 'qall'" \
    "Installing plugins"

  print_info "Installing coc.nvim extensions"

  for ext in "${COC_EXTENSIONS[@]}"; do
    # coc.nvim uses yarn for some reason, so we'll also use it here
    execute "cd $HOME/.config/coc/extensions && yarn add $ext" \
      "Installing $ext"
  done
}

main "$@"
