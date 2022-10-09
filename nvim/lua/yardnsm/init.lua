-- Speed up startup time of lua plugins
require("yardnsm.plugin.impatient")

require("yardnsm.plugins")

require("yardnsm.autocommands")
require("yardnsm.colorscheme")

-- Setup winbar and statusline
require("yardnsm.ui.winbar").setup()
require("yardnsm.ui.statusline").setup()

-- Setup Plugins
require("yardnsm.plugin.mason")
require("yardnsm.plugin.cybu")
require("yardnsm.plugin.cmp")
require("yardnsm.plugin.navic")
require("yardnsm.plugin.treesitter")
require("yardnsm.plugin.fidget")
require("yardnsm.plugin.telescope")
require("yardnsm.plugin.nvim-autopairs")
require("yardnsm.plugin.luasnip")
require("yardnsm.plugin.nvim-lightbulb")
require("yardnsm.plugin.nvim-tree")
require("yardnsm.plugin.gitsigns")

-- Setup LSP
require("yardnsm.lsp").setup()
require("yardnsm.lsp.null-ls")
