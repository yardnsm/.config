# vim: set foldmethod=marker foldlevel=0:

export PATH=/usr/local/opt/fzf/bin:$PATH

# fzf options
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# Autocompletion {{{

[[ $- == *i* ]] \
  && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# }}}
# Key bindings {{{

[[ -f "/usr/local/opt/fzf/shell/key-bindings.zsh" ]] && \
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"

# }}}
