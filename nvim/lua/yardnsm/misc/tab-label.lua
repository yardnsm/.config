local M = {}

local VARIABLE_NAME = "tab_label"

local redraw_tabline = function()
  vim.cmd([[redrawtabline]])
end

local init_commands = function()
  vim.api.nvim_create_user_command("TabLabel", function(cmd)
    local tabnr = vim.api.nvim_get_current_tabpage()
    local label = cmd.args

    if label == "" then
      print(M.get_label_for_tab(tabnr))
    else
      M.set_label_for_tab(tabnr, label)
    end

    redraw_tabline()
  end, { nargs = "?" })

  vim.api.nvim_create_user_command("TabLabelClear", function()
    local tabnr = vim.api.nvim_get_current_tabpage()
    M.clear_label_for_tab(tabnr)

    redraw_tabline()
  end, {})
end

M.get_label_for_tab = function(tabnr)
  local status_ok, label = pcall(vim.api.nvim_tabpage_get_var, tabnr, VARIABLE_NAME)
  return status_ok and label or nil
end

M.set_label_for_tab = function(tabnr, label)
  if tabnr == nil then
    tabnr = vim.api.nvim_get_current_tabpage()
  end

  vim.api.nvim_tabpage_set_var(tabnr, VARIABLE_NAME, label)
end

M.clear_label_for_tab = function(tabnr)
  M.set_label_for_tab(tabnr, nil)
end

M.setup = function()
  init_commands()
end

return M
