# vim: set foldmethod=marker foldlevel=0:

# XDG directories {{{

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export XDG_RUNTIME_DIR="/tmp/run"
[[ -d "$XDG_RUNTIME_DIR" ]] || mkdir -m 0700 -p "$XDG_RUNTIME_DIR"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export PHPBREW_HOME="$XDG_CONFIG_HOME/phpbrew"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

export GEM_HOME="$XDG_DATA_HOME/gem"
export FNM_DIR="$XDG_DATA_HOME/fnm"
export HISTFILE="$XDG_DATA_HOME/zsh/history"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
export PHPBREW_ROOT="$XDG_DATA_HOME/phpbrew"
export RBENV_ROOT="$XDG_DATA_HOME/rbenv"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME/docker-machine"
export _Z_DATA="$XDG_DATA_HOME/z/.z"

export GEM_SPEC_CACHE="$XDG_CACHE_HOME/gem"
export LESSHISTFILE="$XDG_CACHE_HOME/less_history"
export PYWAL_HOME="$XDG_CACHE_HOME/wal"

# Create dirs
[[ -d "$(dirname $LESSHISTFILE)" ]] || mkdir -p "$(dirname $LESSHISTFILE)"
[[ -d "$(dirname $_Z_DATA)" ]] || mkdir -p "$(dirname $_Z_DATA)"

# }}}

# Common locations {{{

export DOTFILES=$HOME/dotfiles
export DOTFILES_LOCAL=$HOME/dotfiles-local
export SUBMODULES=$DOTFILES/.submodules

export KNOWLEDGE=$HOME/knowledge
export DRAFTS_HOME=$KNOWLEDGE/drafts
export DEFAULT_WALLPAPER=$HOME/wallpaper.jpg

# }}}
# Default programs {{{

export EDITOR="nvim"
export TERMINAL="termite"
export BROWSER="google-chrome-stable"
export FILE="ranger"

# }}}
# OS Variables {{{

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

case "$(uname -s)" in
  "Linux")
    export IS_LINUX=true
    ;;
  "Darwin")
    export IS_MACOS=true
    ;;
esac

# }}}
