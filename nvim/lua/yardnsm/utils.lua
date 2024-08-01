local M = {}

---Consistent float borders
---@type "none" | "single" | "double" | "rounded"
M.float_borders_style = "rounded"

-- This is like the LazyFile event in LazyVim
M.LazyFile = { "BufReadPost", "BufWritePost", "BufNewFile" }

M.log = function(msg)
  vim.api.nvim_echo({ { msg, "Normal" } }, true, {})
end

M.log_warning = function(msg)
  vim.api.nvim_echo({ { msg, "WarningMsg" } }, true, {})
end

M.qf_populate = function(lines, mode)
  vim.fn.setqflist(lines, mode)

  vim.cmd([[
    belowright copen
    wincmd p
  ]])
end

M.has_value = function(tab, val)
  for _, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

M.merge = function(...)
  return vim.tbl_extend("force", {}, ...)
end

M.hook = function(tbl, fn, impl)
  local old_fn = tbl[fn]
  tbl[fn] = function(...)
    return impl(old_fn, ...)
  end
end

M.starts_with = function(str, start)
  return str:sub(1, #start) == start
end

M.ends_with = function(str, ending)
  return ending == "" or str:sub(- #ending) == ending
end

return M
