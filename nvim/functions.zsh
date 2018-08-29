# Counts how many plugins you have.
# Goal is 0.
function vim-plugins() {
  local -r plugins="$(cat ~/dotfiles/nvim/nvim.conf/init.vim | grep "Plug '")"

  echo $plugins
  echo "---------------"
  echo "Total: $(wc -l <<< $plugins)"
}
