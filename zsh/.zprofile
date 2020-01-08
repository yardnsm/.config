# vim: set foldmethod=marker foldlevel=0:

# Core Variables {{{

export DOTFILES=$HOME/dotfiles
export DOTFILES_LOCAL=$HOME/dotfiles-local
export ZSH=$DOTFILES/zsh
export SUBMODULES=$DOTFILES/.submodules

# Common paths
export KNOWLEDGE=$HOME/knowledge
export DRAFTS_HOME=$KNOWLEDGE/drafts

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# }}}
# Default programs {{{

export EDITOR="nvim"
export TERMINAL="termite"
export BROWSER="google-chrome-stable"
export FILE="ranger"

# }}}
# OS Variables {{{
case "$(uname -s)" in
  "Linux")
    export IS_LINUX=true
    ;;
  "Darwin")
    export IS_MACOS=true
    ;;
esac

# }}}
# Path setup {{{

export PATH=$DOTFILES/bin:$PATH
export PATH=/usr/sbin:$PATH

# }}}
