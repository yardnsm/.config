-- This theme was ported from https://github.com/NvChad/base46

-- Credits to original theme https://github.com/arcticicestudio/nord-vim
-- This is modified version of it

local M = {}

M.base_30 = {
  white = "#e4e0d7",
  darker_black = "#1b1b1b",
  black = "#222222",
  black2 = "#292929",
  one_bg = "#333333",
  one_bg2 = "#3a3a3a",
  one_bg3 = "#414141",
  grey = "#4b4b4b",
  grey_fg = "#535353",
  grey_fg2 = "#5a5a5a",
  light_grey = "#646464",
  red = "#FF8F7E",
  baby_pink = "#f58eff",
  pink = "#e780f8",
  line = "#353535",
  green = "#AEE474",
  vibrant_green = "#95e454",
  nord_blue = "#8dbdfb",
  blue = "#88B8F6",
  yellow = "#efdeab",
  sun = "#feedba",
  purple = "#dc8cff",
  dark_purple = "#c878f0",
  teal = "#7EB6BC",
  orange = "#FFCC66",
  cyan = "#90fdf8",
  statusline_bg = "#262626",
  lightbg = "#3c3c3c",
  pmenu_bg = "#95e454",
  folder_bg = "#7BB0C9",
}

M.base_16 = {
  base00 = "#202020",
  base01 = "#303030",
  base02 = "#373737",
  base03 = "#3e3e3e",
  base04 = "#484848",
  base05 = "#d6d2c9",
  base06 = "#ddd9d0",
  base07 = "#e4e0d7",
  base08 = "#FFCC66",
  base09 = "#dc8cff",
  base0A = "#efdeab",
  base0B = "#AEE474",
  base0C = "#7EB6BC",
  base0D = "#88B8F6",
  base0E = "#FF8F7E",
  base0F = "#dc8c64",
}

M.polish_hl = {
  ["@punctuation.bracket"] = { fg = M.base_30.sun },
}

M.type = "dark"

vim.g.colors_name = 'base46-wombat'

local colors = vim.tbl_extend("force", {}, M.base_30, M.base_16)

local status_ok, base16 = pcall(require, "base16-colorscheme")
if status_ok then
  base16.setup(colors)
end
