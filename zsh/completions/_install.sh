#compdef _install.sh install.sh

_install.sh() {
  [[ "$(pwd)" != "$DOTFILES" ]] \
    && [[ -z "$1" ]] \
    && return

  _arguments -C \
    '(-y --yes)'{-y,--yes}'[Skip confirmation questions]' \
    '(-e --exclude)'{-e,--exclude}'[Exclude topics from installation]' \
    '(-l --install-local)'{-l,--install-local}'[Run the local installation script]' \
    '(-h --help)'{-h,--help}'[Show help output]' \
    '*: :($(_get_runnable_topics))'
}

_get_runnable_topics() {
  find "$DOTFILES" \
    -mindepth 2 \
    -maxdepth 2 \
    -type f \
    -regex '.*/install\(.*\).sh' \
    -exec sh -c 'echo $(basename $(dirname {}))' \;
}

# ------------------------------------------------------------------------------
# vim:ft=zsh:
