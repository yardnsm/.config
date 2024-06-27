local utils = require("yardnsm.utils")

local M = {}

---Config
---@type vim.diagnostic.Opts
local config = {

  -- Disable virtual text
  virtual_text = false,

  -- Show signs
  signs = {
    active = signs,
    priority = 90,

    text = {
      [vim.diagnostic.severity.ERROR] = "E",
      [vim.diagnostic.severity.WARN] = "W",
      [vim.diagnostic.severity.HINT] = "!",
      [vim.diagnostic.severity.INFO] = "I",
    },
  },

  update_in_insert = true,
  underline = true,
  severity_sort = true,

  float = {
    focusable = false,
    style = "minimal",
    border = utils.float_borders_style,
    source = "always",
    header = "",
    prefix = "",
  },
}

M.setup = function()
  vim.diagnostic.config(config)
end

return M
