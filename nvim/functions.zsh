function vim-pluging() {
  local -r plugins="$(cat ~/dotfiles/nvim/nvim.conf/init.vim | grep "Plug '")"

  echo $plugins
  echo "---------------"
  echo "Total: $(wc -l <<< $plugins)"
}
