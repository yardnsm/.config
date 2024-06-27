local utils = require("yardnsm.utils")

return {
  {
    "JoosepAlviste/nvim-ts-context-commentstring",

    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,

    after = "nvim-treesitter",

    opts = {
      enable = true,
      enable_autocmd = false,
    },

    config = function(_, opts)
      require("ts_context_commentstring").setup(opts)

      -- This is damn ugly..
      utils.hook(vim.filetype, "get_option", function(get_option, filetype, option)
        if option ~= "commentstring" then
          return get_option(filetype, option)
        end

        return require("ts_context_commentstring.internal").calculate_commentstring()
      end)
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
    opts = {},
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    event = utils.merge(utils.LazyFile, { "VeryLazy" }),

    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },

    -- Load treesitter early when opening a file from the cmdline (taken from LazyVim)
    lazy = vim.fn.argc(-1) == 0,

    dependencies = {
      { "nvim-treesitter/playground",                  after = "nvim-treesitter" },
      { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" },

      -- automatically close `end` blocks (`endif`, `done`, etc.)
      { "RRethy/nvim-treesitter-endwise",              after = "nvim-treesitter" },
    },

    ---@type Base46Handler
    setup_base46 = function(c, hi)
      hi["@comment.todo"] = { guifg = c.yellow, guibg = c.darker_black }
      hi["@comment.warning"] = { guifg = c.orange, guibg = c.darker_black }
      hi["@comment.note"] = { guifg = c.blue, guibg = c.darker_black }
      hi["@comment.error"] = { guifg = c.red, guibg = c.darker_black }
    end,

    ---@param opts TSConfig
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,

    opts = {

      -- one of "all", "maintained" (parsers with maintainers), or a list of languages
      ensure_installed = {
        "bash",
        "c",
        "c_sharp",
        "comment",
        "cpp",
        "css",
        "diff",
        "dockerfile",
        "fish",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "luap",
        "make",
        "python",
        "query",
        "ruby",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },

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

      endwise = {
        enable = true,
      },

      incremental_selection = {
        enable = false,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
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

        move = {
          enable = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]p"] = "@parameter.inner",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]P"] = "@parameter.inner",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[p"] = "@parameter.inner",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[P"] = "@parameter.inner",
          },
        },
      },
    },
  },
}
