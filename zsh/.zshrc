# vim: set foldmethod=marker foldlevel=0:

# Setting fpath {{{

fpath=(
  $ZSH/completions
  $ZSH/functions
  $fpath
)

# }}}
# Sourcing {{{

# Source all init.zsh files within the dotfiles repo
for config ($DOTFILES/*/*.zsh) source $config

# Prompt sources
for config ($DOTFILES/zsh/prompt/**/*.zsh) source $config

# Source all init.zsh files from the local dotfiles
[[ -d "$DOTFILES_LOCAL" ]] \
  && for config ($DOTFILES_LOCAL/*/*.zsh) source $config

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
