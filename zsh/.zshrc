# vim: set foldmethod=marker foldlevel=0:

# Setting fpath {{{

fpath=(
  $ZSH/completions
  $ZSH/functions
  $fpath
)

# }}}
# Sourcing {{{

# Source all .zsh files within the dotfiles repo
for config ($DOTFILES/*/*.zsh) source $config
for config ($DOTFILES/zsh/prompt/**/*.zsh) source $config

# Source .zsh files from ~/dotfiles-local
[[ -d "$DOTFILES_LOCAL" ]] \
  && for config ($DOTFILES_LOCAL/**/*.zsh) source $config

# }}}
# Autoloading {{{

# Load colors and setup promptinit
autoload -U colors && colors
autoload -U promptinit && promptinit

# Initialize completion
autoload -U compinit && compinit

autoload -U edit-command-line

# }}}
# pywal setup {{{

if [[ -d "$PYWAL_HOME" ]]; then
  (cat "$PYWAL_HOME/sequences" &)
fi

# }}}
