---@type Line
local Line = require("yardnsm.ui.line")
local blocks = require("yardnsm.ui.blocks")

local winbar_filetype_exclude = {
  "help",
  "netrw",
  "nerdtree",
  "TelescopePrompt",
}

---@param state LineState
local should_render = function(state)
  if vim.tbl_contains(winbar_filetype_exclude, state.ft) then
    return false
  end

  local bufhidden = vim.api.nvim_get_option_value("bufhidden", { buf = state.buf })
  local buflisted = vim.api.nvim_get_option_value("buflisted", { buf = state.buf })
  local diff = vim.api.nvim_get_option_value("diff", { win = state.winid })

  return bufhidden ~= "wipe" and buflisted and not diff
end

Line.setup({
  option = "winbar",
  renderers = {

    -- Renderer for NvimTree
    {
      ft = { "NvimTree", "DiffviewFiles", "DiffviewFileHistory" },
      render = function()
        return "%#Wb_Fill# "
      end
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
            "%=",
            blocks.indent_info(),
          })
        end

        return table.concat({
          blocks.file_tab_like(state),
          "%#Wb_Fill#",
        })
      end,
    },
  },
})
