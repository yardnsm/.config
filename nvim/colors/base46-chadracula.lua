vim.g.colors_name = 'base46-chadracula'

local colors = {
  white = "#F8F8F2",
  darker_black = "#222430",
  black = "#282A36", --  nvim bg
  black2 = "#2d303e",
  one_bg = "#373844", -- real bg of onedark
  one_bg2 = "#44475a",
  one_bg3 = "#565761",
  grey = "#5e5f69",
  grey_fg = "#666771",
  grey_fg2 = "#6e6f79",
  light_grey = "#73747e",
  red = "#ff7070",
  baby_pink = "#ff86d3",
  pink = "#FF79C6",
  line = "#3c3d49", -- for lines like vertsplit
  green = "#50fa7b",
  vibrant_green = "#5dff88",
  nord_blue = "#8b9bcd",
  blue = "#a1b1e3",
  yellow = "#F1FA8C",
  sun = "#FFFFA5",
  purple = "#BD93F9",
  dark_purple = "#BD93F9",
  teal = "#92a2d4",
  orange = "#FFB86C",
  cyan = "#8BE9FD",
  statusline_bg = "#2d2f3b",
  lightbg = "#41434f",
  pmenu_bg = "#b389ef",
  folder_bg = "#BD93F9",

  base00 = "#282936",
  base01 = "#3a3c4e",
  base02 = "#4d4f68",
  base03 = "#626483",
  base04 = "#62d6e8",
  base05 = "#e9e9f4",
  base06 = "#f1f2f8",
  base07 = "#f7f7fb",
  base08 = "#c197fd",
  base09 = "#FFB86C",
  base0A = "#62d6e8",
  base0B = "#F1FA8C",
  base0C = "#8BE9FD",
  base0D = "#50fa7b",
  base0E = "#ff86d3",
  base0F = "#F8F8F2",
}

local status_ok, base16 = pcall(require, "base16-colorscheme")
if status_ok then
  base16.setup(colors)
end
