# vim: set foldmethod=marker foldlevel=0:

# Sourcing {{{

eval "$(fnm env --multi --fnm-dir "$FNM_DIR")"

# }}}
# Autoload hooks {{{

_fnm_autoload_hook() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    echo "fnm: Found .nvmrc"
    fnm use
  fi
}

add-zsh-hook chpwd _fnm_autoload_hook \
  && _fnm_autoload_hook

# }}}
