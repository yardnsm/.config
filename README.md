# .config

These are my dotfiles. A collection of zsh, git, vim and macOS configurations. I built this
repository completely from scratch, with the main focus of organization in mind.

This repository used to have **a lot** of installation and setup-related scripts, but I realized
this method of organization was probably a bit overkill and not so portable between machines. So,
currently, this repository contains my entire `~/.config` directory (well, not exactly the *entire*
directory, but most of it).

## Installation

The setup scripts moved to a new repository, located at
[yardnsm/.scripts](https://github.com/yardnsm/.scripts).

## Protecting Secrets

I'm using a method I've seen in [Rafi's
dotfiles](https://github.com/rafi/.config#protecting-secrets), which uses `.gitattributes` filters
to mask out sensitive data.

After cloning this repository, you should setup the custom filters (the installer at .scripts
already does this automatically):

```bash
git config --local filter.vault.clean "sed -f ~/.config/clean.sed"
git config --local filter.vault.smudge "sed -f ~/.config/smudge.sed"
```

And create the `smudge.sed`, then fill it up. The installer already does this, but you can also
convert the `clean.sed` file to a valid template:

```bash
sed 's/^.*\({{.*}}\).*$/s\/\1\/value\//' clean.sed > smudge.sed
```

Now, whenever you stage files, the `clean.sed` will prevent secrets being committed. And on
checkout, the `smudge.sed` will inject your secrets into their proper placeholders. **The
`smudge.sed` file is ignored from being committed.**

----------------------------------------------------------------------------------------------------

## License

MIT © [Yarden Sod-Moriah](http://yardnsm.net/)
