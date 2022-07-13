local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")

telescope.setup({
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
})

telescope.load_extension('fzf')

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>a", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers theme=ivy<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>m", ":Telescope marks theme=dropdown<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>cc", ":Telescope colorscheme<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>h", ":Telescope highlights theme=ivy<CR>", opts)
vim.api.nvim_set_keymap("n", "z=", ":Telescope spell_suggest theme=cursor<CR>", opts)

if vim.fn.isdirectory(".git") ~= 0 then
  vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope git_files<CR>", opts)
else
  vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
end


-- Autocommands

local augroup = vim.api.nvim_create_augroup("Treesitter", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "TelescopePrompt",
  group = augroup,
  callback = function()
    vim.schedule(function()
      vim.wo.cursorline = false
    end)
  end,
})
