-- vim: set foldmethod=marker foldlevel=0:

local augroup = vim.api.nvim_create_augroup("lsp_augroup", { clear = true })

local M = {}

-- List of servers to use, will be installed via mason-lspconfig
M.required_servers = {
  "bashls",
  "pyright",
  "lua_ls",
  "tsserver",
  "vimls",
  "tailwindcss",
  "cssls",
  "graphql",
  "intelephense",
  "jsonls",
  "eslint",
}

-- Disable formatting for certains servers; let null-ls do its thing!
local disable_formatting_on_servers = {
  "tsserver",
  "sumneko_lua",
}

-- Diagnostics {{{

local function lsp_setup_dianostics()
  -- Signs
  local signs = {
    { name = "DiagnosticSignError", text = "E" },
    { name = "DiagnosticSignWarn", text = "W" },
    { name = "DiagnosticSignHint", text = "!" },
    { name = "DiagnosticSignInfo", text = "I" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, {
      texthl = sign.name,
      text = sign.text,
      numhl = "", -- sign.name
    })
  end

  -- Config

  local config = {

    -- Disable virtual text
    virtual_text = false,

    -- Show signs
    signs = {
      active = signs,
      priority = 90,
    },

    update_in_insert = true,
    underline = true,
    severity_sort = true,

    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }
  vim.diagnostic.config(config)
end

-- }}}
-- Handlers {{{

local function lsp_setup_handlers()
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

-- }}}
-- Aesthetics {{{

local function lsp_setup_asthetics()
  -- Fix background in :LspInfo and :LspInstallInfo
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "lspinfo", "lsp-installer" },
    group = augroup,
    callback = function()
      vim.opt_local.winhl = "Normal:Normal"
    end,
  })

  -- Borders for :LspInfo
  local lspconfig_window = require("lspconfig.ui.windows")
  lspconfig_window.default_options = { border = "rounded" }
end

-- }}}
-- Commands {{{

local function lsp_setup_commands()
  vim.api.nvim_create_user_command("Format", function()
    vim.lsp.buf.format()
  end, {})
end

-- }}}

local function lsp_highlight_document(client, bufnr)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      group = augroup,
      callback = function()
        vim.lsp.buf.document_highlight()
      end,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "WinLeave" }, {
      buffer = bufnr,
      group = augroup,
      callback = function()
        vim.lsp.buf.clear_references()
      end,
    })
  end

  vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    buffer = bufnr,
    group = augroup,
    callback = function()
      require("nvim-lightbulb").update_lightbulb()
    end,
  })
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }

  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":Telescope lsp_definitions theme=ivy<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gy", ":Telescope lsp_type_definitions theme=ivy<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":Telescope lsp_implementations theme=ivy<CR>", opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":Telescope lsp_references theme=ivy<CR>", opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua require('renamer').rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "[g", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]g", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>g", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>Format<CR>", opts)
end

M.on_attach = function(client, bufnr)
  -- Disable formatting if necessary
  if vim.tbl_contains(disable_formatting_on_servers, client.name) then
    client.server_capabilities.document_formatting = false
  end

  lsp_keymaps(bufnr)
  lsp_highlight_document(client, bufnr)

  -- Setup navic
  if client.supports_method("textDocument/documentSymbol") then
    local status_ok, navic = pcall(require, "nvim-navic")
    if status_ok then
      navic.attach(client, bufnr)
    end
  end
end

M.make_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    capabilities = cmp_nvim_lsp.default_capabilities()
  end

  return capabilities
end

M.setup = function()
  lsp_setup_dianostics()
  lsp_setup_handlers()
  lsp_setup_asthetics()
  lsp_setup_commands()
end

return M
