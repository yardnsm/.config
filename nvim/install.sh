#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../.setup/initializer.sh"

# ---------------------------------------------

declare -r VIM_PLUG_PATH="$DOTFILES/nvim/nvim.conf/autoload/plug.vim"
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
)

# ---------------------------------------------

main() {
  output::info "Installing vim-plug"

  if [[ -e "$VIM_PLUG_PATH" ]]; then
    output::success "vim-plug is installed"
  else
    commands::execute "curl -fLo $VIM_PLUG_PATH --create-dirs $VIM_PLUG_FILE" \
      "Installing vim-plug"
  fi

  output::info "Installing plugins"

  if os::is_ci; then
    output::status "Skipping inside a CI"
  else
    commands::execute "nvim -c 'PlugInstall' -c 'UpdateRemotePlugins' -c 'qall'" \
      "Installing plugins"
  fi

  output::info "Installing coc.nvim extensions"

  mkdir -p "$COC_DIR"
  pushd "$COC_DIR" &> /dev/null \
    || return 1

  if [[ ! -f package.json ]]; then
    echo '{ "dependencies": {} }' > package.json
  fi

  for ext in "${COC_EXTENSIONS[@]}"; do
    # coc.nvim uses yarn for some reason, so we'll also use it here
    commands::execute "yarn add $ext --frozen-lockfile --ignore-engines" \
      "Installing $ext"
  done

  popd &> /dev/null \
    || return 1
}

main "$@"
