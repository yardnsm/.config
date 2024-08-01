-- This is a utility that helps extend base46-based highlight groups, using the plugin's very nice
-- metatable.
--
-- Depends on the yardnsm/nvim-base46 plugin

local augroup = vim.api.nvim_create_augroup("base46_handlers", { clear = true })

---@class Base46HandlerConfig
local defaults = {

  ---@type boolean set as an autocmd for colorscheme changes
  autocmd = true,

  ---@type boolean should the handler also be run now
  force = true,

  ---@type string | string[] pattern to match the colorscheme name
  pattern = "base46-*",
}

local M = {}

---@param handler base46.Handler
M.run_handler = function(handler)
  local status_ok, base46 = pcall(require, "nvim-base46")
  if not status_ok then
    return
  end

  local c = base46.colors
  local hi = base46.highlight

  handler(c, hi)
end

---@param handler base46.Handler
---@param opts? Base46HandlerConfig
M.attach_handler = function(handler, opts)
  opts = vim.tbl_deep_extend("force", {}, defaults, opts or {})

  local pattern = opts.pattern

  if opts.force and vim.g.colors_name then
    if type(pattern) == "string" then
      pattern = { pattern }
    end

    local should_run_handler = false
    for _, pat in ipairs(pattern) do
      if vim.g.colors_name:match(vim.fn.glob2regpat(pat)) then
        should_run_handler = true
        break
      end
    end

    if should_run_handler then
      M.run_handler(handler)
    end
  end

  if opts.autocmd then
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = pattern,
      group = augroup,
      callback = function()
        M.run_handler(handler)
      end,
    })
  end
end

return M
