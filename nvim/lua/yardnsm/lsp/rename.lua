local utils = require("yardnsm.utils")

local M = {}

M.initialized = false

function qf_rename()
  local old_name = vim.fn.expand("<cword>")

  local position_params = vim.lsp.util.make_position_params()
  position_params.oldName = old_name

  local input_params = {
    prompt = 'Rename "' .. old_name .. '" to: ',
    default = old_name,
  }

  vim.ui.input(input_params, function(input)
    if input == nil then
      utils.log_warning("[LSP] Aborted rename")
      return
    end

    position_params.newName = input

    ---@param err lsp.ResponseError
    ---@param result lsp.WorkspaceEdit?
    vim.lsp.buf_request(0, "textDocument/rename", position_params, function(err, result, ...)
      -- Call the native handler
      vim.lsp.handlers["textDocument/rename"](err, result, ...)

      if not result or not (result.changes or result.documentChanges) then
        print(vim.inspect(result))
        utils.log_warning(
          string.format("[LSP] Could not perform rename: %s -> %s", position_params.oldName, position_params.newName)
        )
        return
      end

      local entries = {}
      local num_files = 0
      local num_updates = 0

      ---@type lsp.RenameFile[]
      local renames = {}

      ---@param uri lsp.DocumentUri
      ---@param edits lsp.TextEdit[]
      local function handleTextEdits(uri, edits)
        local newUri = nil

        -- Try to figure out of a rename occured somewhere in the path
        for _, rename in ipairs(renames) do
          if utils.starts_with(uri, rename.oldUri) then
            newUri = rename.newUri .. uri:sub(#rename.oldUri + 1)
          end
        end

        local bufnr = vim.uri_to_bufnr(newUri or uri)

        num_files = num_files + 1

        for _, edit in ipairs(edits) do
          local start_line = edit.range.start.line + 1
          local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]

          num_updates = num_updates + 1

          table.insert(entries, {
            bufnr = bufnr,
            lnum = start_line,
            col = edit.range.start.character + 1,
            text = line .. (newUri and " (file renamed from: " .. vim.uri_to_fname(uri) .. ")" or ""),
          })
        end
      end

      ---@param doc lsp.CreateFile
      local function handleCreateFile(doc)
        local bufnr = vim.uri_to_bufnr(doc.uri)

        table.insert(entries, {
          bufnr = bufnr,
          lnum = 0,
          text = "== File Created ==",
        })
      end

      ---@param doc lsp.RenameFile
      local function handleRenameFile(doc)
        table.insert(renames, doc)
      end

      ---@param doc lsp.DeleteFile
      local function handleDeleteFile(doc)
        local bufnr = vim.uri_to_bufnr(doc.uri)

        table.insert(entries, {
          bufnr = bufnr,
          lnum = 0,
          text = "== File Deleted ==",
        })
      end

      -- Find the creations / deletions / renames first
      for _, doc in ipairs(result.documentChanges or {}) do
        if doc.kind == "create" then
          handleCreateFile(doc)
        elseif doc.kind == "rename" then
          handleRenameFile(doc)
        elseif doc.kind == "delete" then
          handleDeleteFile(doc)
        end
      end

      for uri, textEdits in pairs(result.changes or {}) do
        handleTextEdits(uri, textEdits)
      end

      for _, doc in ipairs(result.documentChanges or {}) do
        if doc.textDocument ~= nil then
          handleTextEdits(doc.textDocument.uri, doc.edits)
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

M.setup = function()
  if M.initialized then
    return
  end

  vim.lsp.buf.rename = qf_rename
  M.initialized = true
end

return M
