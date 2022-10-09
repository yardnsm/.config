vim.g.colors_name = "base46-classic-dark"

local colors = {
  white = "#d4d4d5",
  darker_black = "#101010",
  black = "#151515", --  nvim bg
  black2 = "#1b1b1b",
  one_bg = "#212428",
  one_bg2 = "#292c30",
  one_bg3 = "#33363a",
  grey = "#3e4145",
  grey_fg = "#45484c",
  grey_fg2 = "#4a4d51",
  light_grey = "#75b5aa",
  red = "#ac4142",
  baby_pink = "#ff8e8e",
  pink = "#ffa7a7",
  line = "#30303a", -- for lines like vertsplit
  green = "#90a959",
  vibrant_green = "#79dcaa",
  blue = "#7ab0df",
  nord_blue = "#87bdec",
  yellow = "#d28445",
  sun = "#ffeda6",
  purple = "#c397d8",
  dark_purple = "#b68acb",
  teal = "#63b3ad",
  orange = "#f0a988",
  cyan = "#50cad2",
  statusline_bg = "#1b1b1b",
  lightbg = "#303030",
  pmenu_bg = "#3bdda2",
  folder_bg = "#5fb0fc",

  base00 = "#151515",
  base01 = "#202020",
  base02 = "#303030",
  base03 = "#505050",
  base04 = "#b0b0b0",
  base05 = "#d0d0d0",
  base06 = "#e0e0e0",
  base07 = "#f5f5f5",
  base08 = "#ac4142",
  base09 = "#d28445",
  base0A = "#f4bf75",
  base0B = "#90a959",
  base0C = "#75b5aa",
  base0D = "#6a9fb5",
  base0E = "#aa759f",
  base0F = "#8f5536",
}

local status_ok, base16 = pcall(require, "base16-colorscheme")
if status_ok then
  base16.setup(colors)
end
