FNM_ENV_LOADED=0

_fnm_autoload_hook() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    echo "fnm: Found .nvmrc"

    [[ $FNM_ENV_LOADED == 0 ]] && \
      eval `fnm env` && \
      FNM_ENV_LOADED=1
  fi
}

add-zsh-hook chpwd _fnm_autoload_hook \
  && _fnm_autoload_hook
