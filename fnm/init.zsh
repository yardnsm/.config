# vim: set foldmethod=marker foldlevel=0:

export PATH=$HOME/.fnm:$PATH

# Sourcing {{{

eval "$(fnm env --multi)"

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
