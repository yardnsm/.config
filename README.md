# yardnsm's dotfiles
yep.

This is my dotfiles. A collection of zsh, git and OSX configurations. I built this repo from scratch, while focus on organization.

![](https://raw.githubusercontent.com/YardNsm/dotfiles/master/_misc/media/terminal.png)

## Installation
**THIS DOTFILES REPO IS ONLY COMPATIBLE WITH MAC OSX AT THE MOMENT**

First, make sure that you have Xcode Command Line Tools installed:

```
xcode-select --install
```

Did that? gr8. Now follow GitHub's instructions on how to [Generate an SSH key](https://help.github.com/articles/generating-an-ssh-key/).

Then, clone the dotfiles repository in `~/dotfiles`. The symbolic links will be created in your home directory (~/).
After that, run the installation script.

**Before** you run the script, I am strongly recommend to check what it does. Make sure to check the setup files (located in `_setup`).

```
# Clone this repo
git clone https://github.com/yardnsm/dotfiles.git ~/dotfiles

# Run the installer!
cd ~/dotfiles
./install.sh
```

It will take some time.

## Order and hierarchy
Everything in this repo is built around topical areas. Each 'topic' has its own directory. In each topic's directory there may be
a file called `main.sh`, which is used as an installer. There also may be sub-directories like `scripts` (some `.sh` scripts used for installing),
`shell` (some `.zsh` files like functions and aliases), `symlinks` (includes files to symlink to the home directory) and `copies` (guess whats in there).

## TO-DO:
- [ ] Improve README: update pictures, add a section about iTerm config, add `inspired by` section
- [ ] Add install for iTerm2
- [ ] Internet is slow. Add a script to automate rebooting of the router?
- [ ] add applications
- [ ] add applications settings
- [ ] Add a sync script
- [ ] Create a 'dotfiles' utility with menu to choose between tasks
- [ ] Add more file to 'bin'
- [ ] Achieve 42,956 commits. Add support to windows after that? nah.
