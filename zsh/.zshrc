# vim: set foldmethod=marker foldlevel=0:

# Core variables {{{

export DOTFILES=$HOME/dotfiles
export DOTFILES_LOCAL=$HOME/dotfiles-local
export ZSH=$DOTFILES/zsh
export SUBMODULES=$DOTFILES/.submodules

export KNOWLEDGE=$HOME/knowledge
export DRAFTS_HOME=$KNOWLEDGE/drafts

fpath=(
  $ZSH/completions
  $ZSH/functions
  $fpath
)

# OS Variables
case "$(uname -s)" in
  "Linux")
    export IS_LINUX=true
    ;;
  "Darwin")
    export IS_MACOS=true
    ;;
esac

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
