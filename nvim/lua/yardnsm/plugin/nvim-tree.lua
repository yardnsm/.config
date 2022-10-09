local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup({
  actions = {
    open_file = {
      quit_on_open = true,
      window_picker = {
        enable = false,
      },
    },
  },

  filters = {
    exclude = {
      ".DS_Store",
      "__pycache__",
      ".pyc",
    },
  },

  git = {
    ignore = false,
  },

  renderer = {
    highlight_git = true,

    icons = {
      git_placement = "after",

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
          ignored = "",
        },
      },
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

local is_in_diffview = function()
  return vim.fn.exists("t:diffview_view_initialized") == 1
end

local opts = { silent = true, expr = true }

vim.keymap.set("n", "<leader>/", function()
  return is_in_diffview() and ":DiffviewToggleFiles<CR>" or ":NvimTreeToggle<CR>"
end, opts)

vim.keymap.set("n", "<leader>0", function()
  return is_in_diffview() and ":DiffviewFocusFiles<CR>" or ":NvimTreeFocus<CR>"
end, opts)

vim.keymap.set("n", "<leader><leader>", function()
  return is_in_diffview() and ":DiffviewFocusFiles<CR>" or ":NvimTreeFindFile<CR>"
end, opts)

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
