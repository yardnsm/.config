-- Setup plugins and shit
require("yardnsm.lazy")

require("yardnsm.autocommands")
require("yardnsm.colorscheme")

-- Setup winbar and statusline
require("yardnsm.ui.winbar").setup()
require("yardnsm.ui.statusline").setup()

-- Setup LSP
-- Make sure to source these *after* the plugins, as some of them may require it.
require("yardnsm.lsp").setup()
require("yardnsm.lsp.null-ls")

-- More stuff
require("yardnsm.misc.tab-label").setup()
