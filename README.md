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

## Order and hierarchy

- Directories starting with `_` are related to the repo itself (install files, utils, submodules...).
- Every other directory is a topic directory, which may contain symlinks/shell scripts relevant to
  the topic.

## License

MIT © [Yarden Sod-Moriah](http://yardnsm.net/)
