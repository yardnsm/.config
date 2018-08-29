# -----------------------------------------------------------------------------
# Autocompletion

[[ $- == *i* ]] \
  && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# -----------------------------------------------------------------------------
# Key bindings

[[ -f "/usr/local/opt/fzf/shell/key-bindings.zsh" ]] && \
  source "/usr/local/opt/fzf/shell/key-bindings.zsh"
