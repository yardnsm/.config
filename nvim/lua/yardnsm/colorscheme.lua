-- Setup custom highlight groups for base16 and my port of base46

local base16_utils = require("yardnsm.misc.base16-utils")

local M = {}

local default_base16 = function(c, hi)
  hi.MatchTag = { guifg = c.base08, guibg = c.base02 }
  hi.SignColumn = { guifg = c.base03, guibg = "NONE" }
  hi.Yanked = { guifg = "NONE", guibg = c.base02 }

  hi.NormalFloat = "Pmenu"
  hi.FloatBorder = { guifg = c.base02, guibg = c.base00 }

  hi.LineNr = { guifg = c.base03, guibg = "NONE" }
  hi.CursorLineNr = { guifg = c.base04, guibg = "NONE", gui = "bold" }

  hi.PmenuSel = { guifg = "NONE", guibg = c.base02 }
  hi.PmenuThumb = { guifg = "NONE", guibg = c.base03, gui = "bold" }

  hi.StatusLineNC = { guifg = c.base03, guibg = c.base01 }
  hi.WinBarNC = { guibg = "NONE" }

  hi.VertSplit = { guifg = c.base03, guibg = "NONE" }
  hi.WinSeparator = { guifg = c.base03, guibg = "NONE" }

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

  hi.LightBulbSign = { guifg = "Orange", guibg = "NONE" }

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

  hi.StatusLineVCSAdd = "SignifyLineAdd"
  hi.StatusLineVCSChange = "SignifyLineChange"
  hi.StatusLineVCSDelete = "SignifyLineDelete"

  hi.StatusLineIndicatorNeutral = { guifg = c.base0D, guibg = c.base00, gui = "bold" }
  hi.StatusLineIndicatorWarning = { guifg = c.base09, guibg = c.base00, gui = "bold" }
  hi.StatusLineIndicatorError = { guifg = c.base08, guibg = c.base00, gui = "bold" }
  hi.StatusLineIndicatorSuccess = { guifg = c.base0B, guibg = c.base00, gui = "bold" }

  hi.WinbarActive = { guifg = c.base0C, guibg = "NONE", gui = "bold" }
  hi.WinbarInactive = { guifg = c.base01, guibg = "NONE" }
  hi.WinbarFill = { guifg = c.base02, guibg = c.base01 }
end

local default_base46 = function(c, hi)
  hi.LineNr = { guifg = c.grey }
  hi.CursorLineNr = { guifg = c.white }

  hi.ColorColumn = { guibg = c.base01 }
  hi.CursorLine = { guibg = c.base01 }

  hi.VertSplit = { guifg = c.line }
  hi.WinSeparator = { guifg = c.line }

  hi.StatusLineIcon = { guifg = c.nord_blue, guibg = c.darker_black }
  hi.StatusLineFileInfo = { guifg = c.white, guibg = c.lightbg, gui = "bold" }
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
  hi.WinbarFill = { guifg = c.grey_fg, guibg = c.black2 }

  -- These work best of base46-classic-dark
  hi.DiffAdd = { guibg = "#122f2f", guifg = "none" }
  hi.DiffChange = { guibg = "#222a39", guifg = "none" }
  hi.DiffText = { guibg = "#2f3f5c", guifg = "none" }
  hi.DiffDelete = { guibg = "none", guifg = "#4f2739" }

  -- An attempt to port NvChad's base46 hlgroups
  -- require("yardnsm.misc.base46-nvchad").setup_highlights()
end

-- Make sure to call "setup" before loading the colorscheme. Preferably on the plugin's spec "init"
-- fiels.
M.setup = function()
  base16_utils.attach_handler({ "base16-*", "base46-*" }, default_base16)
  base16_utils.attach_handler("base46-*", default_base46)
end

return M
