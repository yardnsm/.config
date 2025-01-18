local Line = require("yardnsm.ui.line")
local blocks = require("yardnsm.ui.blocks")
local base46_utils = require("yardnsm.misc.base46-utils")

local winbar_filetype_exclude = {
  "help",
  "netrw",
  "nerdtree",
  "TelescopePrompt",
}

-- Setup highlights
base46_utils.attach_handler(function(c, hi)
  hi.Wb_TabActive = { fg = c.white, bold = true }
  hi.Wb_TabInactive = { fg = c.grey_fg, bg = "NONE" }
  hi.Wb_Fill = { fg = c.grey_fg, bg = c.darker_black }
  hi.Wb_FillInactive = { fg = c.grey_fg, bg = c.statusline_bg }
end)

---@param state LineState
local should_render = function(state)
  if vim.tbl_contains(winbar_filetype_exclude, state.ft) then
    return false
  end

  local bufhidden = vim.api.nvim_get_option_value("bufhidden", { buf = state.bufnr })
  local buflisted = vim.api.nvim_get_option_value("buflisted", { buf = state.bufnr })
  local diff = vim.api.nvim_get_option_value("diff", { win = state.winid })

  return bufhidden ~= "wipe" and buflisted and not diff
end

Line.setup({
  option = "winbar",
  renderers = {

    -- Renderer for DAP UI
    {
      enabled = function(state)
        return string.find(state.ft, "^dapui_") ~= nil
      end,

      render = function()
        return "%#St_Reset#%=%#St_FileName#  %f  %#St_Reset#%="
      end,
    },

    -- Renderer for NvimTree
    {
      ft = { "NvimTree", "DiffviewFiles", "DiffviewFileHistory" },
      render = function()
        return "%#Wb_Fill# "
      end,
    },

    -- Full winbar
    {
      enabled = should_render,
      render = function(state)
        local focused = state.focused and state.active

        if focused then
          return table.concat({
            blocks.file_tab_like(state),
            "%#Wb_Fill# ",
            blocks.navic(),
            "%= │ ",
            blocks.indent_info(),
          })
        end

        return table.concat({
          blocks.file_tab_like(state),
          "%#Wb_FillInactive#",
        })
      end,
    },

    -- Blank fill for diff mode (visually more appealing)
    {
      enabled = function(state)
        return vim.api.nvim_get_option_value("diff", { win = state.winid })
      end,
      render = function()
        return "%#Wb_TabInactive# "
      end,
    },
  },
})
