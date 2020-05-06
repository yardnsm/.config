#!/usr/bin/env bash

# --------------------------------------------------------------------------------------------------

declare -r formulae=(
  'rbenv'
  'git'
  'zsh'
  'neovim'
  'tmux'

  'reattach-to-user-namespace'
  'shellcheck'
  'gpg'
  'ansible'
  'maven'

  'Schniz/tap/fnm'
  'node'
  'yarn'

  'python'
  'python3'
  'pyenv'
  'pyenv-pip-migrate'
  'pyenv-virtualenv'
  'poetry'

  'mongo'
  'mysql'

  'docker'
  'docker-machine'

  'wget'
  'tig'
  'fzf'
  'heroku'
  'httpie'
  'jq'
  'diff-so-fancy'
  'imagemagick'
  'the_silver_searcher'
  'ripgrep'
  'watchman'
  'readline'
  'syncthing'
  'asciinema'
  'm-cli'
  'neofetch'
  'htop'
  'cowsay'
  'figlet'
  'tree'
  'youtube-dl'
  'binwalk'

  'coreutils'
  'openssl'
  'libxml2'
  'mhash'
  'mcrypt'
  'ntfs-3g'

  # ------------------------------------------------------------------------------------------------
  # Retired
  # ------------------------------------------------------------------------------------------------

  # 'phantomjs'
  # 'sudolikeaboss'
  # 'hub'
  # 'git-extras'
)

# --------------------------------------------------------------------------------------------------

main () {
  for formula in "${formulae[@]}"; do
    brew::install "$formula"
  done
}

main "$@"
