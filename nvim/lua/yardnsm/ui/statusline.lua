---@type Line
local Line = require("yardnsm.ui.line")
local blocks = require("yardnsm.ui.blocks")

local statusline_minimal_modes = {
  netrw = "Netrw",
  nerdtree = "NERD",
  NvimTree = "NvimTree",
  TelescopePrompt = "Telescope",
  DiffviewFiles = "Diffview Files",
  DiffviewFileHistory = "Diffview History",
  qf = "",
}

local wrap_filename = function(filename)
  return table.concat({
    "%#St_FileName# ",
    filename,
    " %#St_FileNameSep# %#St_FileNameSepSec# %#St_Text#",
  })
end

Line.setup({
  option = "statusline",
  renderers = {

    -- Minimal statusline
    {
      ft = vim.tbl_keys(statusline_minimal_modes),
      render = function(state)
        local title = statusline_minimal_modes[state.ft]

        if state.active and state.focused then
          return table.concat({
            wrap_filename(title .. "%q"),

            "%#St_Reset#",
            "%=",
            "%#St_IndicatorNeutral#   %#St_Reset# ",
          })
        end

        -- Same, without the colors
        return table.concat({
          " " .. title .. "%q",
          "%=",
          "    ",
        })
      end,
    },

    -- Full statusline
    {
      enabled = true,
      render = function(state)

        if state.active and state.focused then
          return table.concat({
            wrap_filename("%f"),

            -- Buffer number if in diff mode
            vim.wo.diff and " #%n" or "",

            " %r%m",
            "%#St_GitBranch#" .. blocks.vcs_branch(),
            blocks.vcs_stats(),
            "%=",

            "%#St_TextDark#" .. blocks.paste() .. "%#St_Text#",
            "%#St_TextDark#" .. blocks.spell() .. "%#St_Text#",

            "%#St_LSP#" .. blocks.lsp() .. "%#St_Text#",
            "%#St_Filetype# " .. blocks.filetype(state) .. "%#St_Text#  ",

            "%#St_LineInfo#  %3p%%  ",
            "%#St_LineInfoSecond# %3l:%-2c ",

            "%#St_LineInfoSecond#" .. blocks.diagnostics() .. "%#St_LineInfoSecond# ",
          })
        end

        return table.concat({
          " %f ",
          "%m",
          "%=",
          blocks.filetype(state),
          "     ",
        })
      end,
    },
  },
})
