#compdef _install.sh install.sh

# This is probably the shittiest completion file you can find.
# --------------------------------------------------------------------------------------------------

# Hard-coded for now
_SETUP_ROOT="$HOME/dev/.setup"
_PROFILES_ROOT="$_SETUP_ROOT/.profiles"

_arg_topic=( '(-t --topic)'{-t,--topic}'[Run a single topic]':topic:'($(_get_topics))')
_arg_help=( '(-h --help)'{-h,--help}'[Show help output]' )
_arg_profile=( '*: :($(_get_profiles))' )

_install.sh() {
  [[ "$(pwd)" != "$_SETUP_ROOT" ]] \
    && [[ -z "$1" ]] \
    && return

  _arguments -C \
    $_arg_topic \
    $_arg_help \
    $_arg_profile
}

# --------------------------------------------------------------------------------------------------

_get_profiles() {
  find "$_PROFILES_ROOT" \
    -maxdepth 1 \
    -type f \
    ! -name '.*' \
    -exec basename {} \; \
    | sort
}

_get_topics() {
  find "$_SETUP_ROOT" \
    -maxdepth 1 \
    -type d \
    ! -name '.*' \
    -exec basename {} \; \
    | sort
}

# --------------------------------------------------------------------------------------------------
# vim:ft=zsh:
