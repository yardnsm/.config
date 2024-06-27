local base16_shell = require("yardnsm.misc.base16-shell")
local base46_utils = require("yardnsm.misc.base46-utils")

local M = {}

M.default_theme = "base46-yoru"

---@param c Base46Table
---@param hi HighlightsTable
local setup_highlights = function(c, hi)
  hi.St_Reset = 'StatusLine'
  hi.St_GitBranch = { guifg = c.grey_fg, guibg = c.statusline_bg }
  hi.St_FileName = { guifg = c.white, guibg = c.statusline_bg, gui = "bold" }
  hi.St_Text = { guifg = c.light_grey, guibg = c.statusline_bg }
  hi.St_LSP = { guifg = c.green, guibg = c.statusline_bg }
  hi.St_Filetype = { guifg = c.green, guibg = c.statusline_bg }
  hi.St_LineInfo = { guifg = c.white, guibg = c.one_bg }
  hi.St_LineInfoSecond = { guifg = c.white, guibg = c.one_bg3 }

  hi.St_VCSAdd = { guifg = c.green, guibg = c.statusline_bg }
  hi.St_VCSChange = { guifg = c.blue, guibg = c.statusline_bg }
  hi.St_VCSDelete = { guifg = c.red, guibg = c.statusline_bg }

  hi.St_IndicatorNeutral = { guifg = c.nord_blue, guibg = c.black, gui = "bold" }
  hi.St_IndicatorWarning = { guifg = c.yellow, guibg = c.black, gui = "bold" }
  hi.St_IndicatorError = { guifg = c.red, guibg = c.black, gui = "bold" }
  hi.St_IndicatorSuccess = { guifg = c.green, guibg = c.black, gui = "bold" }

  hi.Wb_TabActive = { guifg = c.white, gui = "bold" }
  hi.Wb_TabInactive = { guifg = c.grey_fg, guibg = "NONE" }
  hi.Wb_Fill = { guifg = c.grey_fg, guibg = c.darker_black }

  hi.Tb_Reset = { guifg = c.white, guibg = c.black }
  hi.Tb_TabActive = "TabLineSel"
  hi.Tb_TabInactive = { guifg = c.grey_fg, guibg = "NONE" }

  -- This is for the vim.highlight.on_yank in ./autocommands.lua
  hi.Yanked = { guifg = "NONE", guibg = c.one_bg3 }

  -- And some fixes
  hi.Visual = { guifg = "NONE", guibg = c.one_bg3 }
end

-- Make sure to call "setup" before loading the colorscheme. Preferably on the plugin's spec "init"
-- field.
M.setup = function()
  base46_utils.attach_handler("base46-*", setup_highlights)

  -- Set colorscheme
  vim.cmd("colorscheme " .. (base16_shell.get_shell_theme(false) or M.default_theme))

  -- Init base16-shell
  base16_shell.setup()
end

return M
