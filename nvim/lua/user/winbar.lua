local statusline = require('user.statusline')

local M = {}

local winbar_augroup = vim.api.nvim_create_augroup("Winbar", { clear = true })

local winbar_filetype_exclude = {
  "help",
  "netrw",
  "nerdtree",
  "TelescopePrompt",
}

local should_render = function()
  if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
    return false
  end

  return true
end

M.render = function(mode, bufnr)
  local fg_hl = mode == 'active' and 'WinbarFgActive' or 'WinbarFgInactive'
  local bg_hl = mode == 'active' and 'WinbarBgActive' or 'WinbarBgInactive'

  local icon, hl_group = statusline.get_devicon_for_buffer(bufnr)

  local result = ''

  result = result .. '%#' .. fg_hl .. '# '
  result = result .. '%#' .. hl_group .. '# ' .. icon .. '  '
  result = result .. '%#' .. fg_hl .. '#%f %m'

  return result
end

M.set_winbar_option = function (mode, bufnr)
  vim.api.nvim_set_option_value(
    "winbar",
    [[%!luaeval('require("user.winbar").render("]] .. mode .. [[", ]] .. (bufnr or 'nil') .. [[)')]],
    { scope = "local" }
  )
end

M.setup = function()
  M.set_winbar_option('active')

  vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "FocusGained", "FileType" }, {
    pattern = "*",
    group = winbar_augroup,
    callback = function(data)
      if should_render() then
        M.set_winbar_option('active', data.buf)
      end
    end,
  })

  vim.api.nvim_create_autocmd({ "WinLeave", "FocusLost" }, {
    pattern = "*",
    group = winbar_augroup,
    callback = function(data)
      if should_render() then
        M.set_winbar_option('inactive', data.buf)
      end
    end,
  })
end

return M
