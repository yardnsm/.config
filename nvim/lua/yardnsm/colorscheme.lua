local base16_shell = require("yardnsm.misc.base16-shell")
local base46_utils = require("yardnsm.misc.base46-utils")

local M = {}

M.default_theme = "base46-tomorrow_night"

---@type base46.Handler
local setup_highlights = function(c, hi)
  -- This is for the vim.highlight.on_yank in ./autocommands.lua
  hi.Yanked = { fg = "NONE", bg = c.one_bg3 }
end

-- Make sure to call "setup" before loading the colorscheme. Preferably on the plugin's spec "init"
-- field.
M.setup = function()
  base46_utils.attach_handler(setup_highlights)

  -- Set colorscheme
  vim.cmd("colorscheme " .. (base16_shell.get_shell_theme(false) or M.default_theme))

  -- Init base16-shell
  base16_shell.setup()
end

return M
