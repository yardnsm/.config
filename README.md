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
    ./install.sh [options]

  Options
    -y, --yes               Skip confirmation questions
    -o, --only              Topics to install only
    -e, --exclude           Topics so exclude
    --install-local         Run the local installation script
    --no-topics-file        Do not use topics file
    -h, --help              Show help output

  Examples
    ./install.sh --exclude npm homebrew
    ./install.sh --only common git
```

The script will look for a `.topics` file, where you can specify topics to install or exclude from
the installation. For example:

```
brew
nvim

# You can exclude topic using `!`
!npm
```

### `dotsetup`

[`dotsetup`](bin/dotsetup) is a script that used to manage the dotfiles. It can be used to run the
installation script, list available topics, run a specific topic and update the dotfiles repository.

```console
$ dotsetup

  Dotfiles maintenance

  Usage
    dotsetup <command> [options]

  Commands
    run [topic]             Run [topic] installation file
    install                 Run the install script
    install-local           Run the local dotfiles installation script
    list                    List tasks
    update                  Fetch the latest version

  Options
    -h, --help              Show help output

  Options are being passed to the install script
  when running 'install' command.
```

## Order and hierarchy

- Directories starting with `_` are related to the repo itself (install files, utils, submodules...).
- Every other directory is a topic directory, which may contain symlinks/shell scripts relevant to
  the topic.
- Symbolic links will be created in `$HOME` for files with the `.symlink` extension.
- `.zsh` files will be sourced when the shell loads.

## Local dotfiles

The installation script will look for a directory located at `~/dotfiles-local`. It'll create the
appropriate symlinks (for files ending with `.symlink`) and will run the local installation file
if available (`~/dotfiles-local/install.sh`).

In addition, available `.zsh` files in the local dotfiles directory will be sourced when the shell
loads. Additional git configuration can be can be placed in `~/.gitconfig.local`

## License

MIT © [Yarden Sod-Moriah](http://yardnsm.net/)
