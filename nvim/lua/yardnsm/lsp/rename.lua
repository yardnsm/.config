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

    vim.lsp.buf_request(0, "textDocument/rename", position_params, function(err, result, ...)
      print(vim.inspect(result))
      if not result or not result.documentChanges then
        utils.log_warning(
          string.format("[LSP] Could not perform rename: %s -> %s", position_params.oldName, position_params.newName)
        )
        return
      end

      -- Call the native handler
      vim.lsp.handlers["textDocument/rename"](err, result, ...)

      local entries = {}
      local num_files = 0
      local num_updates = 0

      for _, doc in ipairs(result.documentChanges) do
        local bufnr = vim.uri_to_bufnr(doc.textDocument.uri)

        num_files = num_files + 1

        for _, edit in ipairs(doc.edits) do
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

M.setup = function()
  if M.initialized then
    return
  end

  vim.lsp.buf.rename = qf_rename
  M.initialized = true
end

return M
