-- vim: set foldmethod=marker foldlevel=0:

local statusline = require("user.ui.statusline")

local M = {}

local winbar_augroup = vim.api.nvim_create_augroup("Winbar", { clear = true })

local winbar_filetype_exclude = {
  "help",
  "netrw",
  "nerdtree",
  "TelescopePrompt",
}

-- Utilities {{{

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

-- }}}

-- Block: File Info {{{

M.block_file_info = function(opts)
  local bufnr = opts.bufnr
  local should_use_devicon_hl = opts.color
  local base_hl = opts.hl

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

  return table.concat({
    "%#" .. base_hl .. "#",
    should_use_devicon_hl and "%#" .. hl_group .. "#" or "",
    "  " .. icon .. "  ",

    "%#" .. base_hl .. "#",
    filename,
    " %m ",
  })
end

-- }}}
-- Block: Navic {{{

M.block_navic = function()
  return get_navic()
end

-- }}}
-- Block: Indent Info {{{

M.block_indent_info = function()
  local sw = vim.o.sw
  local et = vim.o.et and "et" or "noet"
  local tw = vim.o.tw

  return ("sw=%s %s tw=%s "):format(sw, et, tw)
end

-- }}}

M.render = function(mode, bufnr)
  local focused = mode == "active"
  local fileinfo_hl = focused and "WinbarActive" or "WinbarInactive"

  if focused then
    return table.concat({
      M.block_file_info({ bufnr = bufnr, color = true, hl = fileinfo_hl }),
      "%#WinbarFill# ",
      M.block_navic(),
      "%=",
      M.block_indent_info(),
    })
  end

  return table.concat({
    M.block_file_info({ bufnr = bufnr, color = false, hl = fileinfo_hl }),
    "%#WinbarFill#",
  })
end

M.set_winbar_option = function(mode, bufnr)
  if should_render() then
    pcall(
      vim.api.nvim_set_option_value,
      "winbar",
      [[%!luaeval('require("user.ui.winbar").render("]] .. mode .. [[", ]] .. (bufnr or "nil") .. [[)')]],
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
