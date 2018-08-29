# vim: set foldmethod=marker foldlevel=0:

# Core variables {{{

export DOTFILES=$HOME/dotfiles
export DOTFILES_LOCAL=$HOME/dotfiles-local
export ZSH=$DOTFILES/zsh
export SUBMODULES_PATH=$DOTFILES/_submodules

# }}}
# Setting `fpath` {{{

fpath=($ZSH/functions $fpath)

# }}}
# Sourcing {{{

# Source all .zsh files within the dotfiles repo
for config ($DOTFILES/*/*.zsh-before) source $config
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

# }}}
