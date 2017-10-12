# Init antibody
if [[ "$(uname -s)" == "Darwin" ]]; then
  source <(antibody init)

  antibody bundle <<EOBUNDLES
    lukechilds/zsh-nvm
    rupa/z
    zsh-users/zsh-syntax-highlighting
    zsh-users/zsh-completions
    zsh-users/zsh-autosuggestions
    denysdovhan/gitio-zsh
    chrissicool/zsh-256color
    robbyrussell/oh-my-zsh
    supercrabtree/k
EOBUNDLES
fi
