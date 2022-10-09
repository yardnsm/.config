vim.g.colors_name = 'base46-onenord_light'

local colors = {
  white = "#2a303c",
  darker_black = "#ced4df",
  black = "#D8DEE9", --  nvim bg
  black2 = "#c9cfda",
  one_bg = "#c7cdd8", -- real bg of onedark
  one_bg2 = "#bdc3ce",
  one_bg3 = "#b3b9c4",
  grey = "#a9afba",
  grey_fg = "#9fa5b0",
  grey_fg2 = "#959ba6",
  light_grey = "#8b919c",
  red = "#a3454e",
  baby_pink = "#ae5059",
  pink = "#c56770",
  line = "#acb2bd", -- for lines like vertsplit
  green = "#75905e",
  vibrant_green = "#809b69",
  nord_blue = "#5b7b9b",
  blue = "#3f5f7f",
  yellow = "#c18401",
  sun = "#dea95f",
  purple = "#9c87c7",
  dark_purple = "#927dbd",
  teal = "#395979",
  orange = "#b46b54",
  cyan = "#6181a1",
  statusline_bg = "#ced4df",
  lightbg = "#bac0cb",
  pmenu_bg = "#7191b1",
  folder_bg = "#616773",

  base00 = "#D8DEE9",
  base01 = "#f4f4f4",
  base02 = "#e5e5e6",
  base03 = "#dfdfe0",
  base04 = "#d7d7d8",
  base05 = "#3e4450",
  base06 = "#272d39",
  base07 = "#2a303c",
  base08 = "#a3454e",
  base09 = "#b46b54",
  base0A = "#b88339",
  base0B = "#75905e",
  base0C = "#5b7b9b",
  base0D = "#3f5f7f",
  base0E = "#8d6786",
  base0F = "#a3454e",
}

local status_ok, base16 = pcall(require, "base16-colorscheme")
if status_ok then
  base16.setup(colors)
end
