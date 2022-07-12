local augroup = vim.api.nvim_create_augroup("Colorscheme", { clear = true })

local setup_base16 = function()
  local status_ok, base16 = pcall(require, "base16-colorscheme")
  if not status_ok then
    return
  end

  local c = base16.colors
  local hi = base16.highlight

  hi.MatchTag = { guifg = c.base08, guibg = c.base02 }
  hi.FloatBorder = { guifg = c.base02, guibg = c.base00 }
  hi.NormalFloat = "Pmenu"
  hi.SignColumn = { guifg = c.base03, guibg = "NONE" }
  hi.LineNr = { guifg = c.base03, guibg = "NONE" }
  hi.CursorLineNr = { guifg = c.base04, guibg = "NONE", gui = "bold" }
  hi.StatusLineNC = { guifg = c.base03 }
  hi.WinBarNC = { guibg = "NONE" }
  hi.VertSplit = { guifg = c.base03, guibg = "NONE" }
  hi.PmenuSel = { guifg = "NONE", guibg = c.base02, gui = "bold" }
  hi.Yanked = { guifg = "NONE", guibg = c.base02 }

  hi.SpellBad = { guibg = c.base08, gui = "undercurl" }
  hi.SpellCap = { guibg = c.base0D, gui = "undercurl" }
  hi.SpellRare = { guibg = c.base02, gui = "undercurl" }
  hi.SpellLocal = { guibg = c.base03, gui = "undercurl" }

  hi.DiffChange = { guifg = c.base0E }

  hi.SignifyLineAdd = { guifg = c.base0B, guibg = c.base01 }
  hi.SignifyLineChange = { guifg = c.base0E, guibg = c.base01 }
  hi.SignifyLineDelete = { guifg = c.base08, guibg = c.base01 }

  hi.LspReferenceText = "Visual"
  hi.LspReferenceRead = "Visual"
  hi.LspReferenceWrite = "Visual"

  hi.DiagnosticSignError = { guifg = "Red", guibg = "NONE", gui = "bold" }
  hi.DiagnosticSignWarn = { guifg = "Yellow", guibg = "NONE", gui = "bold" }
  hi.DiagnosticSignHint = { guifg = c.base0D, guibg = "NONE", gui = "bold" }
  hi.DiagnosticSignInfo = { guifg = c.base0D, guibg = "NONE", gui = "bold" }

  hi.TelescopeMatching = { guifg = c.base0E, gui = "bold" }
  hi.TelescopeResultsNormal = "Comment"
  hi.TelescopeTitle = "TelescopeMatching"
  hi.TelescopeBorder = "FloatBorder"
  hi.TelescopeNormal = "Normal"
  hi.TelescopePromptBorder = "TelescopeBorder"
  hi.TelescopePromptNormal = "TelescopeNormal"
  hi.TelescopePromptPrefix = "Identifier"
  hi.TelescopePreviewTitle = "TelescopeTitle"
  hi.TelescopePromptTitle = "TelescopeTitle"
  hi.TelescopeResultsTitle = "TelescopeTitle"

  hi.CmpItemKind = "CmpItemKindDefault"
  hi.CmpItemMenu = { guifg = "#505050" }
  hi.CmpItemAbbrDeprecated = { guifg = "#808080", guibg = "NONE", gui = "strikethrough" }
  hi.CmpItemAbbrMatch = { guifg = "#569CD6", guibg = "NONE" }
  hi.CmpItemAbbrMatchFuzzy = { guifg = "#569CD6", guibg = "NONE" }
  hi.CmpItemKindVariable = { guifg = "#9CDCFE", guibg = "NONE" }
  hi.CmpItemKindInterface = { guifg = "#9CDCFE", guibg = "NONE" }
  hi.CmpItemKindText = { guifg = "#9CDCFE", guibg = "NONE" }
  hi.CmpItemKindFunction = { guifg = "#C586C0", guibg = "NONE" }
  hi.CmpItemKindMethod = { guifg = "#C586C0", guibg = "NONE" }
  hi.CmpItemKindKeyword = { guifg = "#D4D4D4", guibg = "NONE" }
  hi.CmpItemKindProperty = { guifg = "#D4D4D4", guibg = "NONE" }
  hi.CmpItemKindUnit = { guifg = "#D4D4D4", guibg = "NONE" }

  hi.StatusLinePrimary = { guifg = c.base07, guibg = c.base02, gui = "bold" }
  hi.StatusLineSecondary = { guifg = c.base07, guibg = c.base02 }
  hi.StatusLineNeutral = { guifg = c.base0C, guibg = c.base01 }
  hi.StatusLineIndicatorNeutral = { guifg = c.base0E, guibg = c.base00, gui = "bold" }
  hi.StatusLineIndicatorWarning = { guifg = c.base09, guibg = c.base00, gui = "bold" }
  hi.StatusLineIndicatorError = { guifg = c.base08, guibg = c.base00, gui = "bold" }
  hi.StatusLineIndicatorSuccess = { guifg = c.base0B, guibg = c.base00, gui = "bold" }

  hi.WinbarFgActive = { guifg = c.base0C, guibg = "NONE", gui = "bold" }
  hi.WinbarFgInactive = { guifg = c.base01, guibg = "NONE" }
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "base16-*",
  group = augroup,
  callback = function()
    setup_base16()
  end,
})
