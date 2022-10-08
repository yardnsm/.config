-- Speed up startup time of lua plugins
require("user.plugin.impatient")

require("user.autocommands")
require("user.colorscheme")

-- Setup winbar and statusline
require("user.ui.winbar").setup()
require("user.ui.statusline").setup()

-- Setup Plugins
require("user.plugin.mason")
require("user.plugin.cybu")
require("user.plugin.cmp")
require("user.plugin.navic")
require("user.plugin.treesitter")
require("user.plugin.fidget")
require("user.plugin.telescope")
require("user.plugin.nvim-autopairs")
require("user.plugin.luasnip")
require("user.plugin.nvim-lightbulb")
require("user.plugin.nvim-tree")

-- Setup LSP
require("user.lsp").setup()
require("user.lsp.null-ls")
