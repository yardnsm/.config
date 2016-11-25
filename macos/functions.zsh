# --------------------------------------- #
# | ZSH functions for OSX
# --------------------------------------- #

# Unmount all external drives
function unmount_all {
  diskutil list |
  grep external |
  cut -d ' ' -f 1 |
  while read file; do
      diskutil unmountDisk "$file"
  done
}
