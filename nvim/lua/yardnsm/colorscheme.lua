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
  hi.CmpItemAbbrMatchFuzzy = { guifg = "#569CD6", guibg = "NONE", gui = "bold" }
end

local default_base46 = function(c, hi)
  hi.LineNr = { guifg = c.grey }
  hi.CursorLineNr = { guifg = c.white }

  hi.ColorColumn = { guibg = c.base01 }
  hi.CursorLine = { guibg = c.base01 }

  hi.VertSplit = { guifg = c.line }
  hi.WinSeparator = { guifg = c.line }

  hi.FloatBorder = { guifg = c.one_bg3, guibg = c.black }

  hi.DiagnosticHint = { guifg = c.purple }
  hi.DiagnosticError = { guifg = c.red }
  hi.DiagnosticWarn = { guifg = c.yellow }
  hi.DiagnosticInfo = { guifg = c.green }
  hi.DiagnosticFloatingHint = { guifg = c.purple }
  hi.DiagnosticFloatingError = { guifg = c.red }
  hi.DiagnosticFloatingWarn = { guifg = c.yellow }
  hi.DiagnosticFloatingInfo = { guifg = c.green }

  hi.StatusLine = { guifg = c.light_grey, guibg = c.statusline_bg }
  hi.StatusLineNC = { guifg = c.base03, guibg = c.one_bg }

  hi.St_Reset = 'StatusLine'
  hi.St_GitBranch = { guifg = c.base03, guibg = c.statusline_bg }
  hi.St_FileName = { guifg = c.white, guibg = c.one_bg3, gui = "bold" }
  hi.St_FileNameSep = { guifg = c.white, guibg = c.one_bg2 }
  hi.St_FileNameSepSec = { guifg = c.white, guibg = c.one_bg }
  hi.St_Text = { guifg = c.light_grey, guibg = c.statusline_bg }
  hi.St_TextDark = { guifg = c.base03, guibg = c.statusline_bg }
  hi.St_LSP = { guifg = c.green, guibg = c.statusline_bg }
  hi.St_Filetype = { guifg = c.blue, guibg = c.statusline_bg }
  hi.St_LineInfo = { guifg = c.white, guibg = c.one_bg }
  hi.St_LineInfoSecond = { guifg = c.white, guibg = c.one_bg3 }

  hi.St_VCSAdd = { guifg = c.green, guibg = c.statusline_bg }
  hi.St_VCSChange = { guifg = c.blue, guibg = c.statusline_bg }
  hi.St_VCSDelete = { guifg = c.red, guibg = c.statusline_bg }

  hi.St_IndicatorNeutral = { guifg = c.nord_blue, guibg = c.black, gui = "bold" }
  hi.St_IndicatorWarning = { guifg = c.yellow, guibg = c.black, gui = "bold" }
  hi.St_IndicatorError = { guifg = c.red, guibg = c.black, gui = "bold" }
  hi.St_IndicatorSuccess = { guifg = c.green, guibg = c.black, gui = "bold" }

  hi.Wb_TabActive = { guifg = c.white, gui = "bold" }
  hi.Wb_TabInactive = { guifg = c.base01, guibg = "NONE" }
  hi.Wb_Fill = { guifg = c.grey_fg, guibg = c.darker_black }

  -- These work best of base46-classic-dark
  hi.DiffAdd = { guibg = "#122f2f", guifg = "none" }
  hi.DiffChange = { guibg = "#222a39", guifg = "none" }
  hi.DiffText = { guibg = "#2f3f5c", guifg = "none" }
  hi.DiffDelete = { guibg = "none", guifg = "#4f2739" }

  -- An attempt to port NvChad's base46 hlgroups
  -- require("yardnsm.misc.base46-nvchad").setup_highlights()
end

-- Make sure to call "setup" before loading the colorscheme. Preferably on the plugin's spec "init"
-- field.
M.setup = function()
  base16_utils.attach_handler({ "base16-*", "base46-*" }, default_base16)
  base16_utils.attach_handler("base46-*", default_base46)
end

return M
