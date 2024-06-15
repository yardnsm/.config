local line_manager_au = vim.api.nvim_create_augroup("LineManager", { clear = true })

---@class LineManager
local LineManager = {}

---@type table<string, Line>
LineManager.lines = {}

LineManager.attached = false
LineManager.focused = true

LineManager.setup = function()
  if LineManager.attached then
    return
  end

  vim.api.nvim_set_option_value(
    "statusline",
    [[%!luaeval('require("yardnsm.ui.line.manager").render("statusline")')]],
    { scope = "global" }
  )

  vim.api.nvim_set_option_value(
    "winbar",
    [[%!luaeval('require("yardnsm.ui.line.manager").render("winbar")')]],
    { scope = "global" }
  )

  vim.api.nvim_set_option_value(
    "tabline",
    [[%!luaeval('require("yardnsm.ui.line.manager").render("tabline")')]],
    { scope = "global" }
  )

  vim.api.nvim_create_autocmd("FocusGained", {
    pattern = "*",
    group = line_manager_au,
    callback = function()
      LineManager.focused = true
    end,
  })

  vim.api.nvim_create_autocmd("FocusLost", {
    pattern = "*",
    group = line_manager_au,
    callback = function()
      LineManager.focused = false
    end,
  })

  vim.api.nvim_create_autocmd({ "WinLeave", "FocusLost", "BufWinEnter", "WinEnter", "FocusGained", "FileType" }, {
    pattern = "*",
    group = line_manager_au,
    callback = function()
      vim.cmd("redrawstatus!")
    end,
  })
end

LineManager.add = function(option, line)
  LineManager.lines[option] = line
end

LineManager.render = function(option)
  local line = LineManager.lines[option]
  if line == nil then
    return
  end

  return line:render()
end

return LineManager
