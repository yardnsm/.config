#!/usr/bin/env bash

main() {
  for theme in ~/dev/sandbox/base46/lua/base46/themes/*.lua; do
    theme_contents="$(cat "$theme")"

    theme_name="$(basename "$theme")"
    theme_name=${theme_name%.lua}

    theme_dest="base46-$theme_name.lua"

    cat <<EOF > "$theme_dest"
-- This theme was ported from https://github.com/NvChad/base46

$theme_contents

vim.g.colors_name = 'base46-$theme_name'

local colors = vim.tbl_extend("force", {}, M.base_30, M.base_16)

local status_ok, base16 = pcall(require, "base16-colorscheme")
if status_ok then
  base16.setup(colors)
end
EOF

echo "Written $theme_dest"
  done
}

main "$@"
