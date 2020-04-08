#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# --------------------------------------------------------------------------------------------------

declare -r VIM_PLUG_PATH="$DOTFILES/nvim/autoload/plug.vim"
declare -r VIM_PLUG_FILE="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

declare -r COC_DIR="$HOME/.config/coc/extensions"
declare -a COC_EXTENSIONS=(
  'coc-tsserver'
  'coc-html'
  'coc-json'
  'coc-css'
  'coc-snippets'
  'coc-eslint'
  'coc-prettier'
  'coc-python'
  'coc-phpls'
  'coc-svg'
  'coc-vimlsp'
  'coc-xml'
  'coc-reason'
)

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

install_coc_extensions() {
  mkdir -p "$COC_DIR"
  pushd "$COC_DIR" &> /dev/null \
    || return 1

  # Create an emmpty package.json
  if [[ ! -f package.json ]]; then
    echo '{ "dependencies": {} }' > package.json
  fi

  for ext in "${COC_EXTENSIONS[@]}"; do
    commands::execute \
      "npm install $ext --global-style --no-bin-links  --no-package-lock --only=prod" \
      "Installing $ext"
  done

  popd &> /dev/null \
    || return 1
}

# ---------------------------------------------

main() {
  output::info "Installing vim-plug"
  install_vim_plug

  output::info "Installing plugins"
  install_plugins

  output::info "Installing coc.nvim extensions"
  install_coc_extensions
}

main "$@"
