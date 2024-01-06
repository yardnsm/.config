-- Setup plugins and shit
require("yardnsm.lazy")

require("yardnsm.autocommands")

-- More stuff
require("yardnsm.misc.tab-label").setup()
require("yardnsm.misc.base16-shell").setup()

-- Setup winbar and statusline
require("yardnsm.ui.statusline")
require("yardnsm.ui.winbar")
