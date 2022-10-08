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
  hi.StatusLineNC = { guifg = c.base03, guibg = c.base01 }
  hi.WinBarNC = { guibg = "NONE" }
  hi.VertSplit = { guifg = c.base03, guibg = "NONE" }
  hi.PmenuSel = { guifg = "NONE", guibg = c.base02 }
  hi.PmenuThumb = { guifg = "NONE", guibg = c.base03, gui = "bold" }
  hi.Yanked = { guifg = "NONE", guibg = c.base02 }

  hi.SpellBad = { guibg = c.base08, gui = "undercurl" }
  hi.SpellCap = { guibg = c.base0D, gui = "undercurl" }
  hi.SpellRare = { guibg = c.base02, gui = "undercurl" }
  hi.SpellLocal = { guibg = c.base03, gui = "undercurl" }

  hi.DiffChange = { guifg = c.base0D }

  hi.SignifyLineAdd = { guifg = c.base0B, guibg = c.base01 }
  hi.SignifyLineChange = { guifg = c.base0E, guibg = c.base01 }
  hi.SignifyLineDelete = { guifg = c.base08, guibg = c.base01 }

  hi.NvimTreeRootFolder = "Statement"
  hi.NvimTreeGitDirty = { guifg = c.base09 }
  hi.NvimTreeGitNew = { guifg = c.base09 }
  hi.NvimTreeGitStaged = { guifg = c.base0B }
  hi.NvimTreeGitDeleted = { guifg = c.base08 }

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
  hi.CmpItemAbbr = { guibg = "NONE" }
  hi.CmpItemAbbrDeprecated = { guifg = "#808080", guibg = "NONE", gui = "strikethrough" }
  hi.CmpItemAbbrMatch = { guifg = "#569CD6", guibg = "NONE" }
  hi.CmpItemAbbrMatchFuzzy = { guifg = "#569CD6", guibg = "NONE" }

  hi.StatusLineIcon = "DevIconLua"
  hi.StatusLineFileInfo = { guifg = c.base07, guibg = c.base02, gui = "bold" }
  hi.StatusLineGitBranch = { guifg = c.base0C, guibg = c.base01 }
  hi.StatusLineNeutral = { guifg = c.base0C, guibg = c.base01 }
  hi.StatusLineLSPStatus = "DiffAdd"
  hi.StatusLineLineInfo = { guifg = c.base07, guibg = c.base02 }
  hi.StatusLineVisualPercentage = { guifg = c.base0D, guibg = c.base00 }

  hi.StatusLineVCSAdd = 'SignifyLineAdd'
  hi.StatusLineVCSChange = 'SignifyLineChange'
  hi.StatusLineVCSDelete = 'SignifyLineDelete'

  hi.StatusLineIndicatorNeutral = { guifg = c.base0D, guibg = c.base00, gui = "bold" }
  hi.StatusLineIndicatorWarning = { guifg = c.base09, guibg = c.base00, gui = "bold" }
  hi.StatusLineIndicatorError = { guifg = c.base08, guibg = c.base00, gui = "bold" }
  hi.StatusLineIndicatorSuccess = { guifg = c.base0B, guibg = c.base00, gui = "bold" }

  hi.WinbarActive = { guifg = c.base0C, guibg = "NONE", gui = "bold" }
  hi.WinbarInactive = { guifg = c.base01, guibg = "NONE" }
  hi.WinbarFill = { guifg = c.base02, guibg = c.base01 }

  -- Refine a bit for base46 colorschemes
  if vim.g.colors_name:match("^base46") then
    hi.ColorColumn = { guibg = c.black2 }
    hi.CursorLine = { guibg = c.black2 }

    hi.TelescopeBorder = { guifg = c.darker_black, guibg = c.darker_black }
    hi.TelescopePromptBorder = { guifg = c.black2, guibg = c.black2 }
    hi.TelescopePromptNormal = { guifg = c.white, guibg = c.black2 }
    hi.TelescopePromptPrefix = { guifg = c.red, guibg = c.black2 }
    hi.TelescopeNormal = { guibg = c.darker_black }
    hi.TelescopeResultsNormal = { guifg = c.base03, guibg = c.darker_black }
    hi.TelescopePreviewTitle = { guifg = c.black, guibg = c.green }
    hi.TelescopePromptTitle = { guifg = c.black, guibg = c.red }
    hi.TelescopeResultsTitle = { guifg = c.darker_black, guibg = c.darker_black }
    hi.TelescopeSelection = { guibg = c.black2, guifg = c.light_grey }
    hi.TelescopeResultsDiffAdd = { guifg = c.green }
    hi.TelescopeResultsDiffChange = { guifg = c.yellow }
    hi.TelescopeResultsDiffDelete = { guifg = c.red }

    hi.StatusLineIcon = { guifg = c.nord_blue, guibg = c.black }
    hi.StatusLineFileInfo = { guifg = c.white, guibg = c.lightbg, gui = 'bold' }
    hi.StatusLineGitBranch = { guifg = c.light_grey, guibg = c.statusline_bg }
    hi.StatusLineNeutral = { guifg = c.light_grey, guibg = c.statusline_bg }
    hi.StatusLineLSPStatus = { guifg = c.green, guibg = c.black }
    hi.StatusLineLineInfo = { guifg = c.white, guibg = c.lightbg }
    hi.StatusLineVisualPercentage = { guifg = c.light_grey, guibg = c.black }

    hi.StatusLineVCSAdd = { guifg = c.green, guibg = c.statusline_bg }
    hi.StatusLineVCSChange = { guifg = c.blue, guibg = c.statusline_bg }
    hi.StatusLineVCSDelete = { guifg = c.red, guibg = c.statusline_bg }

    hi.StatusLineIndicatorNeutral = { guifg = c.nord_blue, guibg = c.black, gui = "bold" }
    hi.StatusLineIndicatorWarning = { guifg = c.yellow, guibg = c.black, gui = "bold" }
    hi.StatusLineIndicatorError = { guifg = c.red, guibg = c.black, gui = "bold" }
    hi.StatusLineIndicatorSuccess = { guifg = c.green, guibg = c.black, gui = "bold" }

    hi.WinbarActive = { guifg = c.white, gui = "bold" }
    hi.WinbarInactive = { guifg = c.base01, guibg = "NONE" }
    hi.WinbarFill = { guifg = c.grey_fg, guibg = c.darker_black }

    hi.NvimTreeNormal = { guibg = c.darker_black }
    hi.NvimTreeWinSeparator = { guifg = c.darker_black, guibg = c.darker_black }
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = {"base16-*", "base46-*"},
  group = augroup,
  callback = function()
    setup_base16()
  end,
})
