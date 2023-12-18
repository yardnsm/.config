-- vim: set foldmethod=marker foldlevel=0:

-- This is an experiment of me porting all of NvChad's base46 highlights. This is not the best
-- thing, I prefer my setup (../colorscheme.lua) a lot over this.

-- default, atom, atom_colored, flat_light, flat_dark
local cmp_style = "default"

-- default, bordered, borderless
local teleascope_style = "default"

-- default, vscode, vscode_colored, minimal
local statusline_style = "default"

local M = {}

M.setup_highlights = function()
  local status_ok, base16 = pcall(require, "base16-colorscheme")
  if not status_ok then
    return
  end

  local c = base16.colors
  local hi = base16.highlight

  -- TODO There are some stuff such as `bold` and `underline` that I have yet to port.

  -- TODO Also the `polish_hl` table which is not yet merged. This could actually be a nice feature
  -- to my current setup.

  -- integrations/blankline.lua {{{

  hi.IndentBlanklineChar = { guifg = c.line }
  hi.IndentBlanklineSpaceChar = { guifg = c.line }
  hi.IndentBlanklineContextChar = { guifg = c.grey }
  hi.IndentBlanklineContextStart = { guifg = c.one_fg2 }

  -- }}}
  -- integrations/cmp.lua {{{

  hi.CmpItemAbbr = { guifg = c.white }
  hi.CmpItemAbbrMatch = { guifg = c.blue, bold = true }
  hi.CmpDoc = { guibg = c.darker_black }
  hi.CmpDocBorder = { guifg = c.darker_black, guibg = c.darker_black }
  hi.CmpPmenu = { guibg = c.black }
  hi.CmpSel = "PmenuSel"

  hi.CmpItemKindConstant = { guifg = c.base09 }
  hi.CmpItemKindFunction = { guifg = c.base0D }
  hi.CmpItemKindIdentifier = { guifg = c.base08 }
  hi.CmpItemKindField = { guifg = c.base08 }
  hi.CmpItemKindVariable = { guifg = c.base0E }
  hi.CmpItemKindSnippet = { guifg = c.red }
  hi.CmpItemKindText = { guifg = c.base0B }
  hi.CmpItemKindStructure = { guifg = c.base0E }
  hi.CmpItemKindType = { guifg = c.base0A }
  hi.CmpItemKindKeyword = { guifg = c.base07 }
  hi.CmpItemKindMethod = { guifg = c.base0D }
  hi.CmpItemKindConstructor = { guifg = c.blue }
  hi.CmpItemKindFolder = { guifg = c.base07 }
  hi.CmpItemKindModule = { guifg = c.base0A }
  hi.CmpItemKindProperty = { guifg = c.base08 }
  hi.CmpItemKindEnum = { guifg = c.blue }
  hi.CmpItemKindUnit = { guifg = c.base0E }
  hi.CmpItemKindClass = { guifg = c.teal }
  hi.CmpItemKindFile = { guifg = c.base07 }
  hi.CmpItemKindInterface = { guifg = c.green }
  hi.CmpItemKindColor = { guifg = c.white }
  hi.CmpItemKindReference = { guifg = c.base05 }
  hi.CmpItemKindEnumMember = { guifg = c.purple }
  hi.CmpItemKindStruct = { guifg = c.base0E }
  hi.CmpItemKindValue = { guifg = c.cyan }
  hi.CmpItemKindEvent = { guifg = c.yellow }
  hi.CmpItemKindOperator = { guifg = c.base05 }
  hi.CmpItemKindTypeParameter = { guifg = c.base08 }
  hi.CmpItemKindCopilot = { guifg = c.green }
  hi.CmpItemKindCodeium = { guifg = c.vibrant_green }
  hi.CmpItemKindTabNine = { guifg = c.baby_pink }

  if cmp_style == "atom" then
    hi.CmpItemMenu = { guifg = c.light_grey, italic = true }
    hi.CmpPmenu = {
      guibg = c.black2,
    }

    hi.CmpDoc = { guibg = c.darker_black }
    hi.CmpDocBorder = { guifg = c.darker_black, guibg = c.darker_black }
  elseif cmp_style == "atom_colored" then
    hi.CmpItemMenu = { guifg = c.light_grey, italic = true }
    hi.CmpPmenu = {
      guibg = c.black2,
    }

    hi.CmpDoc = { guibg = c.darker_black }
    hi.CmpDocBorder = { guifg = c.darker_black, guibg = c.darker_black }
  elseif cmp_style == "flat_light" then
    hi.CmpPmenu = {
      guibg = c.black2,
    }

    hi.CmpBorder = { guifg = c.black2, guibg = c.black2 }
    hi.CmpDocBorder = { guifg = c.darker_black, guibg = c.darker_black }
  elseif cmp_style == "flat_dark" then
    hi.CmpPmenu = {
      guibg = c.darker_black,
    }

    hi.CmpBorder = { guifg = c.darker_black, guibg = c.darker_black }
    hi.CmpDocBorder = { guifg = c.black2, guibg = c.black2 }
    hi.CmpDoc = { guibg = c.black2 }
  end

  -- }}}
  -- integrations/default.lua {{{

  hi.MatchWord = {
    guibg = c.grey,
    guifg = c.white,
  }

  hi.Pmenu = { guibg = c.one_bg }
  hi.PmenuSbar = { guibg = c.one_bg }
  hi.PmenuSel = { guibg = c.pmenu_bg, guifg = c.black }
  hi.PmenuThumb = { guibg = c.grey }

  hi.MatchParen = "MatchWord"

  hi.Comment = { guifg = c.grey_fg }

  hi.CursorLineNr = { guifg = c.white }
  hi.LineNr = { guifg = c.grey }

  -- floating windows
  hi.FloatBorder = { guifg = c.blue }
  hi.NormalFloat = { guibg = c.darker_black }

  hi.NvimInternalError = { guifg = c.red }
  hi.WinSeparator = { guifg = c.line }

  hi.Normal = {
    guifg = c.base05,
    guibg = c.base00,
  }

  hi.Bold = {
    bold = true,
  }

  hi.Debug = {
    guifg = c.base08,
  }

  hi.Directory = {
    guifg = c.base0D,
  }

  hi.Error = {
    guifg = c.base00,
    guibg = c.base08,
  }

  hi.ErrorMsg = {
    guifg = c.base08,
    guibg = c.base00,
  }

  hi.Exception = {
    guifg = c.base08,
  }

  hi.FoldColumn = {
    guifg = c.base0C,
    guibg = c.base01,
  }

  hi.Folded = {
    guifg = c.light_grey,
    guibg = c.black2,
  }

  hi.IncSearch = {
    guifg = c.base01,
    guibg = c.base09,
  }

  hi.Italic = {
    italic = true,
  }

  hi.Macro = {
    guifg = c.base08,
  }

  hi.ModeMsg = {
    guifg = c.base0B,
  }

  hi.MoreMsg = {
    guifg = c.base0B,
  }

  hi.Question = {
    guifg = c.base0D,
  }

  hi.Search = {
    guifg = c.base01,
    guibg = c.base0A,
  }

  hi.Substitute = {
    guifg = c.base01,
    guibg = c.base0A,
    sp = "none",
  }

  hi.SpecialKey = {
    guifg = c.base03,
  }

  hi.TooLong = {
    guifg = c.base08,
  }

  hi.UnderLined = {
    underline = true,
  }

  hi.Visual = {
    guibg = c.base02,
  }

  hi.VisualNOS = {
    guifg = c.base08,
  }

  hi.WarningMsg = {
    guifg = c.base08,
  }

  hi.WildMenu = {
    guifg = c.base08,
    guibg = c.base0A,
  }

  hi.Title = {
    guifg = c.base0D,
    sp = "none",
  }

  hi.Conceal = {
    guibg = "NONE",
  }

  hi.Cursor = {
    guifg = c.base00,
    guibg = c.base05,
  }

  hi.NonText = {
    guifg = c.base03,
  }

  hi.SignColumn = {
    guifg = c.base03,
    sp = "NONE",
  }

  hi.ColorColumn = {
    guibg = c.base01,
    sp = "none",
  }

  hi.CursorColumn = {
    guibg = c.base01,
    sp = "none",
  }

  hi.CursorLine = {
    guibg = "none",
    sp = "none",
  }

  hi.QuickFixLine = {
    guibg = c.base01,
    sp = "none",
  }

  -- spell
  hi.SpellBad = {
    undercurl = true,
    sp = c.base08,
  }

  hi.SpellLocal = {
    undercurl = true,
    sp = c.base0C,
  }

  hi.SpellCap = {
    undercurl = true,
    sp = c.base0D,
  }

  hi.SpellRare = {
    undercurl = true,
    sp = c.base0E,
  }

  hi.healthSuccess = {
    guibg = c.green,
    guifg = c.black,
  }

  -- lazy.nvim
  hi.LazyH1 = {
    guibg = c.green,
    guifg = c.black,
  }

  hi.LazyButton = {
    guibg = c.one_bg,
    guifg = c.light_grey,
  }

  hi.LazyH2 = {
    guifg = c.red,
    bold = true,
    underline = true,
  }

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

  -- }}}
  -- integrations/devicons.lua {{{

  hi.DevIconDefault = { guifg = c.red }
  hi.DevIconc = { guifg = c.blue }
  hi.DevIconcss = { guifg = c.blue }
  hi.DevIcondeb = { guifg = c.cyan }
  hi.DevIconDockerfile = { guifg = c.cyan }
  hi.DevIconhtml = { guifg = c.baby_pink }
  hi.DevIconjpeg = { guifg = c.dark_purple }
  hi.DevIconjpg = { guifg = c.dark_purple }
  hi.DevIconjs = { guifg = c.sun }
  hi.DevIconkt = { guifg = c.orange }
  hi.DevIconlock = { guifg = c.red }
  hi.DevIconlua = { guifg = c.blue }
  hi.DevIconmp3 = { guifg = c.white }
  hi.DevIconmp4 = { guifg = c.white }
  hi.DevIconout = { guifg = c.white }
  hi.DevIconpng = { guifg = c.dark_purple }
  hi.DevIconpy = { guifg = c.cyan }
  hi.DevIcontoml = { guifg = c.blue }
  hi.DevIconts = { guifg = c.teal }
  hi.DevIconttf = { guifg = c.white }
  hi.DevIconrb = { guifg = c.pink }
  hi.DevIconrpm = { guifg = c.orange }
  hi.DevIconvue = { guifg = c.vibrant_green }
  hi.DevIconwoff = { guifg = c.white }
  hi.DevIconwoff2 = { guifg = c.white }
  hi.DevIconxz = { guifg = c.sun }
  hi.DevIconzip = { guifg = c.sun }
  hi.DevIconZig = { guifg = c.orange }
  hi.DevIconMd = { guifg = c.blue }
  hi.DevIconTSX = { guifg = c.blue }
  hi.DevIconJSX = { guifg = c.blue }
  hi.DevIconSvelte = { guifg = c.red }
  hi.DevIconJava = { guifg = c.orange }
  hi.DevIconDart = { guifg = c.cyan }

  -- }}}
  -- integrations/git.lua {{{

  hi.diffOldFile = {
    guifg = c.baby_pink,
  }

  hi.diffNewFile = {
    guifg = c.blue,
  }

  hi.DiffAdd = {
    guifg = c.blue,
  }

  hi.DiffAdded = {
    guifg = c.green,
  }

  hi.DiffChange = {
    guifg = c.light_grey,
  }

  hi.DiffChangeDelete = {
    guifg = c.red,
  }

  hi.DiffModified = {
    guifg = c.orange,
  }

  hi.DiffDelete = {
    guifg = c.red,
  }

  hi.DiffRemoved = {
    guifg = c.red,
  }

  hi.DiffText = {
    guifg = c.white,
    guibg = c.black2,
  }

  -- git commits
  hi.gitcommitOverflow = {
    guifg = c.base08,
  }

  hi.gitcommitSummary = {
    guifg = c.base0B,
  }

  hi.gitcommitComment = {
    guifg = c.base03,
  }

  hi.gitcommitUntracked = {
    guifg = c.base03,
  }

  hi.gitcommitDiscarded = {
    guifg = c.base03,
  }

  hi.gitcommitSelected = {
    guifg = c.base03,
  }

  hi.gitcommitHeader = {
    guifg = c.base0E,
  }

  hi.gitcommitSelectedType = {
    guifg = c.base0D,
  }

  hi.gitcommitUnmergedType = {
    guifg = c.base0D,
  }

  hi.gitcommitDiscardedType = {
    guifg = c.base0D,
  }

  hi.gitcommitBranch = {
    guifg = c.base09,
    bold = true,
  }

  hi.gitcommitUntrackedFile = {
    guifg = c.base0A,
  }

  hi.gitcommitUnmergedFile = {
    guifg = c.base08,
    bold = true,
  }

  hi.gitcommitDiscardedFile = {
    guifg = c.base08,
    bold = true,
  }

  hi.gitcommitSelectedFile = {
    guifg = c.base0B,
    bold = true,
  }

  -- }}}
  -- integrations/lsp.lua {{{

  -- LSP References
  hi.LspReferenceText = { guifg = c.darker_black, guibg = c.white }
  hi.LspReferenceRead = { guifg = c.darker_black, guibg = c.white }
  hi.LspReferenceWrite = { guifg = c.darker_black, guibg = c.white }

  -- Lsp Diagnostics
  hi.DiagnosticHint = { guifg = c.purple }
  hi.DiagnosticError = { guifg = c.red }
  hi.DiagnosticWarn = { guifg = c.yellow }
  hi.DiagnosticInformation = { guifg = c.green }
  hi.LspSignatureActiveParameter = { guifg = c.black, guibg = c.green }

  hi.RenamerTitle = { guifg = c.black, guibg = c.red }
  hi.RenamerBorder = { guifg = c.red }

  -- }}}
  -- integrations/mason.lua {{{

  hi.MasonHeader = { guibg = c.red, guifg = c.black }
  hi.MasonHighlight = { guifg = c.blue }
  hi.MasonHighlightBlock = { guifg = c.black, guibg = c.green }
  hi.MasonHighlightBlockBold = { link = "MasonHighlightBlock" }
  hi.MasonHeaderSecondary = { link = "MasonHighlightBlock" }
  hi.MasonMuted = { guifg = c.light_grey }
  hi.MasonMutedBlock = { guifg = c.light_grey, guibg = c.one_bg }

  -- }}}
  -- integrations/nvimtree.lua {{{

  hi.NvimTreeEmptyFolderName = { guifg = c.folder_bg }
  hi.NvimTreeEndOfBuffer = { guifg = c.darker_black }
  hi.NvimTreeFolderIcon = { guifg = c.folder_bg }
  hi.NvimTreeFolderName = { guifg = c.folder_bg }
  hi.NvimTreeFolderArrowOpen = { guifg = c.folder_bg }
  hi.NvimTreeFolderArrowClosed = { guifg = c.grey_fg }
  hi.NvimTreeGitDirty = { guifg = c.red }
  hi.NvimTreeIndentMarker = { guifg = c.grey_fg }
  hi.NvimTreeNormal = { guibg = c.darker_black }
  hi.NvimTreeNormalNC = { guibg = c.darker_black }
  hi.NvimTreeOpenedFolderName = { guifg = c.folder_bg }
  hi.NvimTreeGitIgnored = { guifg = c.light_grey }

  hi.NvimTreeWinSeparator = {
    guifg = c.darker_black,
    guibg = c.darker_black,
  }

  hi.NvimTreeWindowPicker = {
    guifg = c.red,
    guibg = c.black2,
  }

  hi.NvimTreeCursorLine = {
    guibg = c.black2,
  }

  hi.NvimTreeGitNew = {
    guifg = c.yellow,
  }

  hi.NvimTreeGitDeleted = {
    guifg = c.red,
  }

  hi.NvimTreeSpecialFile = {
    guifg = c.yellow,
    bold = true,
  }

  hi.NvimTreeRootFolder = {
    guifg = c.red,
    bold = true,
  }

  -- }}}
  -- integrations/statusline.lua {{{

  hi.St_lspError = {
    guifg = c.red,
    guibg = statusline_guibg,
  }

  hi.St_lspWarning = {
    guifg = c.yellow,
    guibg = statusline_guibg,
  }

  hi.St_LspHints = {
    guifg = c.purple,
    guibg = statusline_guibg,
  }

  hi.St_LspInfo = {
    guifg = c.green,
    guibg = statusline_guibg,
  }

  hi.StatusLine = {
    guibg = statusline_guibg,
  }

  hi.St_gitIcons = {
    guifg = light_grey,
    guibg = statusline_guibg,
    bold = true,
  }

  hi.St_LspStatus = {
    guifg = c.nord_blue,
    guibg = statusline_guibg,
  }

  hi.St_LspProgress = {
    guifg = c.green,
    guibg = statusline_guibg,
  }

  hi.St_LspStatus_Icon = {
    guifg = c.black,
    guibg = c.nord_blue,
  }

  hi.St_EmptySpace = {
    guifg = c.grey,
    guibg = c.lightbg,
  }

  hi.St_EmptySpace2 = {
    guifg = c.grey,
    guibg = statusline_guibg,
  }

  hi.St_file_info = {
    guibg = c.lightbg,
    guifg = c.white,
  }

  hi.St_file_sep = {
    guibg = statusline_guibg,
    guifg = c.lightbg,
  }

  hi.St_cwd_icon = {
    guifg = c.one_bg,
    guibg = c.red,
  }

  hi.St_cwd_text = {
    guifg = c.white,
    guibg = c.lightbg,
  }

  hi.St_cwd_sep = {
    guifg = c.red,
    guibg = statusline_guibg,
  }

  hi.St_pos_sep = {
    guifg = c.green,
    guibg = c.lightbg,
  }

  hi.St_pos_icon = {
    guifg = c.black,
    guibg = c.green,
  }

  hi.St_pos_text = {
    guifg = c.green,
    guibg = c.lightbg,
  }

  if statusline_style == "vscode" then
    hi.StatusLine = {
      guifg = light_grey,
      guibg = statusline_guibg,
    }

    hi.St_Mode = {
      guifg = light_grey,
      guibg = c.one_bg3,
    }

    hi.StText = {
      guifg = light_grey,
      guibg = statusline_guibg,
    }
  elseif statusline_style == "vscode_colored" then
    hi.StatusLine = {
      guifg = light_grey,
      guibg = statusline_guibg,
    }

    hi.StText = {
      guifg = light_grey,
      guibg = statusline_guibg,
    }

    -- LSP
    hi.St_lspError = {
      guifg = c.red,
      guibg = statusline_guibg,
      bold = true,
    }

    hi.St_lspWarning = {
      guifg = c.yellow,
      guibg = statusline_guibg,
      bold = true,
    }

    hi.St_LspHints = {
      guifg = c.purple,
      guibg = statusline_guibg,
      bold = true,
    }

    hi.St_LspInfo = {
      guifg = c.green,
      guibg = statusline_guibg,
      bold = true,
    }

    hi.St_LspStatus = {
      guifg = c.green,
      guibg = statusline_guibg,
    }

    hi.St_LspProgress = {
      guifg = c.red,
      guibg = statusline_guibg,
    }

    hi.St_cwd = {
      guifg = c.red,
      guibg = c.one_bg3,
    }

    hi.St_encode = {
      guifg = c.orange,
      guibg = statusline_guibg,
    }

    hi.St_ft = {
      guifg = c.blue,
      guibg = statusline_guibg,
    }
  elseif statusline_style == "minimal" then
    hi.StatusLine = {
      guibg = "none",
    }

    hi.St_gitIcons = {
      guifg = light_grey,
      guibg = "none",
      bold = true,
    }

    -- LSP
    hi.St_lspError = {
      guifg = c.red,
      guibg = "none",
    }

    hi.St_lspWarning = {
      guifg = c.yellow,
      guibg = "none",
    }

    hi.St_LspHints = {
      guifg = c.purple,
      guibg = "none",
    }

    hi.St_LspInfo = {
      guifg = c.green,
      guibg = "none",
    }

    hi.St_LspProgress = {
      guifg = c.green,
      guibg = "none",
    }

    hi.St_LspStatus_Icon = {
      guifg = c.black,
      guibg = c.nord_blue,
    }

    hi.St_EmptySpace = {
      guifg = c.black,
      guibg = "none",
    }

    hi.St_EmptySpace2 = {
      guifg = c.black,
    }

    hi.St_file_info = {
      guifg = c.white,
      guibg = "none",
    }

    hi.St_file_sep = {
      guifg = c.black,
      guibg = "none",
    }

    hi.St_sep_r = {
      guifg = c.one_bg,
      guibg = "none",
    }
  end

  -- }}}
  -- integrations/syntax.lua {{{

  hi.Boolean = {
    guifg = c.base09,
  }

  hi.Character = {
    guifg = c.base08,
  }

  hi.Conditional = {
    guifg = c.base0E,
  }

  hi.Constant = {
    guifg = c.base08,
  }

  hi.Define = {
    guifg = c.base0E,
    sp = "none",
  }

  hi.Delimiter = {
    guifg = c.base0F,
  }

  hi.Float = {
    guifg = c.base09,
  }

  hi.Variable = {
    guifg = c.base05,
  }

  hi.Function = {
    guifg = c.base0D,
  }

  hi.Identifier = {
    guifg = c.base08,
    sp = "none",
  }

  hi.Include = {
    guifg = c.base0D,
  }

  hi.Keyword = {
    guifg = c.base0E,
  }

  hi.Label = {
    guifg = c.base0A,
  }

  hi.Number = {
    guifg = c.base09,
  }

  hi.Operator = {
    guifg = c.base05,
    sp = "none",
  }

  hi.PreProc = {
    guifg = c.base0A,
  }

  hi.Repeat = {
    guifg = c.base0A,
  }

  hi.Special = {
    guifg = c.base0C,
  }

  hi.SpecialChar = {
    guifg = c.base0F,
  }

  hi.Statement = {
    guifg = c.base08,
  }

  hi.StorageClass = {
    guifg = c.base0A,
  }

  hi.String = {
    guifg = c.base0B,
  }

  hi.Structure = {
    guifg = c.base0E,
  }

  hi.Tag = {
    guifg = c.base0A,
  }

  hi.Todo = {
    guifg = c.base0A,
    guibg = c.base01,
  }

  hi.Type = {
    guifg = c.base0A,
    sp = "none",
  }

  hi.Typedef = {
    guifg = c.base0A,
  }

  -- }}}
  -- integrations/telescope.lua {{{

  hi.TelescopePromptPrefix = {
    guifg = c.red,
    guibg = c.black2,
  }

  hi.TelescopeNormal = { guibg = c.darker_black }

  hi.TelescopePreviewTitle = {
    guifg = c.black,
    guibg = c.green,
  }

  hi.TelescopePromptTitle = {
    guifg = c.black,
    guibg = c.red,
  }

  hi.TelescopeSelection = { guibg = c.black2, guifg = c.white }
  hi.TelescopeResultsDiffAdd = { guifg = c.green }
  hi.TelescopeResultsDiffChange = { guifg = c.yellow }
  hi.TelescopeResultsDiffDelete = { guifg = c.red }

  if teleascope_style == "bordered" then
    hi.TelescopeBorder = { guifg = c.darker_black, guibg = c.darker_black }
    hi.TelescopePromptBorder = { guifg = c.black2, guibg = c.black2 }
    hi.TelescopePromptNormal = { guifg = c.white, guibg = c.black2 }
    hi.TelescopeResultsTitle = { guifg = c.darker_black, guibg = c.darker_black }
    hi.TelescopePromptPrefix = { guifg = c.red, guibg = c.black2 }
  elseif teleascope_style == "borderless" then
    hi.TelescopeBorder = { guifg = c.one_bg3 }
    hi.TelescopePromptBorder = { guifg = c.one_bg3 }
    hi.TelescopeResultsTitle = { guifg = c.black, guibg = c.green }
    hi.TelescopePreviewTitle = { guifg = c.black, guibg = c.blue }
    hi.TelescopePromptPrefix = { guifg = c.red, guibg = c.black }
    hi.TelescopeNormal = { guibg = c.black }
    hi.TelescopePromptNormal = { guibg = c.black }
  end

  -- }}}
  -- integrations/treesitter.lua {{{

  -- `@annotation` is not one of the default capture group, should we keep it
  hi["@annotation"] = {
    guifg = c.base0F,
  }

  hi["@attribute"] = {
    guifg = c.base0A,
  }

  hi["@character"] = {
    guifg = c.base08,
  }

  hi["@constructor"] = {
    guifg = c.base0C,
  }

  hi["@constant"] = {
    guifg = c.base08,
  }

  hi["@constant.builtin"] = {
    guifg = c.base09,
  }

  hi["@constant.macro"] = {
    guifg = c.base08,
  }

  hi["@error"] = {
    guifg = c.base08,
  }

  hi["@exception"] = {
    guifg = c.base08,
  }

  hi["@float"] = {
    guifg = c.base09,
  }

  hi["@keyword"] = {
    guifg = c.base0E,
  }

  hi["@keyword.function"] = {
    guifg = c.base0E,
  }

  hi["@keyword.return"] = {
    guifg = c.base0E,
  }

  hi["@function"] = {
    guifg = c.base0D,
  }

  hi["@function.builtin"] = {
    guifg = c.base0D,
  }

  hi["@function.macro"] = {
    guifg = c.base08,
  }

  hi["@function.call"] = {
    guifg = c.base0D,
  }

  hi["@operator"] = {
    guifg = c.base05,
  }

  hi["@keyword.operator"] = {
    guifg = c.base0E,
  }

  hi["@method"] = {
    guifg = c.base0D,
  }

  hi["@method.call"] = {
    guifg = c.base0D,
  }

  hi["@namespace"] = {
    guifg = c.base08,
  }

  hi["@none"] = {
    guifg = c.base05,
  }

  hi["@parameter"] = {
    guifg = c.base08,
  }

  hi["@reference"] = {
    guifg = c.base05,
  }

  hi["@punctuation.bracket"] = {
    guifg = c.base0F,
  }

  hi["@punctuation.delimiter"] = {
    guifg = c.base0F,
  }

  hi["@punctuation.special"] = {
    guifg = c.base08,
  }

  hi["@string"] = {
    guifg = c.base0B,
  }

  hi["@string.regex"] = {
    guifg = c.base0C,
  }

  hi["@string.escape"] = {
    guifg = c.base0C,
  }

  hi["@string.special"] = {
    guifg = c.base0C,
  }

  hi["@symbol"] = {
    guifg = c.base0B,
  }

  hi["@tag"] = {
    link = "Tag",
  }

  hi["@tag.attribute"] = {
    link = "@property",
  }

  hi["@tag.delimiter"] = {
    guifg = c.base0F,
  }

  hi["@text"] = {
    guifg = c.base05,
  }

  hi["@text.strong"] = {
    bold = true,
  }

  hi["@text.emphasis"] = {
    guifg = c.base09,
  }

  hi["@text.strike"] = {
    guifg = c.base0F,
    strikethrough = true,
  }

  hi["@text.literal"] = {
    guifg = c.base09,
  }

  hi["@text.uri"] = {
    guifg = c.base09,
    underline = true,
  }

  hi["@type.builtin"] = {
    guifg = c.base0A,
  }

  hi["@variable"] = {
    guifg = c.base05,
  }

  hi["@variable.builtin"] = {
    guifg = c.base09,
  }

  -- variable.global

  hi["@definition"] = {
    sp = c.base04,
    underline = true,
  }

  -- TSDefinitionUsage = {
  --   sp = c.base04,
  --   underline = true,
  -- }

  hi["@scope"] = {
    bold = true,
  }

  hi["@field"] = {
    guifg = c.base08,
  }

  hi["@field.key"] = {
    guifg = c.base08,
  }

  hi["@property"] = {
    guifg = c.base08,
  }

  hi["@include"] = {
    link = "Include",
  }

  hi["@conditional"] = {
    link = "Conditional",
  }

  -- }}}
end

return M
