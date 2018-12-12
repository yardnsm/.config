#!/usr/bin/env bash

# ---------------------------------------------

declare -r formulae=(
  'node'
  'yarn --without-node'
  'rbenv'
  'git'
  'zsh'
  'mongo'
  'phantomjs'
  'neovim/neovim/neovim'
  'tmux'
  'reattach-to-user-namespace'
  'mysql'
  'python'
  'python3'
  'pyenv'
  'pyenv-pip-migrate'
  'pyenv-virtualenv'
  'shellcheck'
  'sudolikeaboss'
  'coreutils'
  'gpg'
  'ansible'
  'maven'

  'wget'
  'tig'
  'fzf'
  'openssl'
  'heroku'
  'hub'
  'git-extras'
  'httpie'
  'jq'
  'diff-so-fancy'
  'imagemagick'
  'the_silver_searcher'
  'ripgrep'
  'watchman'
  'readline'

  'asciinema'
  'm-cli'
  'screenfetch'
  'htop'
  'cowsay'
  'figlet'
  'tree'
  'youtube-dl'

  'libxml2'
  'mhash'
  'mcrypt'
)

# ---------------------------------------------

main () {
  for formula in "${formulae[@]}"; do
    brew_install "$formula"
  done
}

main "$@"
