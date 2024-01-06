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
  hi.SpellRare = { guibg = c.base0E, gui = "undercurl" }
  hi.SpellLocal = { guibg = c.base0C, gui = "undercurl" }

  hi.DiffChange = { guifg = c.base0D }

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
  hi.ColorColumn = { guibg = c.black2 }
  hi.CursorLine = { guibg = c.black2 }
  hi.Yanked = { guifg = "NONE", guibg = c.one_bg3 }

  hi.VertSplit = { guifg = c.line }
  hi.WinSeparator = { guifg = c.line }
  hi.FloatBorder = { guifg = c.one_bg3, guibg = c.black }

  hi.DiagnosticHint = { guifg = c.purple }
  hi.DiagnosticError = { guifg = c.red }
  hi.DiagnosticWarn = { guifg = c.yellow }
  hi.DiagnosticInfo = { guifg = c.green }
  hi.DiagnosticFloatingHint = "DiagnosticHint"
  hi.DiagnosticFloatingError = "DiagnosticError"
  hi.DiagnosticFloatingWarn = "DiagnosticWarn"
  hi.DiagnosticFloatingInfo = "DiagnosticInfo"

  hi.StatusLine = { guifg = c.light_grey, guibg = c.statusline_bg }
  hi.StatusLineNC = { guifg = c.base03, guibg = c.one_bg }

  hi.St_Reset = 'StatusLine'
  hi.St_GitBranch = { guifg = c.base03, guibg = c.statusline_bg }
  hi.St_FileName = { guifg = c.white, guibg = c.one_bg3, gui = "bold" }
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

  -- Lazy.nvim
  hi.LazyNormal = "Normal"
  hi.LazyH1 = { guibg = c.green, guifg = c.black }
  hi.LazyButton = { guibg = c.one_bg, guifg = c.light_grey }
  hi.LazyH2 = { guifg = c.red, bold = true, underline = true }
  hi.LazyReasonPlugin = { guifg = c.red }
  hi.LazyValue = { guifg = c.teal }
  hi.LazyDir = { guifg = c.base05 }
  hi.LazyUrl = { guifg = c.base05 }
  hi.LazyCommit = { guifg = c.green }
  hi.LazyNoCond = { guifg = c.red }
  hi.LazySpecial = { guifg = c.blue }
  hi.LazyReasonFt = { guifg = c.purple }
  hi.LazyOperator = { guifg = c.white }
  hi.LazyReasonKeys = { guifg = c.teal }
  hi.LazyTaskOutput = { guifg = c.white }
  hi.LazyCommitIssue = { guifg = c.pink }
  hi.LazyReasonEvent = { guifg = c.yellow }
  hi.LazyReasonStart = { guifg = c.white }
  hi.LazyReasonRuntime = { guifg = c.nord_blue }
  hi.LazyReasonCmd = { guifg = c.sun }
  hi.LazyReasonSource = { guifg = c.cyan }
  hi.LazyReasonImport = { guifg = c.white }
  hi.LazyProgressDone = { guifg = c.green }

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
