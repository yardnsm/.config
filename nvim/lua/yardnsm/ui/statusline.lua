local Line = require("yardnsm.ui.line")
local blocks = require("yardnsm.ui.blocks")
local base46_utils = require("yardnsm.misc.base46-utils")

local statusline_minimal_modes = {
  netrw = "Netrw",
  nerdtree = "NERD",
  NvimTree = "NvimTree",
  mason = "Mason",
  lazy = "Lazy",
  lspinfo = "LSP Info",
  TelescopePrompt = "Telescope",
  DiffviewFiles = "Diffview Files",
  DiffviewFileHistory = "Diffview History",
  qf = "",

  -- DAP
  ["dap-repl"] = "DAP REPL",
  dapui_console = "DAP Console",
  dapui_watches = "DAP Watches",
  dapui_stacks = "DAP Stacks",
  dapui_breakpoints = "DAP Breakpoints",
  dapui_scopes = "DAP Scopes",
}

local wrap_filename = function(filename)
  return table.concat({
    "%#St_FileName# ",
    filename,
    " %#St_Text#",
  })
end

-- Setup highlights
base46_utils.attach_handler(function(c, hi)
  hi.StatusLineNC = "StatusLine"
  hi.St_Reset = "StatusLine"
  hi.St_GitBranch = { fg = c.grey_fg, bg = c.statusline_bg }
  hi.St_FileName = { fg = c.white, bg = c.statusline_bg, bold = true }
  hi.St_Text = { fg = c.light_grey, bg = c.statusline_bg }
  hi.St_LSP = { fg = c.green, bg = c.statusline_bg }
  hi.St_Filetype = { fg = c.green, bg = c.statusline_bg }
  hi.St_LineInfo = { fg = c.white, bg = c.one_bg }
  hi.St_LineInfoSecond = { fg = c.white, bg = c.one_bg3 }

  hi.St_VCSAdd = { fg = c.green, bg = c.statusline_bg }
  hi.St_VCSChange = { fg = c.blue, bg = c.statusline_bg }
  hi.St_VCSDelete = { fg = c.red, bg = c.statusline_bg }

  hi.St_IndicatorNeutral = { fg = c.nord_blue, bg = c.black, bold = true }
  hi.St_IndicatorWarning = { fg = c.yellow, bg = c.black, bold = true }
  hi.St_IndicatorError = { fg = c.red, bg = c.black, bold = true }
  hi.St_IndicatorSuccess = { fg = c.green, bg = c.black, bold = true }
end)

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
            "%#St_GitBranch#" .. blocks.vcs_branch(),
            wrap_filename(blocks.relpath(state.bufnr)),

            -- Buffer number if in diff mode
            vim.wo.diff and " #%n" or "",

            "%r%m ",
            blocks.vcs_stats(),
            "%=",

            "%#St_Text#" .. blocks.paste() .. "%#St_Text#",
            "%#St_Text#" .. blocks.spell() .. "%#St_Text#",
            " ",

            "%#St_LSP#" .. blocks.lsp() .. "%#St_Text#",
            "%#St_Filetype# " .. blocks.filetype(state) .. "%#St_Text#  ",

            "%#St_LineInfo#  %3p%%  ",
            "%#St_LineInfoSecond# %3l:%-2c ",

            "%#St_LineInfoSecond#" .. blocks.diagnostics() .. "%#St_LineInfoSecond# ",
          })
        end

        return table.concat({
          blocks.vcs_branch(),
          " " .. blocks.relpath(state.bufnr) .. " ",
          "%m",
          "%=",
          blocks.filetype(state),
          "     ",
        })
      end,
    },
  },
})
