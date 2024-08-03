return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "mason.nvim" },
    opts = function(_, opts)
      local null_ls = require("null-ls")

      -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics
      local code_actions = null_ls.builtins.code_actions
      local hover = null_ls.builtins.hover

      opts.sources = vim.list_extend(opts.sources or {}, {
        -- formatting.prettier,
        formatting.stylua,
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.markdownlint,

        diagnostics.zsh,

        -- code_actions.shellcheck,
        -- hover.dictionary,
      })
    end,
  },
}
