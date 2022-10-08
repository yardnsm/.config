local statusline = require("user.statusline")

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

  return vim.bo.bufhidden ~= "wipe" and vim.bo.buflisted
end

local get_navic = function()
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    return ""
  end

  if not navic.is_available() then
    return ""
  end

  return "%{%v:lua.require'nvim-navic'.get_location()%}"
end

M.render = function(mode, bufnr)
  local fg_hl = mode == "active" and "WinbarFgActive" or "WinbarFgInactive"

  local icon, hl_group = statusline.get_devicon_for_buffer(bufnr)

  local expand_file = bufnr ~= nil and ("#" .. bufnr) or "%"
  local filename = vim.fn.expand(expand_file .. ":t")

  if filename == "" then
    filename = "[No Name]"
  end

  -- Special case for Quickfix
  if vim.api.nvim_buf_get_option(bufnr and bufnr or 0, "filetype") == "qf" then
    filename = "%q"
    icon = ""
  end

  local result = ""

  -- if mode == "active" then
  --   result = result .. "%#" .. hl_group .. "#▎"
  -- else
  --   result = result .. "%#WinbarFgActive# "
  -- end

  result = result .. "%#" .. fg_hl .. "#"
  result = result .. "%#" .. (mode == "active" and hl_group or fg_hl) .. "# " .. icon .. "  "
  result = result .. "%#" .. fg_hl .. "#" .. filename .. " %m "

  if mode == "active" then
    result = result .. "%#WinbarFgInactive#" .. get_navic()
  end

  return result
end

M.set_winbar_option = function(mode, bufnr)
  if should_render() then
    pcall(
      vim.api.nvim_set_option_value,
      "winbar",
      [[%!luaeval('require("user.winbar").render("]] .. mode .. [[", ]] .. (bufnr or "nil") .. [[)')]],
      { scope = "local" }
    )
  else
    vim.opt_local.winbar = nil
  end
end

M.setup = function()
  M.set_winbar_option("active")

  vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "FocusGained", "FileType" }, {
    pattern = "*",
    group = winbar_augroup,
    callback = function(data)
      M.set_winbar_option("active", data.buf)
    end,
  })

  vim.api.nvim_create_autocmd({ "WinLeave", "FocusLost" }, {
    pattern = "*",
    group = winbar_augroup,
    callback = function(data)
      M.set_winbar_option("inactive", data.buf)
    end,
  })
end

return M