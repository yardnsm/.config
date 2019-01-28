# Automate `nvm use`

function __set_nvm_hooks() {
  _is_nvm_loaded() {
    type "nvm_find_nvmrc" > /dev/null 2>&1
  }

  _nvmrc_autoload_hook() {
    if [[ -f .nvmrc && -r .nvmrc ]]; then
      echo "nvm: Found .nvmrc; activating nvm"
      nvm current &> /dev/null

      if ! node --version | grep -q "$(cat .nvmrc)"; then
        echo "nvm: current node version is different than .nvmrc; running nvm use"
        nvm use
        return;
      fi
    fi

    _is_nvm_loaded || return

    if [[ $(nvm version) != $(nvm version default)  ]]; then
      echo "Reverting to nvm default version"
      nvm use default
    fi
  }

  add-zsh-hook chpwd _nvmrc_autoload_hook \
    && _nvmrc_autoload_hook
}

# _set_nvm_hooks
unset -f _set_nvm_hooks
