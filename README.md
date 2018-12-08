# dotfiles

[![Build Status](https://travis-ci.org/yardnsm/dotfiles.svg?branch=master)](https://travis-ci.org/yardnsm/dotfiles)

These are my dotfiles. A collection of zsh, git, vim and macOS configurations. I built this repo
from scratch, while focus on organization.

## Installation

The installation currently supports macOS and linux distros that ships with `apt-get` (targeted for
ubuntu and debian).

Simply run the following command in your terminal:

```console
$ bash <(curl -LsS https://raw.github.com/yardnsm/dotfiles/master/_setup/bootstrap/main.sh)
```

### Installation executable

The installation script ([`./install.sh`](install.sh)) will manage every topic's installation. You
can pass some options to exclude certain topics from installation, or set specific topics to
install.

```console
$ ./install.sh --help

  Installs the dotfiles

  Usage

    ./install.sh [options] [...topics]

  Options

    -y, --yes               Skip confirmation questions
    -e, --exclude           Exclude [...topics] from installation
    -l, --install-local     Run the local installation script
    -h, --help              Show help output

  Examples

    ./install.sh common git
    ./install.sh --exclude npm homebrew
```

### `dots`

[`dots`](bin/dots) is an executable for managing the dotfiles. It can be used to run the
installation script, list available topics, run a specific topic and update the dotfiles repository.

```console
$ dots

  Dotfiles maintenance

  Usage

    dots <command> [options]

  Commands

    run [topic]     Run the installation file of [topic]
    install         Run the installation script
    list            List all topics

  Options

    -a, --all               Show all topics in 'list'
    -h, --help              Show help output

  Options are being passed to the install script
  when running 'install' command.
```

## Order and hierarchy

- Directories starting with `_` are related to the repo itself (install files, utils,
  submodules...).
- Every other directory is a topic directory, which may contain symlinks/shell scripts relevant to
  the topic.
- Symbolic links created at `$HOME` ([`./common/install.sh`](./common/install.sh)).
- `.zsh` files will be sourced when the shell loads.

## Local dotfiles

The installation script will look for a directory located at `~/dotfiles-local`. It'll run the local
installation file if available (`~/dotfiles-local/install.sh`).

In addition, available `.zsh` files in the local dotfiles directory will be sourced when the shell
loads. Additional git configuration can be can be placed in `~/.gitconfig.local`

## License

MIT © [Yarden Sod-Moriah](http://yardnsm.net/)
