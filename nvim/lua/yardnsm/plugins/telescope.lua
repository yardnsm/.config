local augroup = vim.api.nvim_create_augroup("Telescope", { clear = true })

return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },

    cmd = "Telescope",

    keys = {
      { "<leader>a", ":Telescope live_grep<CR>" },
      { "<leader>b", ":Telescope buffers theme=dropdown<CR>" },
      { "<leader>m", ":Telescope marks theme=dropdown<CR>" },
      { "<leader>w", "*#:set hlsearch | :Telescope grep_string<CR>" },
      { "<leader>cc", ":Telescope colorscheme<CR>" },
      { "<leader>h", ":Telescope highlights theme=ivy<CR>" },
      { "z=", ":Telescope spell_suggest theme=cursor<CR>" },
      { "<C-s>", ":Telescope lsp_dynamic_workspace_symbols<CR>" },

      {
        "<C-p>",
        function()
          if vim.fn.isdirectory(".git") ~= 0 then
            return ":Telescope git_files<CR>"
          else
            return ":Telescope find_files<CR>"
          end
        end,
        expr = true,
      },
    },

    ---@param c Base46Table
    ---@param hi HighlightsTable
    setup_base46 = function(c, hi)
      hi.TelescopeMatching = { guifg = c.dark_purple, gui = "bold" }
      hi.TelescopeSelection = { guibg = c.black2, guifg = c.grey_fg }
      hi.TelescopeResultsNormal = { guifg = c.grey_fg, guibg = c.darker_black }
    end,

    config = function(_, opts)
      local telescope = require("telescope")

      telescope.setup(opts)

      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "TelescopePrompt",
        group = augroup,
        callback = function()
          vim.schedule(function()
            vim.wo.cursorline = false
          end)
        end,
      })
    end,

    opts = function()
      local actions = require("telescope.actions")

      return {
        defaults = {
          file_ignore_patterns = {
            "package-lock.json",
          },

          prompt_prefix = " › ",
          selection_caret = "  ",

          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,

              ["<C-h>"] = actions.which_key,

              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,

              -- ["<C-x>"] = actions.file_split,
              -- ["<C-v>"] = actions.file_vsplit,

              ["<ESC>"] = actions.close,
            },
          },
        },

        pickers = {
          buffers = {
            mappings = {
              i = { ["<c-d>"] = actions.delete_buffer },
            },
          },

          live_grep = {
            mappings = {
              i = { ["<c-f>"] = actions.to_fuzzy_refine },
            },
          },
        },

        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_cursor(),
          },
        },
      }
    end,
  },
}
