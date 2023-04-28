-- This theme was ported from https://github.com/NvChad/base46

-- Credits to original https://github.com/sainnhe/everforest
-- This is modified version of it

local M = {}

M.base_30 = {
  white = "#272f35",
  darker_black = "#f5efde",
  black = "#fff9e8", --  nvim bg
  black2 = "#F0EAD9",
  one_bg = "#E0DAC9",
  one_bg2 = "#D1CBBA",
  one_bg3 = "#C2BCAB",
  grey = "#B3AD9C",
  grey_fg = "#A39D8C",
  grey_fg2 = "#948E7D",
  light_grey = "#857F6E",
  red = "#c85552",
  baby_pink = "#ce8196",
  pink = "#ef6590",
  line = "#e8e2d1", -- for lines like vertsplit
  green = "#5da111",
  vibrant_green = "#87a060",
  nord_blue = "#656c5f",
  blue = "#3a94c5",
  yellow = "#dfa000",
  sun = "#d1b171",
  purple = "#b67996",
  dark_purple = "#966986",
  teal = "#69a59d",
  orange = "#F7954F",
  cyan = "#89bfdc",
  statusline_bg = "#ede7d6",
  lightbg = "#d3cdbc",
  pmenu_bg = "#5f9b93",
  folder_bg = "#747b6e",
}

M.base_16 = {
  base00 = "#fff9e8",
  base01 = "#f6f0df",
  base02 = "#ede7d6",
  base03 = "#e5dfce",
  base04 = "#ddd7c6",
  base05 = "#495157",
  base06 = "#3b4349",
  base07 = "#272f35",
  base08 = "#5f9b93",
  base09 = "#b67996",
  base0A = "#8da101",
  base0B = "#d59600",
  base0C = "#ef615e",
  base0D = "#87a060",
  base0E = "#c85552",
  base0F = "#c85552",
}

M.polish_hl = {
  DiffAdd = { fg = M.base_30.green },
  WhichKeyDesc = { fg = M.base_30.white },
  WhichKey = { fg = M.base_30.white },
  NvimTreeFolderName = { fg = "#4e565c" },
  TbLineThemeToggleBtn = { bg = M.base_30.one_bg },
  Pmenu = { bg = M.base_30.black2 },
  IndentBlanklineContextStart = { bg = M.base_30.black2 },
  St_pos_text = { fg = M.base_30.white },
  ["@tag"] = { fg = M.base_30.orange },
  ["@field"] = { fg = M.base_16.base05 },
  ["@include"] = { fg = M.base_16.base08 },
  ["@constructor"] = { fg = M.base_30.blue },
}

M.type = "light"

vim.g.colors_name = 'base46-everforest_light'

local colors = vim.tbl_extend("force", {}, M.base_30, M.base_16)

local status_ok, base16 = pcall(require, "base16-colorscheme")
if status_ok then
  base16.setup(colors)
end
