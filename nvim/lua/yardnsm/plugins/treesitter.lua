return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },

    dependencies = {
      { "nvim-treesitter/playground", after = "nvim-treesitter" },
      { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },
      { "windwp/nvim-ts-autotag", after = "nvim-treesitter" },

      -- automatically close `end` blocks (`endif`, `done`, etc.)
      { "RRethy/nvim-treesitter-endwise", after = "nvim-treesitter" },
    },

    ---@param opts TSConfig
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,

    opts = {

      -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      ensure_installed = "all",

      -- install languages synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- List of parsers to ignore installing
      ignore_install = { "swift", "phpdoc" },

      highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
        disable = { "yaml" },
      },

      playground = {
        enable = true,
      },

      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },

      autotag = {
        enable = true,
      },

      endwise = {
        enable = true,
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,

          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    },
  },
}
