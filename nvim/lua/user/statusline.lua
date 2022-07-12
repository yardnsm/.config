-- vim: set foldmethod=marker foldlevel=0:

local status_ok, nvim_devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
  nvim_devicons = nil
end

local lsp_statusline_utils = require('user.lsp.statusline')

local M = {}

local statusline_augroup = vim.api.nvim_create_augroup("Statusline", { clear = true })

local statusline_minimal_modes = {
  netrw = 'Netrw',
  nerdtree = 'NERD',
  TelescopePrompt = 'Telescope',
  qf = '',
}

local statusline_visual_percentages = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }

local diagnostic_highlights = {
  info = 'StatusLineIndicatorNeutral',
  warning = 'StatusLineIndicatorWarning',
  error = 'StatusLineIndicatorError',
  success = 'StatusLineIndicatorSuccess',
}

-- Utilities {{{

local should_set_minimal = function (filetype)
  return statusline_minimal_modes[filetype] ~= nil
end

local get_minimal_name = function (filetype)
  return statusline_minimal_modes[filetype]
end

M.get_devicon_for_buffer = function (bufnr)
  if nvim_devicons == nil then
    return '', '', ''
  end

  local expand_file = bufnr ~= nil and ('#' .. bufnr) or '%'

  local filename = vim.fn.expand(expand_file .. ":t")
  local extension = vim.fn.expand(expand_file .. ":e")

  local icon, color = nvim_devicons.get_icon_color(
    filename,
    extension,
    { default = true }
  )

  local _, hl_group = nvim_devicons.get_icon(
    filename,
    extension,
    { default = true }
  )

  return icon, hl_group, color
end

-- }}}

-- Block: Visual Percentage {{{

M.block_visual_percentage = function ()
  local current_line = vim.fn.line('.')
  local total_lines = vim.fn.line('$')

  local index = vim.fn.float2nr(
    vim.fn.ceil((current_line * 1.0) / total_lines * (#statusline_visual_percentages - 1))
  )

  return statusline_visual_percentages[index]
end

-- }}}
-- Block: Paste mode {{{

M.block_paste = function ()
  if vim.o.paste then
    return '[PASTE]'
  end

  return ''
end

-- }}}
-- Block: Spell mode {{{

M.block_spell = function ()
  if vim.wo.spell then
    return '[SPELL]'
  end

  return ''
end

-- }}}
-- Block: Filetype {{{

M.block_filetype = function (opts)
  local icon, hl_group = M.get_devicon_for_buffer()

  local filetype = vim.bo.filetype
  hl_group = hl_group or 'StatusLineNeutral'

  if filetype == '' then
    return 'no ft'
  end

  if opts.colors then
    return ' %#' .. hl_group .. '#  ' .. icon .. '  ' .. filetype .. ' '
  end

  return ' ' .. icon .. '  ' .. filetype .. ' '
end

-- }}}
-- Block: Diagnostics {{{

M.block_diagnostics = function ()
  local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local infos = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })

  local highlight = diagnostic_highlights.success

  local result = ''

  if hints ~= 0 then
    highlight = diagnostic_highlights.info
    result = result .. vim.fn.printf('%%#%s# ‹!:%d›', highlight, hints)
  end

  if infos ~= 0 then
    highlight = diagnostic_highlights.info
    result = result .. vim.fn.printf('%%#%s# ‹I:%d›', highlight, infos)
  end

  if warnings ~= 0 then
    highlight = diagnostic_highlights.warning
    result = result .. vim.fn.printf('%%#%s# ‹W:%d›', highlight, warnings)
  end

  if errors ~= 0 then
    highlight = diagnostic_highlights.error
    result = result .. vim.fn.printf('%%#%s# ‹E:%d›', highlight, errors)
  end

  return result .. vim.fn.printf('%%#%s# ● %%#StatusLineNeutral# ', highlight)
end

-- }}}
-- Block: LSP Status {{{

M.block_lsp_status = function ()
  local client_attahced = lsp_statusline_utils.is_client_attahced()
  local server_names = lsp_statusline_utils.get_servers_names()

  if not client_attahced then
    return ''
  end

  return '⋅   ' .. server_names .. ' '
end

-- }}}
-- Block: VCS Branch {{{

M.block_vcs_branch = function ()
  local branch = vim.fn.exists('*FugitiveHead') and vim.fn.FugitiveHead() or ''

  if branch == '' then
    return ''
  end

  return '  ' .. branch
end

-- }}}
-- Block: VCS Stats {{{

M.block_vcs_stats = function ()
  if not vim.fn.exists('*sy#start') then
    return ''
  end

  local stats = vim.fn['sy#repo#get_stats']()

  local hl_groups = { 'SignifyLineAdd', 'SignifyLineChange', 'SignifyLineDelete' }
  local symbols = { '+', '~', '-' }

  local result = ''

  for index, value in ipairs(stats) do
    if value > 0 then
      result = result .. '%' .. vim.fn.printf('#%s#%s%s ', hl_groups[index], symbols[index], value)
    end
  end

  if result then
    return string.sub(result, 1, -2)
  end
end

-- }}}

M.render_minimal = function(mode)
  local title = get_minimal_name(vim.bo.filetype)

  if mode == 'active' then
    return table.concat({
      '%#StatusLinePrimary# ',
      title,
      '%q ',
      '%#StatusLineNeutral#',
      '%=',
      '%#StatusLineIndicatorNeutral# ● %#StatusLineNeutral# '
    })
  end

  return ' ' .. title .. '%q %= ●  '
end

M.render_full = function(mode)
  local result = ''
  local focused = vim.g.statusline_winid == vim.fn.win_getid(vim.fn.winnr()) and mode ~= 'inactive'

  if focused then
    result = result .. '%#StatusLinePrimary# %f '
    result = result .. '%#StatusLineNeutral#' .. M.block_vcs_branch()

    -- Buffer number if in diff mode
    if vim.wo.diff then
      result = result .. ' [%n]'
    end

    result = result .. '%#StatusLineNeutral# %r'
    result = result .. '%#StatusLineNeutral#%m'
    result = result .. '%#StatusLineNeutral#' .. M.block_paste()
    result = result .. '%#StatusLineNeutral#' .. M.block_spell() .. ' '
    result = result .. '%#StatusLineNeutral#' .. M.block_vcs_stats()
    result = result .. '%#StatusLineNeutral#'

    result = result .. '%#StatusLineNeutral#%='

    result = result .. '%#StatusLineNeutral#' .. M.block_filetype({ colors = true })
    result = result .. '%#DiffAdd#' .. M.block_lsp_status() .. ' '
    result = result .. '%#StatusLineNeutral# %3p%% '
    result = result .. '%#StatusLineSecondary# %3l:%-2c '

    result = result .. '%#DevIconSh#' .. M.block_visual_percentage() .. '%#StatusLineSecondary# '
    result = result .. M.block_diagnostics()
  else
    result = result .. ' %f '

    -- Buffer number if in diff mode
    if vim.wo.diff then
      result = result .. ' [%n]'
    end

    result = result .. '%m'
    result = result .. '%='

    result = result .. M.block_filetype({ colors = false }) .. ' '
    result = result .. ' ●  '
  end

  return result
end

M.render = function(mode)
  local filetype = vim.bo.filetype

  if should_set_minimal(filetype) then
    return M.render_minimal(mode)
  end

  return M.render_full(mode)
end

M.set_statusline_option = function (mode)
  vim.api.nvim_set_option_value(
    "statusline",
    [[%!luaeval('require("user.statusline").render("]] .. mode .. [[")')]],
    { scope = "local" }
  )
end

M.setup = function()
  M.set_statusline_option('active')

  vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "FocusGained", "FileType" }, {
    pattern = "*",
    group = statusline_augroup,
    callback = function()
      M.set_statusline_option('active')
    end,
  })

  vim.api.nvim_create_autocmd({ "WinLeave", "FocusLost" }, {
    pattern = "*",
    group = statusline_augroup,
    callback = function()
      M.set_statusline_option('inactive')
    end,
  })
end

return M
