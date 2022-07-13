local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup({
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },

  filters = {
    exclude = {
      ".DS_Store",
      "__pycache__",
      ".pyc",
    },
  },

  renderer = {
    icons = {
      show = {
        file = false,
        folder = false,
      },

      glyphs = {
        git = {
          unstaged = "+",
          staged = "+",
          unmerged = "U",
          renamed = ">",
          untracked = "?",
          deleted = "-",
          ignored = "◌",
        }
      }
    },
  },

  view = {
    mappings = {
      list = {
        { key = "x", action = "close_node" },
        { key = "x", action = "close_node" },
        { key = "m", action = "rename" },
        { key = "r", action = "refresh" },
        { key = "cd", action = "cd" },
        { key = "<C-k>", action = "" },
        { key = "go", action = "preview" },
        { key = "s", action = "vsplit" },
        { key = "i", action = "split" },
      },
    },
  },
})

-- Keymaps

local opts = { silent = true }

vim.keymap.set("n", "<leader>/", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>0", ":NvimTreeFocus<CR>", opts)
vim.keymap.set("n", "<leader><leader>", ":NvimTreeFindFile<CR>", opts)

-- Autocommands

local augroup = vim.api.nvim_create_augroup("nvim_tree_au", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "NvimTree",
  group = augroup,
  callback = function()
    vim.schedule(function()
      vim.wo.signcolumn = "auto"
      vim.wo.winbar = ""
    end)
  end,
})
