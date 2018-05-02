#!/usr/bin/env bash

# ---------------------------------------------

declare -r formulae=(
  'node'
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

  'asciinema'
  'm-cli'
  'screenfetch'
  'htop'
  'cowsay'
  'figlet'
  'tree'
  'youtube-dl'

  'readline'
)

for formula in "${formulae[@]}"; do
  brew_install "$formula"
done

# Formulae with arguments
brew_install 'yarn' '' '--without-node'
