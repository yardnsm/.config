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
      -- Find stuff
      -- <leader>f for [f]ind
      { "<leader>ff", ":Telescope find_files<CR>" },
      { "<leader>fa", ":Telescope live_grep<CR>" },
      { "<leader>fg", ":Telescope git_status<CR>" },
      { "<leader>fb", ":Telescope buffers theme=dropdown<CR>" },
      { "<leader>fm", ":Telescope marks theme=dropdown<CR>" },
      { "<leader>fw", "*#:set hlsearch | :Telescope grep_string<CR>" },
      { "<leader>fc", ":Telescope colorscheme<CR>" },
      { "<leader>fh", ":Telescope highlights theme=ivy<CR>" },

      -- Override z= for spell
      { "z=",         ":Telescope spell_suggest theme=cursor<CR>" },

      { "<C-s>",      ":Telescope lsp_dynamic_workspace_symbols<CR>" },
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

          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden", -- allow hidden files

            -- ignore .git
            "-g",
            "!.git/",
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
