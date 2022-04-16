local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      "package-lock.json",
    },

    mappings = {
      i = {
        ["<ESC>"] = "close",
      },
    },
  },
})

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<leader>a", ":Telescope live_grep<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers theme=ivy<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>m", ":Telescope marks theme=dropdown<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>cc", ":Telescope colorscheme<CR>", opts)

if vim.fn.isdirectory(".git") ~= 0 then
  vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope git_files<CR>", opts)
else
  vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
end
