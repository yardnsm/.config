# YardNsm's Dotfiles
Whoo-Hoo! Can't believe I finished it..

Hi, this is my dotfiles. A collection of zsh, git and OSX configurations. I built this repo from scratch, while focus on organization.

![the final product](https://raw.githubusercontent.com/YardNsm/dotfiles/master/_misc/media/terminal.png)

## Installation
**THIS DOTFILES REPO IS ONLY COMPATIBLE WITH MAC OSX AT THE MOMENT**

First, make sure that you have Xcode Command Line Tools installed:

```
xcode-select --install
```

Then, clone the dotfiles repository. You can clone it anywhere: the symbolic links will be created in your home directory (~/).
After that, run the `install` script.

**Before** you run the script, I strongly recommend to check what it does. Make sure to check the setup files (located in `_setup`).

```
# Clone this repo
git clone https://github.com/yardnsm/dotfiles.git ~/dotfiles

# Run the installer!
cd ~/dotfiles
./install.sh
```

Follow the instruction on the screen, and you are good to go.

![installer](https://raw.githubusercontent.com/YardNsm/dotfiles/master/_misc/media/install.png)

## Structure
__(Coming Soon)__

## Symlinking and copying processes
__(Coming Soon)__

## ZSH Setup and the prompt
__(Coming Soon)__

## OSX Setup
__(Coming Soon)__

## TO-DO:
- [ ] Improve README, update pictures
- [ ] Add an update task (software updates for mac, homebrew)
- [ ] Add indicator for background processes in the prompt
- [ ] Add a log creation?
- [ ] Add RSA key creation
- [ ] Add IntelliJ IDEA setting in misc folder
- [ ] Change to another base16 theme?
- [ ] Add an option to turn off auto updates from appstore
- [ ] add applications
- [ ] add applications settings
- [ ] Review osx settings
- [ ] Review applications settings
- [ ] Add a sync script inside 'bin'
- [ ] Add an update script inside 'bin'
- [ ] Add a backup script inside 'bin'?
- [ ] Create a 'dotfiles' utility with menu to choose between tasks
- [ ] Add support for ubuntu (do ton of refactor before)
- [ ] Achieve 42,956 commits. Add support to windows after that? nah.
