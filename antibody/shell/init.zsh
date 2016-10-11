# --------------------------------------- #
# | Init
# --------------------------------------- #

# Init antibody
source <(antibody init)

# Init antibody plugins
antibody bundle <<EOBUNDLES
  rupa/z
  yardnsm/blox-zsh-theme
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-completions
  denysdovhan/gitio-zsh
  chrissicool/zsh-256color
  lukechilds/zsh-nvm
  robbyrussell/oh-my-zsh
  supercrabtree/k
EOBUNDLES
