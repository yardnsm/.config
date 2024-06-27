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
  hi.St_Reset = "StatusLine"
  hi.St_GitBranch = { guifg = c.grey_fg, guibg = c.statusline_bg }
  hi.St_FileName = { guifg = c.white, guibg = c.statusline_bg, gui = "bold" }
  hi.St_Text = { guifg = c.light_grey, guibg = c.statusline_bg }
  hi.St_LSP = { guifg = c.green, guibg = c.statusline_bg }
  hi.St_Filetype = { guifg = c.green, guibg = c.statusline_bg }
  hi.St_LineInfo = { guifg = c.white, guibg = c.one_bg }
  hi.St_LineInfoSecond = { guifg = c.white, guibg = c.one_bg3 }

  hi.St_VCSAdd = { guifg = c.green, guibg = c.statusline_bg }
  hi.St_VCSChange = { guifg = c.blue, guibg = c.statusline_bg }
  hi.St_VCSDelete = { guifg = c.red, guibg = c.statusline_bg }

  hi.St_IndicatorNeutral = { guifg = c.nord_blue, guibg = c.black, gui = "bold" }
  hi.St_IndicatorWarning = { guifg = c.yellow, guibg = c.black, gui = "bold" }
  hi.St_IndicatorError = { guifg = c.red, guibg = c.black, gui = "bold" }
  hi.St_IndicatorSuccess = { guifg = c.green, guibg = c.black, gui = "bold" }
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
