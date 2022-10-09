local M = {}

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

return M
