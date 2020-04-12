# Alises
alias cask='brew cask'

# Homebrew env stuff
if [[ -n $IS_MACOS ]]; then

  # Homebrew path
  export PATH=/usr/local/sbin:/usr/local/opt/coreutils/libexec/gnubin:$PATH
fi
