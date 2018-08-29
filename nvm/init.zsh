# Automate `nvm use`

_is_nvm_loaded() {
  type "nvm_find_nvmrc" > /dev/null 2>&1
}

_nvmrc_autoload_hook() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
    return;
  fi

  _is_nvm_loaded || return

  if [[ $(nvm version) != $(nvm version default)  ]]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd _nvmrc_autoload_hook \
  && _nvmrc_autoload_hook
