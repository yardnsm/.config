# vim: set foldmethod=marker foldlevel=0:

# ---[ Base ]---------------------------------------------------------------------------------------

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

# XDG directories {{{

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export XDG_RUNTIME_DIR="/tmp/run"

[[ -d "$XDG_RUNTIME_DIR" ]] \
  || mkdir -m 0700 -p "$XDG_RUNTIME_DIR"

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

# ---[ $PATH Setup ]--------------------------------------------------------------------------------

export PATH=$XDG_CONFIG_HOME/i3/bin:$PATH
export PATH=$XDG_CONFIG_HOME/bin:$PATH
export PATH=/usr/sbin:$PATH

if [[ -n $IS_MACOS ]]; then

  # Android SDK dir
  export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH

  # Homebrew path
  export PATH=/usr/local/sbin:/usr/local/opt/coreutils/libexec/gnubin:$PATH
fi

# ---[ Common locations ]---------------------------------------------------------------------------

# TODO: remove
export DOTFILES=$XDG_CONFIG_HOME
export DOTFILES_LOCAL=$HOME/dotfiles-local

export KNOWLEDGE_HOME=$HOME/knowledge
export DEV_HOME=$HOME/dev
export DRAFTS_HOME=$KNOWLEDGE_HOME/drafts
export DEFAULT_WALLPAPER=$HOME/wallpaper.jpg

# ---[ Default programs ]---------------------------------------------------------------------------

export EDITOR="nvim"
export FILE="ranger"

if [[ -n $IS_LINUX ]]; then
  export TERMINAL="termite"
  export BROWSER="google-chrome-stable"
fi

# ---[ Program-specific settings ]------------------------------------------------------------------

export GPG_TTY=$(tty)

# FZF
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS="--bind=ctrl-d:page-down,ctrl-u:page-up,ctrl-y:yank"

# JAVA home
if [[ -f "/usr/libexec/java_home" ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home)
fi

# pyenv default version
export PYENV_VERSION="3.7.7"

# rbenv version
export RBENV_VERSION="2.2.4"

# Tmux Spotify starrer (see ../tmux/playground/spotify_starrer.tmux)
export TMUX_SPOTIFY_API_KEY="{{ TMUX_SPOTIFY_API_KEY }}"
