-- vim: set foldmethod=marker foldlevel=0:

local M = {}

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return {
    setup = function() end,
  }
end

local navic_status_ok, navic = pcall(require, "nvim-navic")
if not navic_status_ok then
  navic = nil
end

local installer = require("mason-lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local utils = require("yardnsm.utils")

-- List of servers to use, will be installed via mason-lspconfig
local required_servers = {
  "bashls",
  "pyright",
  "sumneko_lua",
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

local function lsp_setup_dianostics()
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
  vim.api.nvim_exec(
    [[
      augroup lsp_info_hl_fix
      autocmd!
      autocmd FileType lspinfo,lsp-installer set winhl=Normal:Normal
      augroup END
    ]],
    false
  )

  -- Borders for :LspInfo
  local lspconfig_window = require("lspconfig.ui.windows")
  lspconfig_window.default_options = { border = 'rounded' }
end

-- }}}
-- Commands {{{

local function lsp_setup_commands()
  vim.api.nvim_create_user_command("Format", function()
    vim.lsp.buf.format()
  end, {})
end

-- }}}
-- Quickfix Rename {{{

local function lsp_setup_rename()
  local function qf_rename()
    local position_params = vim.lsp.util.make_position_params()
    position_params.oldName = vim.fn.expand("<cword>")

    local input_params = {
      prompt = "New name: ",
      default = position_params.oldName,
    }

    vim.ui.input(input_params, function(input)
      if input == nil then
        utils.log_warning("[LSP] Aborted rename")
        return
      end

      position_params.newName = input

      vim.lsp.buf_request(0, "textDocument/rename", position_params, function(err, result, ...)
        if not result or not result.changes then
          utils.log_warning(
            string.format("[LSP] Could not perform rename: %s -> %s", position_params.oldName, position_params.newName)
          )

          return
        end

        vim.lsp.handlers["textDocument/rename"](err, result, ...)

        local entries = {}
        local num_files = 0
        local num_updates = 0

        for uri, edits in pairs(result.changes) do
          num_files = num_files + 1
          local bufnr = vim.uri_to_bufnr(uri)

          for _, edit in ipairs(edits) do
            local start_line = edit.range.start.line + 1
            local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]

            num_updates = num_updates + 1

            table.insert(entries, {
              bufnr = bufnr,
              lnum = start_line,
              col = edit.range.start.character + 1,
              text = line,
            })
          end
        end

        utils.log(
          string.format(
            "[LSP] Renamed %s instance%s in %s file%s. %s",
            num_updates,
            num_updates == 1 and "" or "s",
            num_files,
            num_files == 1 and "" or "s",
            num_files > 1 and "To save them run ':cfdo w'" or ""
          )
        )

        if num_files > 1 then
          utils.qf_populate(entries, "r")
        end
      end)
    end)
  end

  vim.lsp.buf.rename = qf_rename
end

-- }}}

local function lsp_highlight_document(client, bufnr)
  local augroup = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })

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

  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "[g", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]g", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>', opts)

  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>g", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>Format<CR>", opts)
end

local function on_attach(client, bufnr)
  -- Disable formatting if necessary
  if vim.tbl_contains(disable_formatting_on_servers, client.name) then
    client.server_capabilities.document_formatting = false
  end

  lsp_keymaps(bufnr)
  lsp_highlight_document(client, bufnr)

  if navic then
    navic.attach(client, bufnr)
  end
end

local function make_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

  return capabilities
end

M.setup = function()
  lsp_setup_dianostics()
  lsp_setup_handlers()
  lsp_setup_asthetics()
  lsp_setup_commands()
  lsp_setup_rename()

  installer.setup({
    ensure_installed = required_servers,
  })

  -- Make the setup more dynamic. When a server loads, check for an appropriate config file then
  -- load it.
  installer.setup_handlers({
    function(server_name)
      local capabilities = make_capabilities()

      local opts = {
        on_attach = on_attach,
        capabilities = capabilities,
      }

      local lsp_options_status_ok, lsp_options = pcall(require, "yardnsm.lsp.settings." .. server_name)
      if lsp_options_status_ok then
        opts = vim.tbl_deep_extend("force", lsp_options, opts)
      end

      lspconfig[server_name].setup(opts)
    end,
  })
end

return M
