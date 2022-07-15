local status_ok, cybu = pcall(require, "cybu")
if not status_ok then
  return
end

cybu.setup({
  style = {
    border = "rounded",
    padding = 4,
  },
})

-- Keymaps

vim.keymap.set("n", "[b", "<Plug>(CybuPrev)")
vim.keymap.set("n", "]b", "<Plug>(CybuNext)")
