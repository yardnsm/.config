-- Setup plugins and shit
require("yardnsm.lazy")

require("yardnsm.autocommands")

-- Setup LSP
-- Make sure to source these *after* the plugins, as some of them may require it.
require("yardnsm.lsp").setup()
require("yardnsm.lsp.null-ls") -- TODO load inside the plugin's spec?

-- More stuff
require("yardnsm.misc.tab-label").setup()
require("yardnsm.misc.base16-shell").setup()

-- Setup winbar and statusline
require("yardnsm.ui.statusline")
require("yardnsm.ui.winbar")
