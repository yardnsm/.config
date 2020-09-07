# vim: set foldmethod=marker foldlevel=0:

# Setting fpath {{{

fpath=(
  $ZDOTDIR/completions
  $ZDOTDIR/functions
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
autoload -U compinit \
  && compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

autoload -U edit-command-line

# }}}

# pywal setup {{{

if [[ -d "$PYWAL_HOME" ]]; then
  (cat "$PYWAL_HOME/sequences" &)
fi

# }}}
# Antibody setup {{{

# Init antibody
source <(antibody init)

antibody bundle <<EOBUNDLES
  rupa/z
  zsh-users/zsh-completions
  supercrabtree/k
EOBUNDLES

# Plugins to use when *not* inside an ssh session
if [[ -z $SSH_CONNECTION ]]; then
  antibody bundle <<EOBUNDLES
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-autosuggestions
EOBUNDLES
fi

# }}}
# fnm setup {{{

eval "$(fnm env --multi --fnm-dir "$FNM_DIR")"

_fnm_autoload_hook() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    echo "fnm: Found .nvmrc"
    fnm use
  fi
}

add-zsh-hook chpwd _fnm_autoload_hook \
  && _fnm_autoload_hook

# }}}
# fzf setup {{{

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Autocompletion
[[ $- == *i* ]] \
  && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
[[ -f "/usr/local/opt/fzf/shell/key-bindings.zsh" ]] && \
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# }}}
# tmux setup {{{

# Change window name to the current git dir
_tmux_update_window_name() {
  [[ -z $TMUX ]] && return;

  if git rev-parse 2> /dev/null; then
    tmux rename-window "$(basename `git rev-parse --show-toplevel`)"
  else
    tmux setw automatic-rename
  fi
}

add-zsh-hook chpwd _tmux_update_window_name \
  && _tmux_update_window_name

# }}}

# Lazy load commands {{{

# Lazy load phpbrew
if command -v "phpbrew" &> /dev/null; then
  function phpbrew() {
    unset phpbrew

    source $PHPBREW_HOME/bashrc
    phpbrew $@
  }
fi

# Lazy load pyenv
if command -v "pyenv" &> /dev/null; then
  function pyenv() {
    unset pyenv

    eval "$(command pyenv init -)"
    pyenv $@
  }
fi

# Lazy load rbenv
if command -v "rbenv" &> /dev/null; then
  function rbenv() {
    unset rbenv

    eval "$(command rbenv init -)"
    rbenv $@
  }
fi

# }}}
