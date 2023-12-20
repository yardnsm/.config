-- This is a utility that helps extend base16-based highlight groups, using the plugin's very nice
-- metatable.
--
-- Depends on the RRethy/nvim-base16 plugin

local augroup = vim.api.nvim_create_augroup("Colorscheme", { clear = true })

local M = {}

M._defaults = {
  autocmd = true,
  force = true,
}

M.run_handler = function(handler)
  local status_ok, base16 = pcall(require, "base16-colorscheme")
  if not status_ok then
    return
  end

  local c = base16.colors
  local hi = base16.highlight

  handler(c, hi)
end

M.attach_handler = function(pattern, handler, opts)
  opts = vim.tbl_deep_extend("force", {}, M._defaults, opts or {})

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
